view: spree_fulfilments {
  sql_table_name: public.spree_fulfilments ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension: Cancellation_Reason {
    case: {
      when: {
        sql: ${TABLE}.cancel_reason = 'customer_request';;
        label:"customer_request"}
      when: {
        sql:  ${TABLE}.cancel_reason = 'no_response';;
        label: "no_response" }
      when: {
        sql:  ${TABLE}.cancel_reason = 'products_out_of_stock';;
        label:"products_out_of_stock"}
      when: {
        sql:  ${TABLE}.cancel_reason = 'incorrect_or_missing_information';;
        label: "incorrect_or_missing_information" }
      when: {
        sql: ${TABLE}.cancel_reason = 'reorder';;
        label:"reorder"}
      when: {
        sql:  ${TABLE}.cancel_reason = 'driver_unable_to_locate_address';;
        label: "driver_unable_to_locate_address" }
      when: {
        sql:  ${TABLE}.cancel_reason = 'out_of_delivery_area';;
        label: "out_of_delivery_area" }
      when: {
        sql:  ${TABLE}.cancel_reason = 'delayed_during_delivery';;
        label: "delayed_during_delivery" }
      when: {
        sql:  ${TABLE}.cancel_reason = 'delayed';;
        label: "delayed" }
      when: {
        sql:  ${TABLE}.cancel_reason is null AND ${state} = 'canceled';;
        label: "cancelled before Picking" }
    }
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: packer_checked_by_step {
    type: number
    sql: ${TABLE}."packer_checked_by_step" ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: fulfilment_Status {
    case: {
      when: {
        sql: ${TABLE}.state = 'arrived';;
        label:"arrived"}
      when: {
        sql:  ${TABLE}.state = 'assigned_to_delivery_batch';;
        label: "assigned_to_delivery_batch" }
      when: {
        sql:  ${TABLE}.state= 'assigned_to_packer';;
        label:"assigned_to_packer"}
      when: {
        sql:  ${Cancellation_Reason} = 'cancelled before Picking' AND ${TABLE}.state = 'canceled';;
        label: "cancelled_before_picking" }
      when: {
        sql:  ${TABLE}.state = 'canceled';;
        label: "cancelled_after_picking" }
      when: {
        sql: ${TABLE}.state = 'delivered';;
        label:"delivered"}
      when: {
        sql:  ${TABLE}.state = 'issue';;
        label: "issue" }
      when: {
        sql:  ${TABLE}.state = 'on_hold';;
        label: "on_hold" }
      when: {
        sql:  ${TABLE}.state= 'out_for_delivery';;
        label: "out_for_delivery" }
      when: {
        sql:  ${TABLE}.state = 'packed';;
        label: "packed" }
      when: {
        sql:  ${TABLE}.state = 'packing_in_progress';;
        label: "packing_in_progress" }
      when: {
        sql:  ${TABLE}.state = 'pending';;
        label: "pending" }
      when: {
        sql:  ${TABLE}.state = 'picked';;
        label: "picked" }
      when: {
        sql:  ${TABLE}.state = 'picking_in_progress';;
        label: "picking_in_progress" }
    }
  }


  measure: count {
    type: count
    drill_fields: [id]
  }
}
