view: spree_store_credits {
  sql_table_name: public.spree_store_credits ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }
  dimension: amount_authorized {
    type: number
    sql: ${TABLE}."amount_authorized" ;;
  }
  dimension: amount_used {
    type: number
    sql: ${TABLE}."amount_used" ;;
  }
  dimension: category_id {
    type: number
    sql: ${TABLE}."category_id" ;;
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
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."expires_at" ;;
  }
  dimension_group: invalidated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."invalidated_at" ;;
  }
  dimension: memo {
    type: string
    sql: ${TABLE}."memo" ;;
  }
  dimension: meta {
    type: string
    sql: ${TABLE}."meta" ;;
  }
  dimension_group: spree_store_credits {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."spree_store_credits" ;;
  }
  dimension: type_id {
    type: number
    sql: ${TABLE}."type_id" ;;
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
  measure: count {
    type: count
    drill_fields: [id]
  }
}
