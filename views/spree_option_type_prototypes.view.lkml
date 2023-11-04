view: spree_option_type_prototypes {
  sql_table_name: public.spree_option_type_prototypes ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: option_type_id {
    type: number
    sql: ${TABLE}."option_type_id" ;;
  }
  dimension: prototype_id {
    type: number
    sql: ${TABLE}."prototype_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
