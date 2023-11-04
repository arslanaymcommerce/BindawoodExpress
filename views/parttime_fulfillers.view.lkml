view: parttime_fulfillers {
  sql_table_name: public.parttime_fulfillers ;;
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
  dimension_group: dob {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DOB" ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
  }
  dimension: gender {
    type: number
    sql: ${TABLE}."gender" ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }
  dimension: nationality {
    type: string
    sql: ${TABLE}."nationality" ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: vehicle_no {
    type: string
    sql: ${TABLE}."vehicle_no" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, first_name, last_name]
  }
}
