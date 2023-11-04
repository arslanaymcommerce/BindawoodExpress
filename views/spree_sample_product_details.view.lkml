view: spree_sample_product_details {
  sql_table_name: public.spree_sample_product_details ;;
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
  dimension: sample_child_product_id {
    type: number
    sql: ${TABLE}."sample_child_product_id" ;;
  }
  dimension: sample_master_product_id {
    type: number
    sql: ${TABLE}."sample_master_product_id" ;;
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
