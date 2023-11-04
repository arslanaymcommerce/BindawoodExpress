view: spree_relations {
  sql_table_name: public.spree_relations ;;
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
  dimension: discount_amount {
    type: number
    sql: ${TABLE}."discount_amount" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: relatable_id {
    type: number
    sql: ${TABLE}."relatable_id" ;;
  }
  dimension: relatable_type {
    type: string
    sql: ${TABLE}."relatable_type" ;;
  }
  dimension: related_to_id {
    type: number
    sql: ${TABLE}."related_to_id" ;;
  }
  dimension: related_to_type {
    type: string
    sql: ${TABLE}."related_to_type" ;;
  }
  dimension: relation_type_id {
    type: number
    sql: ${TABLE}."relation_type_id" ;;
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
