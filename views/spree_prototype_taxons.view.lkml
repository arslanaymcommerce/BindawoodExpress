view: spree_prototype_taxons {
  sql_table_name: public.spree_prototype_taxons ;;
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
  dimension: prototype_id {
    type: number
    sql: ${TABLE}."prototype_id" ;;
  }
  dimension: taxon_id {
    type: number
    sql: ${TABLE}."taxon_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
