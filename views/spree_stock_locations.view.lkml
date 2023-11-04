view: spree_stock_locations {
  sql_table_name: public.spree_stock_locations ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: active {
    type: yesno
    sql: ${TABLE}."active" ;;
  }
  dimension: address1 {
    type: string
    sql: ${TABLE}."address1" ;;
  }
  dimension: address2 {
    type: string
    sql: ${TABLE}."address2" ;;
  }
  dimension: admin_name {
    type: string
    sql: ${TABLE}."admin_name" ;;
  }
  dimension: backorderable_default {
    type: yesno
    sql: ${TABLE}."backorderable_default" ;;
  }
  dimension: check_stock_on_transfer {
    type: yesno
    sql: ${TABLE}."check_stock_on_transfer" ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }
  dimension: code {
    type: string
    sql: ${TABLE}."code" ;;
  }
  dimension: country_id {
    type: number
    sql: ${TABLE}."country_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: default {
    type: yesno
    sql: ${TABLE}."default" ;;
  }
  dimension: fulfillable {
    type: yesno
    sql: ${TABLE}."fulfillable" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: propagate_all_variants {
    type: yesno
    sql: ${TABLE}."propagate_all_variants" ;;
  }
  dimension: restock_inventory {
    type: yesno
    sql: ${TABLE}."restock_inventory" ;;
  }
  dimension: state_id {
    type: number
    sql: ${TABLE}."state_id" ;;
  }
  dimension: state_name {
    type: string
    sql: ${TABLE}."state_name" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}."zipcode" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, state_name, admin_name, name]
  }
}
