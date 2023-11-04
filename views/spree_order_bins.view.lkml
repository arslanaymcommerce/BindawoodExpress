view: spree_order_bins {
  sql_table_name: public.spree_order_bins ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: assignment_id {
    type: number
    sql: ${TABLE}."assignment_id" ;;
  }
  dimension: bin_category_id {
    type: number
    sql: ${TABLE}."bin_category_id" ;;
  }
  dimension: container_id {
    type: number
    sql: ${TABLE}."container_id" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: stack_height {
    type: number
    sql: ${TABLE}."stack_height" ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }
  dimension: unit_number {
    type: number
    sql: ${TABLE}."unit_number" ;;
  }
  dimension: used_space {
    type: number
    sql: ${TABLE}."used_space" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
