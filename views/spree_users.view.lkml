view: spree_users {
  derived_table: {
    sql:
        select u.*,s.max_order_date as latest_delivered_order,s.order_count from spree_users u
left join
(select o.user_id,max(o.completed_at) as max_order_date,count(o.id) as order_count  from spree_orders o
left join spree_fulfilments f on f.order_id = o.id
where f.state = 'delivered' and ((((o.completed_at )
>= ((SELECT ((DATE_TRUNC('day', CURRENT_TIMESTAMP AT TIME ZONE 'Asia/Riyadh') +
(-29 || ' day')::INTERVAL) AT TIME ZONE 'Asia/Riyadh'))) AND (o.completed_at )
< ((SELECT (((DATE_TRUNC('day', CURRENT_TIMESTAMP AT TIME ZONE 'Asia/Riyadh')
+ (-29 || ' day')::INTERVAL) + (30 || ' day')::INTERVAL) AT TIME ZONE 'Asia/Riyadh'))))))
group by o.user_id) s on s.user_id = u.id;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: accept_terms_and_conditions {
    type: yesno
    sql: ${TABLE}.accept_terms_and_conditions ;;
  }

  dimension: authentication_token {
    type: string
    sql: ${TABLE}.authentication_token ;;
  }

  dimension: bill_address_id {
    type: number
    sql: ${TABLE}.bill_address_id ;;
  }


  dimension: loyalty_id {
    type: number
    sql: ${TABLE}.loyalty_id ;;
  }
  dimension_group: blacklisted {
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
    sql: ${TABLE}.blacklisted_at ;;
  }

  dimension: blacklisted_reason {
    type: string
    sql: ${TABLE}.blacklisted_reason ;;
  }

  dimension_group: confirmation_sent {
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
    sql: ${TABLE}.confirmation_sent_at ;;
  }

  dimension: confirmation_token {
    type: string
    sql: ${TABLE}.confirmation_token ;;
  }

  dimension_group: confirmed {
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
    sql: ${TABLE}.confirmed_at ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: latest_delivered_order {
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
    sql: ${TABLE}.latest_delivered_order ;;
  }

  dimension: Current_Time{
    convert_tz: yes
    type: date_time
    sql: now();;
  }

  dimension: age{
    type: number
    sql:  date_part('year',age(dob));;
  }


  dimension: age_group {
    case: {
      when: {
        sql: ( ${age} = 0 AND ${age}<= 20) ;;
        label:"Age betwen 0 to 20"}
      when: {
        sql: ( ${age} >= 21 AND ${age}<= 40) ;;
        label:"Age betwen 21 to 40"}
      when: {
        sql: ( ${age} >= 41 AND ${age}<= 60) ;;
        label:"Age betwen 41 to 60"}
      when: {
        sql: (${age} >=61 and ${age} <= 80) ;;
        label: "Age between 61 to 80"}
      when: {
        sql: ( ${age} >= 81 and ${age} <=100) ;;
        label: "Age between 81 to 100"}
      when: {
        sql: ( ${age} >=100 and ${age} <= 120) ;;
        label: "Age between 101 to 120"}
      when: {
        sql: ( ${age} > 120);;
        label: "Invalid Age"}

      else: "No Age Defined"
    }
  }



  dimension: duration_latestorder {
    type: duration_day
    sql_end: ${Current_Time} ;;
    sql_start: ${latest_delivered_order_time} ;;
  }

  dimension: is_orderswithin_30days {
    type: yesno
    sql: ${duration_latestorder} < 31 ;;
  }

  measure: active_user_count {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: is_orderswithin_30days
      value: "yes"
    }
    drill_fields: [id,email]
  }

  dimension: delivered_order_count {
    type: number
    sql: ${TABLE}.order_count ;;
  }

  dimension: delivered_order_count_tier {
    type: tier
    tiers: [1,2,3,4]
    sql: ${TABLE}.order_count ;;
    style: integer

  }

  dimension_group: current_sign_in {
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
    sql: ${TABLE}.current_sign_in_at ;;
  }

  dimension: current_sign_in_ip {
    type: string
    sql: ${TABLE}.current_sign_in_ip ;;
  }

  dimension: danube_communication_preference_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.danube_communication_preference_id ;;
  }

  dimension: danube_salutation_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.danube_salutation_id ;;
  }

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: encrypted_password {
    type: string
    sql: ${TABLE}.encrypted_password ;;
  }

  dimension: failed_attempts {
    type: number
    sql: ${TABLE}.failed_attempts ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: Name {
    type: string
    sql: CONCAT(${first_name},' ',${last_name}) ;;
  }

  dimension_group: last_notification_seen {
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
    sql: ${TABLE}.last_notification_seen_at ;;
  }

  dimension_group: last_request {
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
    sql: ${TABLE}.last_request_at ;;
  }

  dimension_group: last_sign_in {
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
    sql: ${TABLE}.last_sign_in_at ;;
  }

  dimension_group: dob {
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
    sql: ${TABLE}.dob ;;
  }

  dimension: last_sign_in_ip {
    type: string
    sql: ${TABLE}.last_sign_in_ip ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension_group: locked {
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
    sql: ${TABLE}.locked_at ;;
  }

  dimension: login {
    type: string
    sql: ${TABLE}.login ;;
  }

  dimension: magerecord_auto_assigned_salutation {
    type: yesno
    sql: ${TABLE}.magerecord_auto_assigned_salutation ;;
  }

  dimension: magerecord_customer_entity_id {
    type: number
    sql: ${TABLE}.magerecord_customer_entity_id ;;
  }

  dimension: magerecord_legacy_password_hash {
    type: string
    sql: ${TABLE}.magerecord_legacy_password_hash ;;
  }

  dimension: marketing_communication {
    type: yesno
    sql: ${TABLE}.marketing_communication ;;
  }

  dimension: mobile_phone_number {
    type: string
    sql: ${TABLE}.mobile_phone_number ;;
  }

  dimension: mobile_phone_number_dummy {
    type: string
    sql: '0000000000' ;;
  }


  dimension: password_salt {
    type: string
    sql: ${TABLE}.password_salt ;;
  }

  dimension: perishable_token {
    type: string
    sql: ${TABLE}.perishable_token ;;
  }

  dimension: persistence_token {
    type: string
    sql: ${TABLE}.persistence_token ;;
  }

  dimension_group: remember_created {
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
    sql: ${TABLE}.remember_created_at ;;
  }

  dimension: remember_token {
    type: string
    sql: ${TABLE}.remember_token ;;
  }

  dimension_group: reset_password_sent {
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
    sql: ${TABLE}.reset_password_sent_at ;;
  }

  dimension: reset_password_token {
    type: string
    sql: ${TABLE}.reset_password_token ;;
  }

  dimension: ship_address_id {
    type: number
    sql: ${TABLE}.ship_address_id ;;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  }

  dimension: spree_api_key {
    type: string
    sql: ${TABLE}.spree_api_key ;;
  }

  dimension: spree_api_platform {
    type: string
    sql: ${TABLE}.spree_api_platform ;;
  }

  dimension: unlock_token {
    type: string
    sql: ${TABLE}.unlock_token ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      email,spree_orders.count
    ]
  }
}
