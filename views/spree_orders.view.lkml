view: spree_orders {
  derived_table: {
    sql: select * from public.spree_orders
      where supermarket_id in ( select d.id from public.danube_supermarkets d where d.supermarket_type in ( 'regular_and_express', 'express'));;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: additional_tax_total {
    type: number
    sql: ${TABLE}."additional_tax_total" ;;
  }
  dimension: adjustment_total {
    type: number
    sql: ${TABLE}."adjustment_total" ;;
  }
  dimension_group: approved {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."approved_at" ;;
  }
  dimension: approver_id {
    type: number
    sql: ${TABLE}."approver_id" ;;
  }
  dimension: approver_name {
    type: string
    sql: ${TABLE}."approver_name" ;;
  }
  dimension: auto_approved {
    type: yesno
    sql: ${TABLE}."auto_approved" ;;
  }
  dimension: bill_address_id {
    type: number
    sql: ${TABLE}."bill_address_id" ;;
  }
  dimension_group: canceled {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."canceled_at" ;;
  }
  dimension: canceler_id {
    type: number
    sql: ${TABLE}."canceler_id" ;;
  }
  dimension: channel {
    type: string
    sql: ${TABLE}."channel" ;;
  }
  dimension_group: completed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."completed_at" ;;
  }
  dimension: confirmation_delivered {
    type: yesno
    sql: ${TABLE}."confirmation_delivered" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: created_by_id {
    type: number
    sql: ${TABLE}."created_by_id" ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}."currency" ;;
  }
  dimension: delivery_method {
    type: string
    sql: ${TABLE}."delivery_method" ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }
  dimension: frontend_viewable {
    type: yesno
    sql: ${TABLE}."frontend_viewable" ;;
  }
  dimension: guest_token {
    type: string
    sql: ${TABLE}."guest_token" ;;
  }
  dimension: included_tax_total {
    type: number
    sql: ${TABLE}."included_tax_total" ;;
  }
  dimension: is_cartonization_enabled {
    type: yesno
    sql: ${TABLE}."is_cartonization_enabled" ;;
  }
  dimension: is_subscription {
    type: yesno
    sql: ${TABLE}."is_subscription" ;;
  }
  dimension: item_count {
    type: number
    sql: ${TABLE}."item_count" ;;
  }
  dimension: item_total {
    type: number
    sql: ${TABLE}."item_total" ;;
  }
  dimension: last_ip_address {
    type: string
    sql: ${TABLE}."last_ip_address" ;;
  }
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension: magerecord_order_entity_id {
    type: number
    sql: ${TABLE}."magerecord_order_entity_id" ;;
  }
  dimension: meta {
    type: string
    sql: ${TABLE}."meta" ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }
  dimension: offline_invoice_number {
    type: string
    sql: ${TABLE}."offline_invoice_number" ;;
  }
  dimension: order_type {
    type: string
    sql: ${TABLE}."order_type" ;;
  }
  dimension: parent_id {
    type: number
    sql: ${TABLE}."parent_id" ;;
  }
  dimension: payment_amount_received {
    type: number
    sql: ${TABLE}."payment_amount_received" ;;
  }
  dimension: payment_state {
    type: string
    sql: ${TABLE}."payment_state" ;;
  }
  dimension: payment_total {
    type: number
    sql: ${TABLE}."payment_total" ;;
  }
  dimension: promo_total {
    type: number
    sql: ${TABLE}."promo_total" ;;
  }
  dimension: replace_product {
    type: yesno
    sql: ${TABLE}."replace_product" ;;
  }
  dimension: rescheduled {
    type: yesno
    sql: ${TABLE}."rescheduled" ;;
  }
  dimension: ship_address_id {
    type: number
    sql: ${TABLE}."ship_address_id" ;;
  }
  dimension: shipment_state {
    type: string
    sql: ${TABLE}."shipment_state" ;;
  }
  dimension: shipment_total {
    type: number
    sql: ${TABLE}."shipment_total" ;;
  }
  dimension: special_instructions {
    type: string
    sql: ${TABLE}."special_instructions" ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }
  dimension: store_id {
    type: number
    sql: ${TABLE}."store_id" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
  }
  dimension: total {
    type: number
    sql: ${TABLE}."total" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }
  dimension: vat_percentage {
    type: number
    sql: ${TABLE}."vat_percentage" ;;
  }



  measure: Promotion_Total {
    type: sum
    sql: ${promo_total} * -1 ;;
    value_format: "#,##0.00 \" SAR\""
    drill_fields: [number,promo_total]
  }

  measure: Marketing_spend_SAR {
    type: sum
    sql: ${promo_total} * -1 ;;
    value_format: "#,##0.00 \" SAR\""
  }

  measure: Marketing_spend_USD {
    type: sum
    sql: (${promo_total} * -1)/3.75;;
    value_format: "#,##0.00 \" USD\""
  }

  measure: Store_credit{
    type: sum
    sql: ${spree_payments.amount} ;;
    sql_distinct_key: ${spree_payments.id} ;;
    filters: {
      field: spree_payment_method_translations.name
      value: "Store Credit"
    }
    filters: {
      field: spree_payments.state
      value: "-invalid,-void"
    }
    value_format: "#,##0.00 \" SAR\""
  }

  measure: total_revenue {
    type: sum
    sql: ${total} ;;
    value_format: "#,##0.00 \" SAR\""
    filters: {
      field: completed_date
      value: "-NULL"
    }
  }
  measure: Net_revenue {
    type: sum
    sql: ${total} ;;
    value_format: "#,##0.00 \" SAR\""
    filters: {
      field: spree_fulfilments.state
      value: "delivered,delivered_partially_returned"
    }

  }

  measure: Net_revenue_without_SAR {
    type: sum
    sql: ${total} ;;
    value_format: "#,##0.00"
    filters: {
      field: spree_fulfilments.state
      value: "delivered,delivered_partially_returned"
    }

  }

  measure: Amount_received_POD {
    type: sum
    sql_distinct_key: ${spree_payments.id};;
    sql: ${spree_payments.amount} ;;
    filters: {
      field: spree_payment_method_translations.name
      value: "Pay On Delivery"
    }
    filters: {
      field: spree_payments.state
      value: "completed,checkout"
    }
    filters: {
      field: spree_fulfilments.state
      value: "delivered,delivered_partially_returned"
    }
    value_format: "#,##0.00 \" SAR\""
  }

  measure: Amount_received_Credit_Card {
    type: sum
    sql_distinct_key: ${spree_payments.id};;
    sql: ${spree_payments.amount} ;;
    filters: {
      field: spree_payment_methods.id
      value: "4"
    }
    filters: {
      field: credit_payment_state
      value: "yes"
    }
    value_format: "#,##0.00 \" SAR\""
  }

  dimension: credit_payment_state {
    type: yesno
    sql: (${spree_payments.state} = 'completed') or (${spree_payments.state}= 'pending' AND ${spree_fulfilments.state} = 'delivered')  ;;
  }


  measure: transactions_Credit_Card {
    type: count_distinct
    sql_distinct_key: ${spree_payments.id};;
    sql: ${spree_payments.id} ;;
    filters: {
      field: spree_payment_method_translations.name
      value: "Credit Card"
    }
    filters: {
      field: credit_payment_state
      value: "yes"
    }
  }

  measure: Amount_received_Drift_Credit_Payment {
    type: sum
    sql_distinct_key: ${spree_payments.id};;
    sql: ${spree_payments.amount} ;;
    filters: {
      field: spree_payment_method_translations.name
      value: "Drift Credit Payment"
    }
    filters: {
      field: spree_payments.state
      value: "completed"
    }
    value_format: "#,##0.00 \" SAR\""
  }


  measure: Amount_received_apple_pay {
    type: sum
    sql: ${spree_payments.amount} ;;
    filters: {
      field: spree_payment_methods.id
      value: "6,9,11"
    }
    filters: {
      field: spree_payments.state
      value: "completed"
    }
    value_format: "#,##0.00 \" SAR\""
  }

  measure: Amount_received_Tamara {
    type: sum
    sql: ${spree_payments.amount} ;;
    filters: {
      field: spree_payment_method_translations.name
      value: "Tamara"
    }
    filters: {
      field: spree_payments.state
      value: "completed"
    }
    filters: {
      field: spree_fulfilments.state
      value: "delivered,delivered_partially_returned"
    }
    value_format: "#,##0.00 \" SAR\""
  }


  measure: Amount_received_Store_Credit {
    type: sum
    sql: ${spree_payments.amount} ;;
    sql_distinct_key: ${spree_payments.id} ;;
    filters: {
      field: spree_payment_method_translations.name
      value: "Store Credit"
    }
    filters: {
      field: spree_payments.state
      value: "-invalid,-void"
    }
    value_format: "#,##0.00 \" SAR\""
  }
  measure: Cancelled_revenue{
    type: sum
    sql: ${total} ;;
    filters: {
      field: completed_date
      value: "-NULL"
    }
    filters: {
      field: spree_fulfilments.state
      value: "canceled"
    }
    value_format: "#,##0.00 \" SAR\""
  }

  measure: total_revenue_USD {
    type: sum
    sql: ${total}/3.75 ;;
    value_format: "#,##0.00 \" USD\""
  }


  measure: Average_ItemPerOrder{
    type: number
    sql: (100.000*${spree_line_items.count}/${count})/100 ;;
    value_format: "0"

  }


  measure: average_revenue {
    type: average
    sql: ${total}/3.75 ;;
    value_format_name: usd
  }

  measure: average_revenue_SAR {
    type: average
    sql: ${total} ;;
    value_format: "#,##0.00 \" SAR\""
  }

  measure: average_revenue_gross {
    type: number
    sql: ${spree_line_items.total_revenue_gross_USD}/${count};;
    value_format_name: usd
  }

  measure: average_revenue_AlRajhi {
    type: average
    sql: ${total}/3.75 ;;
    filters: {
      field: spree_adjustments.label
      value: "%Rajhi%"
    }
    filters: {
      field: spree_adjustments.promotion_code_id
      value: "NULL"
    }
    filters: {
      field: spree_adjustments.eligible
      value: "yes"
    }
    value_format_name: usd
  }

  measure: average_revenue_AlRajhi_new {
    type: average
    sql: ${total} ;;
    filters: {
      field: spree_adjustments.label
      value: "%Rajhi%"
    }
    filters: {
      field: spree_adjustments.eligible
      value: "yes"
    }
    value_format_name: decimal_2
  }



  measure: Aqeeq{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Aqeeq"
    }
    drill_fields: [number]
  }
  measure: Ebn_Jumaah_Center{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Ebn Jumaah Center"
    }
    drill_fields: [number]
  }

  measure: AlLiwan{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Al Liwan"
    }
    drill_fields: [number]
  }

  measure: Nakhla_Center{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Nakhla Center"
    }drill_fields: [number]
  }
  measure: Panorama_Mall{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Panorama Mall"
    }drill_fields: [number]
  }
  measure: Nuzha{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Nuzha"
    }drill_fields: [number]
  }
  measure: Al_Salam_Mall{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Al Salam Mall"
    }drill_fields: [number]
  }
  measure: Al_Safa{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Al Safa"
    }drill_fields: [number]
  }
  measure: Al_Serafi_Mall{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Al-Serafi Mall"
    }drill_fields: [number]
  }
  measure: Red_Sea_Mall{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Red Sea Mall"
    }drill_fields: [number]
  }
  measure: Khamis_Mushait{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Khamis Mushait"
    }drill_fields: [number]
  }
  measure: AlBuhaira{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "AlBuhaira"
    }drill_fields: [number]
  }

  measure: Tera_Mall{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Tera Mall"
    }drill_fields: [number]
  }

  measure: Al_Badiah_Plaza{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Al Badi'ah Plaza"
    }drill_fields: [number]
  }

  measure: Al_Rawabi_plaza{
    type: count
    filters: {
      field: danube_supermarket_translations.name
      value: "Al Rawabi plaza"
    }drill_fields: [number]
  }

  measure: Item_total_Revenue {
    type: sum
    sql: ${item_total} ;;
    value_format: "#,##0.00 \" SAR\""
    drill_fields: [number]
  }

  measure: Item_total_Revenue_last4weeks {
    type: sum
    sql: ${item_total}/4 ;;
    value_format: "#,##0.00 \" SAR\""
    drill_fields: [number]
  }

  measure: Delivered_Item_total_Revenue {
    type: sum
    sql: ${item_total} ;;
    value_format: "#,##0.00 \" SAR\""
    drill_fields: [number]
    filters: {
      field: spree_fulfilments.state
      value: "delivered"
    }
  }

  dimension: total_Finance {
    type: number
    sql: ${total}-${promo_total} ;;
    value_format: "0.00"
  }

  measure: Adjustment_Total_ {
    type: sum
    sql: ${adjustment_total} ;;
    value_format: "#,##0.00 \" SAR\""
  }

  measure: express_fee {
    type: sum
    sql: ${spree_adjustments.amount} ;;
    filters: {
      field: spree_adjustments.label
      value: "Express Fee"
    }
    filters: {
      field: spree_adjustments.eligible
      value: "yes"
    }
    value_format: "#,##0.00 \" SAR\""
  }

  measure: Adjustment_Total_USD {
    type: sum
    sql: (${adjustment_total}*-1)/3.75 ;;
    value_format: "#,##0.00 \" USD\""
  }

  measure: Promocode_Discount {
    type: sum
    sql: (${promo_total} * -1)/3.75 ;;
    value_format: "#,##0.00 \" USD\""
    filters: {
      field: spree_promotion_codes.value
      value: "-NULL"
    }
    filters: {
      field: spree_adjustments.eligible
      value: "yes"
    }
    filters: {
      field: spree_fulfilments.state
      value: "-canceled"
    }
  }
