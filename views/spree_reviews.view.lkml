view: spree_reviews {
  sql_table_name: public.spree_reviews ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: approved {
    type: yesno
    sql: ${TABLE}."approved" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: ip_address {
    type: string
    sql: ${TABLE}."ip_address" ;;
  }
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}."location" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }
  dimension: rating {
    type: number
    sql: ${TABLE}."rating" ;;
  }
  dimension: review {
    type: string
    sql: ${TABLE}."review" ;;
  }
  dimension: show_identifier {
    type: yesno
    sql: ${TABLE}."show_identifier" ;;
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
  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
