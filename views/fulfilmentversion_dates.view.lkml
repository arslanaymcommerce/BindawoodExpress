view: fulfilmentversion_dates {
  derived_table: {
    sql:
    SELECT (select max(v1.created_at) from versions v1 where v1.item_id  = v.item_id
      and v1.item_type = 'Spree::Fulfilment'
      and v1.object_changes::text like '%"picking_in_progress", "picked"%') order_picking_time,

      (select max(v2.created_at) from versions v2 where v2.item_id  = v.item_id
      and v2.object_changes::text like '%delivered%'
      and v2.item_type = 'Spree::Fulfilment' ) order_delivered_time,


      (select max(v1.created_at) from versions v1 where v1.item_id  = v.item_id
      and v1.object_changes::text like '%"pending"%'
      and v1.item_type = 'Spree::Fulfilment' ) order_creation_time,
      (select max(v1.created_at) from versions v1 where v1.item_id  = v.item_id
      and v1.object_changes::text like  '%"assigned_to_packer"%'
      and v1.item_type = 'Spree::Fulfilment' ) order_approved_time,
      (select max(v1.created_at) from versions v1 where v1.item_id  = v.item_id
      and v1.object_changes::text like  '%"out_for_delivery"%'
      and v1.item_type = 'Spree::Fulfilment' ) order_arrival_time,
      (select max(v1.created_at) from versions v1 where v1.item_id  = v.item_id
      and v1.object_changes::text like  '%"assigned_to_delivery_batch", "out_for_delivery"%'
      and v1.item_type = 'Spree::Fulfilment' ) order_dispatched_time,
      v.item_id
      from versions v
      group by v.item_id ;;
  }


  dimension: item_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.item_id ;;
  }


  dimension_group: LeadTime_Mints {
    hidden: yes
    type: duration
    intervals: [minute]
    sql_start: ${ordercreationdate_time} ;;
    sql_end: ${orderdelivereddate_time} ;;
  }


  dimension_group: OrdertoPicked {
    hidden: yes
    type: duration
    intervals: [minute]
    sql_start: ${ordercreationdate_time} ;;
    sql_end: ${orderpickingdate_time} ;;
  }

  dimension_group: OrdertoAssigned {
    hidden: yes
    type: duration
    intervals: [minute]
    sql_start: ${ordercreationdate_time} ;;
    sql_end: ${orderapproveddate_time} ;;
  }


  dimension: OrdertoAssignedTime {
    type: number
    sql: ${minutes_OrdertoAssigned} ;;
  }


  dimension_group: AssignedtoPicked {
    hidden: yes
    type: duration
    intervals: [minute]
    sql_start: ${orderapproveddate_time} ;;
    sql_end: ${orderpickingdate_time} ;;
  }

  dimension: AssignedtoPickedTime {
    type: number
    sql: ${minutes_AssignedtoPicked} ;;
  }


  dimension_group: PickedtoDispatch {
    hidden: yes
    type: duration
    intervals: [minute]
    sql_start: ${orderpickingdate_time} ;;
    sql_end: ${orderdispatcheddate_time} ;;
  }



  dimension_group: ShiptoDilivered {
    hidden: yes
    type: duration
    intervals: [minute]
    sql_start: ${orderdispatcheddate_time} ;;
    sql_end: ${orderdelivereddate_time} ;;
  }

  dimension: ShiptoDiliveredTime {
    type: number
    sql: ${minutes_ShiptoDilivered} ;;
  }

  dimension: PickedtoDispatchTime {
    type: number
    sql: ${minutes_PickedtoDispatch} ;;
  }

  dimension_group: OrdertoShipped {
    hidden: yes
    type: duration
    intervals: [minute]
    sql_start: ${ordercreationdate_time} ;;
    sql_end: ${orderdispatcheddate_time} ;;
  }


  dimension: OrdertoPickedTime {
    type: number
    sql: (${minutes_OrdertoPicked}) ;;
  }


  dimension: OrdertoShippedTime {
    type: number
    sql: (${minutes_OrdertoShipped}) ;;
  }

  measure: TotalLeadTime {
    type:number
    sql: sum(${minutes_LeadTime_Mints}) ;;
  }


  dimension: LeadTime {
    type:number
    sql: (${minutes_LeadTime_Mints}) ;;
  }



  dimension_group: orderpickingdate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day
    ]
    sql: ${TABLE}.order_picking_time ;;
  }



  dimension_group: orderdelivereddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day
    ]
    sql: ${TABLE}.order_delivered_time ;;
  }


  dimension_group: ordercreationdate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day
    ]
    sql: ${TABLE}.order_creation_time ;;
  }

  dimension_group: orderapproveddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day
    ]
    sql: ${TABLE}.order_approved_time ;;
  }

  dimension_group: orderarrivaldate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day
    ]
    sql: ${TABLE}.order_arrival_time ;;
  }

  dimension_group: orderdispatcheddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day
    ]
    sql: ${TABLE}.order_dispatched_time ;;
  }







}
