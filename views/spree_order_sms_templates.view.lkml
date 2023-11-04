view: spree_order_sms_templates {
  sql_table_name: public.spree_order_sms_templates ;;
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
  dimension: key {
    type: string
    sql: ${TABLE}."key" ;;
  }
  dimension: template_ar {
    type: string
    sql: ${TABLE}."template_ar" ;;
  }
  dimension: template_en {
    type: string
    sql: ${TABLE}."template_en" ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
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
