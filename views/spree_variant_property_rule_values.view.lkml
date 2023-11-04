view: spree_variant_property_rule_values {
  sql_table_name: public.spree_variant_property_rule_values ;;
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
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: property_id {
    type: number
    sql: ${TABLE}."property_id" ;;
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
  dimension: variant_property_rule_id {
    type: number
    sql: ${TABLE}."variant_property_rule_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
