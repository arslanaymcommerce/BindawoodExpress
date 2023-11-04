view: spree_referee {
  sql_table_name: public.spree_referrals ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: device_id {
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: issued_to_referee {
    type: yesno
    sql: ${TABLE}.issued_to_referee ;;
  }

  dimension: issued_to_referrer {
    type: yesno
    sql: ${TABLE}.issued_to_referrer ;;
  }

  dimension: referee_id {
    type: number
    sql: ${TABLE}.referee_id ;;
  }

  dimension: referrer_id {
    type: number
    sql: ${TABLE}.referrer_id ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: Signup_Referee {
    type: count_distinct
    sql: ${referee_id} ;;
    filters: {
      field: issued_to_referee
      value: "yes"
    }
  }

  measure: First_Order_Referee {
    type: count_distinct
    sql: ${referee_id} ;;
    filters: {
      field: issued_to_referrer
      value: "yes"
    }
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
