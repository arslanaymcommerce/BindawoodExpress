view: spree_subscription_plan_accounts_user_addresses {
  sql_table_name: public.spree_subscription_plan_accounts_user_addresses ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: account_id {
    type: number
    sql: ${TABLE}."account_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: is_primary {
    type: yesno
    sql: ${TABLE}."is_primary" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: user_address_id {
    type: number
    sql: ${TABLE}."user_address_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
