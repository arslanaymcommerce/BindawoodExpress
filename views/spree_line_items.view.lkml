view: spree_line_items {
  sql_table_name: public.spree_line_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: added_after_purchase {
    type: yesno
    sql: ${TABLE}."added_after_purchase" ;;
  }
  dimension: additional_tax_total {
    type: number
    sql: ${TABLE}."additional_tax_total" ;;
  }
  dimension: adjustment_total {
    type: number
    sql: ${TABLE}."adjustment_total" ;;
  }
  dimension: comments {
    type: string
    sql: ${TABLE}."comments" ;;
  }
  dimension: cost_price {
    type: number
    sql: ${TABLE}."cost_price" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: free_sample {
    type: yesno
    sql: ${TABLE}."free_sample" ;;
  }
  dimension: in_stock {
    type: yesno
    sql: ${TABLE}."in_stock" ;;
  }
  dimension: included_tax_total {
    type: number
    sql: ${TABLE}."included_tax_total" ;;
  }
  dimension: inventory_stock_used {
    type: number
    sql: ${TABLE}."inventory_stock_used" ;;
  }
  dimension: offline_price {
    type: number
    sql: ${TABLE}."offline_price" ;;
  }
  dimension: on_sale {
    type: yesno
    sql: ${TABLE}."on_sale" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}."price" ;;
  }
  dimension: promo_total {
    type: number
    sql: ${TABLE}."promo_total" ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}."quantity" ;;
  }
  dimension: removed_after_purchase {
    type: yesno
    sql: ${TABLE}."removed_after_purchase" ;;
  }
  dimension: replaced {
    type: yesno
    sql: ${TABLE}."replaced" ;;
  }
  dimension: replacement {
    type: yesno
    sql: ${TABLE}."replacement" ;;
  }
  dimension: requested_quantity {
    type: number
    sql: ${TABLE}."requested_quantity" ;;
  }
  dimension: tax_category_id {
    type: number
    sql: ${TABLE}."tax_category_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: variant_id {
    type: number
    sql: ${TABLE}."variant_id" ;;

  }

  dimension: bundle_quantity{
    type: number
    sql: ${spree_bundle_products.quantity} ;;
  }

  dimension: childcount{
    type: number
    sql: ${spree_bundle_products.child_count} ;;
  }

  dimension: barcode_1{
    type: string
    sql: ${spree_bundle_products.barcode} ;;
    value_format: "0"
  }

  dimension: barcode_2{
    type: string
    sql: ${spree_product_barcodes.barcode} ;;
    value_format: "0"
  }


  dimension: barcode {
    type: string
    sql: CASE
          WHEN ${barcode_1} IS NULL THEN ${spree_product_barcodes.barcode}
          ELSE ${spree_bundle_products.barcode}
          END;;
  }


  dimension: price_new {
    type: number
    sql: CASE
          WHEN ${barcode_1} IS NULL THEN ${price}
          ELSE ${price}/(${bundle_quantity}*${childcount})
          END;;
    value_format: "0.00"
  }

  dimension: Requested_quantity_new_dimension {
    type: number
    sql: CASE
                   WHEN ${spree_variants.weight_increment} > 0 THEN (${TABLE}.requested_quantity)*100.000/100000
ELSE ${TABLE}.requested_quantity
            END ;;
    value_format: "0.00"
  }

  dimension: Total_quantity_new_dimension {
    type: number
    sql: CASE
                   WHEN ${spree_variants.weight_increment} > 0 THEN (${TABLE}.quantity)*100.000/100000
ELSE ${TABLE}.quantity
            END ;;
    value_format: "0.00"
  }

  measure: outofstockqty{
    type: number
    sql: (${Requested_quantity_new}- ${Total_quantity_new});;
    value_format: "0.00"
  }

  measure: Avg_price {
    type : average
    sql: ${price_new} ;;
    value_format: "0.00"
  }

  measure: outofstockvalue{
    type: number
    sql: (${Requested_quantity_new}- ${Total_quantity_new})*${Avg_price};;
    value_format: "0.00"
  }


  measure: Requested_quantity_new {
    type: sum
    sql: CASE
                   WHEN ${spree_variants.weight_increment} > 0 THEN (${TABLE}.requested_quantity)*100.000/100000
ELSE ${TABLE}.requested_quantity
            END ;;
    value_format: "0.00"
  }

  measure: Total_quantity_new {
    type: sum
    sql: CASE
                   WHEN ${spree_variants.weight_increment} > 0 THEN (${TABLE}.quantity)*100.000/100000
ELSE ${TABLE}.quantity
            END ;;
    value_format: "0.00"
  }


  dimension: Is_picked{
    type: yesno
    sql: ${quantity} <> 0;;

  }
  measure: Total_picked {
    type: count
    filters: {
      field: Is_picked
      value: "yes"
    }
  }

  measure: OOS_items_sales {
    sql: ${price} * ${Requested_quantity_new_dimension} ;;
    type: sum
    value_format: "#,##0.00 \" SAR\""
    filters: {
      field: Is_picked
      value: "no"
    }
    }



  measure: Picked_Percentage{
    type: number
    sql: (${Total_picked}*100.000/NULLIF(${count},0));;
    value_format: "0.00\%"
  }

  measure: OOS_items {
    type: count
    filters: {
      field: Is_picked
      value: "no"
    }
  }


  measure: total_revenue_Net_SAR {
    type: sum
    sql:
    case
      when ${spree_variants.marketingbundle} = 'yes'
      then ${spree_prices.amount} * ${Total_quantity_new_dimension}
      else ${price} * ${Total_quantity_new_dimension}
      end;;
    value_format: "#,##0.00 \" SAR\""
  }






  ##Temp measure
  measure: Cost_90_percent {
    type: number
    sql: CASE
                   WHEN (${total_revenue_Net_SAR}) > 55.55 THEN 50
ELSE ((${total_revenue_Net_SAR})*90)/100
            END ;;
    value_format: "#,##0.00 \" SAR\""
  }

  measure: total_revenue_gross_SAR {
    type: sum
    sql:
    case
      when ${spree_variants.marketingbundle} = 'yes'
      then ${spree_prices.amount} *${Requested_quantity_new_dimension}
      else ${price} * ${Requested_quantity_new_dimension}
      end;;
    value_format: "#,##0.00 \" SAR\""
  }


  measure: total_revenue_gross_SAR_beforesale {
    type: sum
    sql:
    case
      when ${spree_variants.marketingbundle} = 'yes'
      then ${spree_prices.amount} *${Requested_quantity_new_dimension}
      else ${offline_price} * ${Requested_quantity_new_dimension}
      end;;
    value_format: "#,##0.00 \" SAR\""
  }


  dimension: Revenue_gross_SAR {
    type: number
    sql:
    case
      when ${spree_variants.marketingbundle} = 'yes'
      then ${spree_prices.amount} * ${Total_quantity_new_dimension}
      else ${price} * ${Total_quantity_new_dimension}
      end;;
    value_format: "#,##0.00 \" SAR\""
  }

  measure: total_revenue_gross_USD {
    type: number

    sql: ${total_revenue_gross_SAR}/3.75 ;;
    value_format: "#,##0.00 \" USD\""
  }

  measure: total_revenue_gross_USD_beforesale {
    type: number

    sql: ${total_revenue_gross_SAR_beforesale}/3.75 ;;
    value_format: "#,##0.00 \" USD\""
  }

  measure: Aov {
    type: number
    sql: ${total_revenue_gross_USD}/${spree_orders.count};;
    value_format: "#,##0.00 \" USD\""
  }
