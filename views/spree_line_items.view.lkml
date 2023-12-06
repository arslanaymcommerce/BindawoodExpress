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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
