view: spree_last_minute_buys {
  sql_table_name: public.spree_last_minute_buys ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."expires_at" ;;
  }
  dimension: match_policy {
    type: string
    sql: ${TABLE}."match_policy" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension_group: starts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."starts_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