###############################################################################
  filter: first_period_filter {
    group_label: "Arbitrary Period Comparisons"
    type: date
  }

  filter: second_period_filter {
    group_label: "Arbitrary Period Comparisons"
    type: date
  }

  dimension: days_from_start_first {
    hidden: yes
    type: number
    sql: DATE_PART('day',${spree_orders.completed_date} - {% date_start first_period_filter %} ::timestamp )
      ;;
  }

  dimension: days_from_start_second {
    hidden: yes
    type: number
    sql: DATE_PART('day',${spree_orders.completed_date} - {% date_start second_period_filter %} ::timestamp ) ;;
  }

  dimension: days_from_first_period {
    type: number
    sql:
      CASE
       WHEN ${days_from_start_first} >= 0
       THEN ${days_from_start_first}
       WHEN ${days_from_start_second} >= 0
       THEN ${days_from_start_second}
      END;;
  }

  dimension: previous_period {
    group_label: "Arbitrary Period Comparisons"
    type: string
    sql:
        CASE
          WHEN ${spree_orders.completed_date} >=  {% date_start first_period_filter %}
          AND ${spree_orders.completed_date} <= {% date_end first_period_filter %}
          THEN 'This Period'
          WHEN ${spree_orders.completed_date} >=  {% date_start second_period_filter %}
          AND ${spree_orders.completed_date} <= {% date_end second_period_filter %}
          THEN 'Previous Period'
          END ;;
  }
  #############################################################################

  measure: During_Promotion {
    type: count
    filters: {
      field: previous_period
      value: "This Period"
    }
  }
  measure: Pre_Promotion {
    type: count
    filters: {
      field: previous_period
      value: "Previous Period"
    }
  }

  measure: During_Promotion_Revenue {
    sql: ${price} * ${Requested_quantity_new_dimension} ;;
    type: sum
    filters: {
      field: previous_period
      value: "This Period"
    }
    value_format: "#,##0.00 \" SAR\""
  }
  measure: Pre_Promotion_Revenue {
    sql: ${price} * ${Requested_quantity_new_dimension} ;;
    type: sum
    filters: {
      field: previous_period
      value: "Previous Period"
    }
    value_format: "#,##0.00 \" SAR\""
  }

  measure: Delivered_items{
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: spree_fulfilments.state
      value: "delivered"
    }
    drill_fields: [spree_orders.number]
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
