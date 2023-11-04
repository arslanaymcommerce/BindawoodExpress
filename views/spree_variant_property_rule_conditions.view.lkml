view: spree_variant_property_rule_conditions {
  sql_table_name: public.spree_variant_property_rule_conditions ;;
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
  dimension: option_value_id {
    type: number
    sql: ${TABLE}."option_value_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: variant_property_rule_id {
    type: number
    sql: ${TABLE}."variant_property_rule_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
