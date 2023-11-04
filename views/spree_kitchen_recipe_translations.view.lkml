view: spree_kitchen_recipe_translations {
  sql_table_name: public.spree_kitchen_recipe_translations ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: cooking_time {
    type: string
    sql: ${TABLE}."cooking_time" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: recipe {
    type: string
    sql: ${TABLE}."recipe" ;;
  }
  dimension: spree_kitchen_recipe_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_kitchen_recipe_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	name,
	spree_kitchen_recipes.banner_file_name,
	spree_kitchen_recipes.home_icon_file_name,
	spree_kitchen_recipes.id,
	spree_kitchen_recipes.display_image_file_name
	]
  }

}
