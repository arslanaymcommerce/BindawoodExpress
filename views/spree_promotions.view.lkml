view: spree_promotions {
  sql_table_name: public.spree_promotions ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: advertise {
    type: yesno
    sql: ${TABLE}."advertise" ;;
  }
  dimension: apply_automatically {
    type: yesno
    sql: ${TABLE}."apply_automatically" ;;
  }
  dimension: code {
    type: string
    sql: ${TABLE}."code" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."expires_at" ;;
  }
  dimension: match_policy {
    type: string
    sql: ${TABLE}."match_policy" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: path {
    type: string
    sql: ${TABLE}."path" ;;
  }
  dimension: per_code_usage_limit {
    type: number
    sql: ${TABLE}."per_code_usage_limit" ;;
  }
  dimension: promotion_category_id {
    type: number
    sql: ${TABLE}."promotion_category_id" ;;
  }
  dimension_group: starts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."starts_at" ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: usage_limit {
    type: number
    sql: ${TABLE}."usage_limit" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, spree_promotion_translations.count]
  }
}
