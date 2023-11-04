view: spree_packing{
  derived_table: {
    sql: SELECT * from versions
      where item_type = 'Spree::Fulfilment' AND whodunnit_type = 'Spree::Box::Packer';;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: whodunnit {
    type: number
    sql: ${TABLE}.whodunnit::int;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.whodunnit_type;;
  }


  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: date_of_action {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_of_action ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension: object_changes {
    type: string
    sql: ${TABLE}.object_changes ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }


  dimension: state_changes {
    sql: ${TABLE}.object_changes -> 'state' ;;
  }

  dimension: state_change_dates {
    sql: ${TABLE}.object_changes -> 'updated_at' ;;
  }

  dimension: transition_from_state {
    type:  string
    sql:  ${state_changes} ->> 0 ;;
  }

  dimension_group: transition_from {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql:  (${state_change_dates} ->> 0)::timestamp ;;
  }

  dimension: transition_to_state {
    type:  string
    sql:  ${state_changes} ->> 1 ;;
  }
  dimension: TimeSpent  {
    type: duration_minute
    sql_start: ${transition_from_time} ;;
    sql_end: ${transition_to_time} ;;
  }
  measure: Time_TotalSpent {
    type: sum
    sql: ${TimeSpent} ;;
  }

  measure: Order_Count {
    type: number
    sql: ${spree_orders.count} ;;
  }

  measure: Item_Count {
    type: number
    sql: ${spree_line_items.count} ;;
  }

  measure: Average_TimeSpent_Orders {
    type: number
    sql: ${Time_TotalSpent}/(${Order_Count}) ;;
    value_format: "0.0"
  }
  measure: Average_TimeSpent_Item {
    type: number
    sql: ${Time_TotalSpent}/(${Item_Count}) ;;
    value_format: "0.0"
  }

  measure: packed_at{
    sql: Max(${created_time});;
  }

  dimension_group: transition_to {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql:  (${state_change_dates} ->> 1)::timestamp ;;
  }
}
