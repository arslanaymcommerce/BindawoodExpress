view: spree_option_value_translations {
  sql_table_name: public.spree_option_value_translations ;;
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
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: presentation {
    type: string
    sql: ${TABLE}."presentation" ;;
  }
  dimension: spree_option_value_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_option_value_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, spree_option_values.name, spree_option_values.id]
  }
}