#Count of orders using promocode
  measure:Promocode {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: spree_adjustments.eligible
      value: "yes"
    }
  }

#Count of Fulfilled orders
  measure:Fulfilled_Orders{
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: spree_fulfilments.state
      value: "delivered"
    }
    drill_fields: [number,payment_type.Payment_types,Total_Paid]
  }


  dimension: Vat_percentage {
    type: number
    sql: ${TABLE}.vat_percentage ;;
  }


  measure: Total {
    type: number
    sql: ${Al_Safa}+${Al_Salam_Mall}+${Al_Serafi_Mall}+${AlBuhaira}+${Red_Sea_Mall}+${Aqeeq}
      +${Panorama_Mall}+${Nakhla_Center}+${Ebn_Jumaah_Center}+${Al_Rawabi_plaza}+${Tera_Mall};;
  }

  measure: Total_Paid {
    type: number
    sql: ${total_revenue}-${Store_credit} ;;
    value_format: "#,##0.00 \" SAR\""
  }

##----------

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
    sql: DATE_PART('day',${completed_date} - {% date_start first_period_filter %} ::timestamp )
      ;;
  }

  dimension: days_from_start_second {
    hidden: yes
    type: number
    sql: DATE_PART('day',${completed_date} - {% date_start second_period_filter %} ::timestamp ) ;;
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

  dimension: period_selected {
    group_label: "Arbitrary Period Comparisons"
    type: string
    sql:
        CASE
          WHEN ${completed_date} >=  {% date_start first_period_filter %}
          AND ${completed_date} <= {% date_end first_period_filter %}
          THEN 'First Period'
          WHEN ${completed_date} >=  {% date_start second_period_filter %}
          AND ${completed_date} <= {% date_end second_period_filter %}
          THEN 'Second Period'
          END ;;
  }

  ###----------------------------------
  measure: total_received_amount{
    type: number
    sql: ${Amount_received_apple_pay}+${Amount_received_Credit_Card}+${Amount_received_Drift_Credit_Payment}
      +${Amount_received_POD} + ${Amount_received_Tamara};;
    value_format: "#,##0.00 \" SAR\""
  }

  dimension_group: first_order_date {
    type: time
    timeframes: [  raw,
      hour,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_week,
      hour_of_day,
      day_of_month,
      day_of_week_index,
      week_of_year,
      time_of_day]
    sql: (select   MIN(NULLIF(ss.completed_at, null)) AS first_order from spree_orders ss where ss.user_id = ${user_id} );;
  }

  dimension_group: between_firstorder {
    type: duration
    intervals: [second]
    sql_start: ${first_order_date_time} ;;
    sql_end: ${completed_time} ;;
  }

  dimension: datediff_1 {
    type: yesno
    sql: ${seconds_between_firstorder} = 0 ;;
  }


  measure: first_Order {
    type: count_distinct
    sql: ${user_id} ;;
    filters: {
      field: datediff_1
      value: "yes"
    }
  }


  measure: Countit {
    type: count
    drill_fields: [order_details*]
  }
  set: order_details {
    fields: [id, number, danube_supermarket_translations.name]
  }


  measure: count {
    type: count
    drill_fields: [id, approver_name]
  }
}
