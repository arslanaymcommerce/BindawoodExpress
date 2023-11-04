view: spree_attachments {
  sql_table_name: public.spree_attachments ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: attachable_id {
    type: number
    sql: ${TABLE}."attachable_id" ;;
  }
  dimension: attachable_type {
    type: string
    sql: ${TABLE}."attachable_type" ;;
  }
  dimension: attachment {
    type: string
    sql: ${TABLE}."attachment" ;;
  }
  dimension: attachment_content_type {
    type: string
    sql: ${TABLE}."attachment_content_type" ;;
  }
  dimension: attachment_file_name {
    type: string
    sql: ${TABLE}."attachment_file_name" ;;
  }
  dimension: attachment_type {
    type: string
    sql: ${TABLE}."attachment_type" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, attachment_file_name]
  }
}
