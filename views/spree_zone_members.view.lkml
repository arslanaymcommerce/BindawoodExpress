view: spree_zone_members {
  sql_table_name: public.spree_zone_members ;;
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
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: zone_id {
    type: number
    sql: ${TABLE}."zone_id" ;;
  }
  dimension: zoneable_id {
    type: number
    sql: ${TABLE}."zoneable_id" ;;
  }
  dimension: zoneable_type {
    type: string
    sql: ${TABLE}."zoneable_type" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
