view: spree_unit_cancels {
  sql_table_name: public.spree_unit_cancels ;;
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
  dimension: created_by {
    type: string
    sql: ${TABLE}."created_by" ;;
  }
  dimension: inventory_unit_id {
    type: number
    sql: ${TABLE}."inventory_unit_id" ;;
  }
  dimension: reason {
    type: string
    sql: ${TABLE}."reason" ;;
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
