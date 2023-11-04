view: spree_payment_method_translations {
  sql_table_name: public.spree_payment_method_translations ;;
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
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: spree_payment_method_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_payment_method_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, spree_payment_methods.name, spree_payment_methods.id]
  }
}
