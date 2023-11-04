view: user_facts {
  derived_table: {
    sql:
        SELECT
  spree_orders.user_id  AS user_id,
  COUNT(DISTINCT spree_orders.id ) AS lifetime_orders,
  COUNT(DISTINCT case when (spree_fulfilments.state ILIKE 'delivered') then spree_orders.id else null end ) AS lifetime_Delivered_orders,
  MAX(NULLIF(spree_orders.completed_at,null )) AS latest_order,
  MIN(NULLIF(spree_orders.completed_at, null)) AS first_order,
  SUM(spree_orders.total) AS lifetime_revenue,
  COUNT(DISTINCT DATE_TRUNC('month', NULLIF(spree_orders.completed_at,null))) AS number_of_distinct_months_with_orders
FROM public.spree_orders  AS spree_orders
LEFT JOIN public.danube_slot_to_orders  AS danube_slot_to_orders ON spree_orders.id = danube_slot_to_orders.order_id
LEFT JOIN public.danube_time_slots_schedules  AS danube_time_slots_schedules ON danube_slot_to_orders.time_slots_schedule_id = danube_time_slots_schedules.id
LEFT JOIN public.spree_zones  AS spree_zones ON danube_time_slots_schedules.zone_id = spree_zones.id
LEFT JOIN public.danube_supermarkets  AS danube_supermarkets ON spree_zones.id = danube_supermarkets.zone_id
LEFT JOIN public.danube_supermarket_translations  AS danube_supermarket_translations ON danube_supermarkets.id = danube_supermarket_translations.danube_supermarket_id
LEFT JOIN public.spree_fulfilments  AS spree_fulfilments ON spree_fulfilments.order_id = spree_orders.id
where spree_orders.order_type = 'Express'
GROUP BY spree_orders.user_id;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: days_as_customer {
    description: "Days between first and latest order"
    type: duration
    intervals: [day]
    sql_start: ${first_order_date_date} ;;
    sql_end: ${latest_order_date_date};;
  }

  dimension: days_as_customer_tiered {
    type: tier
    tiers: [0, 1, 7, 14, 21, 28, 30, 60, 90, 120]
    sql: ${days_days_as_customer} ;;
    style: integer
  }

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;

  }

  dimension: user_idtxt {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: Sign_up {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${spree_users.created_date} ;;

  }

  dimension: Signup_first_Order {
    type: duration_day
    sql_start: ${Sign_up_date};;
    sql_end: ${first_order_date_date};;
  }



  dimension: lifetime_orders {
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension: lifetime_Delivered_orders {
    type: number
    sql: ${TABLE}.lifetime_Delivered_orders ;;
  }

  dimension: delivered_total {
    type: number
    sql: ${delivered_orders_dt.Delivered_Orders} ;;
  }


  dimension: lifetimenet_revenue {
    type: number
    sql: ${delivered_orders_dt.lifetimenet_revenue} ;;
  }


  dimension: Class {
    case: {
      when: {
        sql: ( ${delivered_total} >= 0 AND ${delivered_total}<= 1000) or ${delivered_total} is null;;
        label:"bronze"}
      when: {
        sql: ${delivered_total}>1000 AND ${delivered_total}<= 2000;;
        label:"Silver"}
      when: {
        sql: ${delivered_total}>2000 AND ${delivered_total}<= 5000;;
        label:"Gold"}

      else: "Platinum"
    }
  }

  dimension: NetRevenue_Class {
    case: {
      when: {
        sql: ( ${lifetimenet_revenue} >= 0 AND ${lifetimenet_revenue}<= 1000) or ${lifetimenet_revenue} is null;;
        label:"bronze"}
      when: {
        sql: ${lifetimenet_revenue}>1000 AND ${lifetimenet_revenue}<= 2000;;
        label:"Silver"}
      when: {
        sql: ${lifetimenet_revenue}>2000 AND ${lifetimenet_revenue}<= 5000;;
        label:"Gold"}

      else: "Platinum"
    }
  }

  dimension: lifetime_revenue {
    type: number
    sql: ${TABLE}.lifetime_revenue ;;
    value_format: "#,##0.00 \" SAR\""
  }


  dimension_group: first_order_date {
    type: time
    timeframes: [
      date,
      raw,
      time,
      week,
      quarter,
      year,
      day_of_week
    ]
    sql: ${TABLE}.first_order ;;
  }

  dimension_group: latest_order_date {
    type: time
    timeframes: [
      date,
      week,
      quarter,
      year,
      day_of_week
    ]sql: ${TABLE}.latest_order ;;
  }

  dimension: OrderDuration {
    type: duration_day
    sql_start: ${TABLE}.latest_order;;
    sql_end: ${Current_Time};;
  }

  dimension:  frequency {
    type: duration_day
    sql_start: ${Sign_up_date};;
    sql_end: ${Current_Time};;
  }

  dimension: last_order_days {
    type: tier
    tiers: [2,8,16,30]
    sql: ${OrderDuration} ;;
    style: integer
  }

  dimension: Current_Time{
    convert_tz: yes
    type: date_time
    sql: now();;
  }

  dimension: Current_Status {
    case: {
      when: {
        sql:  ${OrderDuration}<=30;;
        label:"Active"}
      else: "In Active"
    }
  }


  dimension: number_of_distinct_months_with_orders {
    type: number
    sql: ${TABLE}.number_of_distinct_months_with_orders ;;
  }

  dimension: repeat_customer {
    description: "Lifetime Count of Orders > 1"
    type: yesno
    sql: ${lifetime_orders} > 1 ;;
  }

  dimension: is_first_purchase {
    type: yesno
    sql: ${lifetime_orders} = 1 ;;
  }

  dimension: lifetime_orders_tier {
    type: tier
    tiers: [0, 1, 2, 3, 5, 10]
    sql: ${lifetime_orders} ;;
    style: integer
  }

  dimension: lifetime_revenue_tier {
    type: tier
    tiers: [0, 25, 50, 100, 200, 500, 1000]
    sql: ${lifetime_revenue} ;;
    style: integer
  }

  dimension: order_frequency {
    type: tier
    tiers: [2,8,15,31,91,181,366]
    sql: ${frequency}/${lifetime_orders} ;;
    style: integer
  }


  measure: First_order {
    type: count_distinct
    sql: ${user_id} ;;
    filters: {
      field: is_first_purchase
      value: "yes"
    }
  }

  measure: First_Order_Percentage{
    type: number
    sql: ((${user_facts.First_order}*100.000/119)-100);;
    value_format: "0\%"
  }


  set: detail {
    fields: [
      user_id,
      lifetime_orders,
      lifetime_revenue,
      first_order_date_date,
      latest_order_date_date,
      number_of_distinct_months_with_orders
    ]
  }
}
