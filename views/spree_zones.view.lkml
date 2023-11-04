view: spree_zones {
  sql_table_name: public.spree_zones ;;
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
  dimension: default_tax {
    type: yesno
    sql: ${TABLE}."default_tax" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: zone_members_count {
    type: number
    sql: ${TABLE}."zone_members_count" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, danube_slot_to_orders.count]
  }
}
