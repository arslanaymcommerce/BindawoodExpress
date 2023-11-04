view: spree_promotion_codes {
  sql_table_name: public.spree_promotion_codes ;;
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
  dimension: promotion_id {
    type: number
    sql: ${TABLE}."promotion_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: value {
    type: string
    sql: ${TABLE}."value" ;;
  }
  dimension: value_arabic {
    type: string
    sql: ${TABLE}."value_arabic" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
