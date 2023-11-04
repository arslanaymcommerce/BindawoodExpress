view: spree_internal_attachments {
  sql_table_name: public.spree_internal_attachments ;;
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
  dimension: image_content_type {
    type: string
    sql: ${TABLE}."image_content_type" ;;
  }
  dimension: image_file_name {
    type: string
    sql: ${TABLE}."image_file_name" ;;
  }
  dimension: image_file_size {
    type: number
    sql: ${TABLE}."image_file_size" ;;
  }
  dimension_group: image_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."image_updated_at" ;;
  }
  dimension: ticketable_id {
    type: number
    sql: ${TABLE}."ticketable_id" ;;
  }
  dimension: ticketable_type {
    type: string
    sql: ${TABLE}."ticketable_type" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, image_file_name]
  }
}
