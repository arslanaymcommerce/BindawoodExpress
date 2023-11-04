view: spree_districts {
  sql_table_name: public.spree_districts ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: abbr {
    type: string
    sql: ${TABLE}."abbr" ;;
  }
  dimension: center {
    type: string
    sql: ${TABLE}."center" ;;
  }
  dimension: country_id {
    type: number
    sql: ${TABLE}."country_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: orders_per_batch {
    type: number
    sql: ${TABLE}."orders_per_batch" ;;
  }
  dimension: perform_region_checking {
    type: yesno
    sql: ${TABLE}."perform_region_checking" ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}."rank" ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}."region" ;;
  }
  dimension: state_id {
    type: number
    sql: ${TABLE}."state_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: visible {
    type: yesno
    sql: ${TABLE}."visible" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, spree_district_translations.count]
  }
}
