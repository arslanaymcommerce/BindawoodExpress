view: spree_addresses {
  sql_table_name: public.spree_addresses ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: address1 {
    type: string
    sql: ${TABLE}."address1" ;;
  }
  dimension: address2 {
    type: string
    sql: ${TABLE}."address2" ;;
  }
  dimension: address_book_id {
    type: number
    sql: ${TABLE}."address_book_id" ;;
  }
  dimension: alternative_phone {
    type: string
    sql: ${TABLE}."alternative_phone" ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }
  dimension: company {
    type: string
    sql: ${TABLE}."company" ;;
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
  dimension: district_id {
    type: number
    sql: ${TABLE}."district_id" ;;
  }
  dimension: driver_meta_data {
    type: string
    sql: ${TABLE}."driver_meta_data" ;;
  }
  dimension: firstname {
    type: string
    sql: ${TABLE}."firstname" ;;
  }
  dimension: house_number {
    type: string
    sql: ${TABLE}."house_number" ;;
  }
  dimension: lastname {
    type: string
    sql: ${TABLE}."lastname" ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}."latitude" ;;
  }
  dimension: location_changed {
    type: yesno
    sql: ${TABLE}."location_changed" ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}."longitude" ;;
  }
  dimension: magerecord_address_entity_id {
    type: number
    sql: ${TABLE}."magerecord_address_entity_id" ;;
  }
  dimension: magerecord_auto_assigned_salutation {
    type: yesno
    sql: ${TABLE}."magerecord_auto_assigned_salutation" ;;
  }
  dimension: mobile_number_country_code {
    type: string
    sql: ${TABLE}."mobile_number_country_code" ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }
  dimension: salutation {
    type: number
    sql: ${TABLE}."salutation" ;;
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
    drill_fields: [id, firstname, lastname, state_name]
  }
}
