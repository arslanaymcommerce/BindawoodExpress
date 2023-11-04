view: spree_drift_carriers {
  sql_table_name: public.spree_drift_carriers ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: api_key {
    type: string
    sql: ${TABLE}."api_key" ;;
  }
  dimension: auth_key {
    type: string
    sql: ${TABLE}."auth_key" ;;
  }
  dimension: base_url {
    type: string
    sql: ${TABLE}."base_url" ;;
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
  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."expires_at" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: provider_class {
    type: string
    sql: ${TABLE}."provider_class" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
