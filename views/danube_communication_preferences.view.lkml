view: danube_communication_preferences {
  sql_table_name: public.danube_communication_preferences ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, spree_users.count]
  }
}
