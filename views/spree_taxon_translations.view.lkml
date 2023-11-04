view: spree_taxon_translations {
  sql_table_name: public.spree_taxon_translations ;;
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
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension: meta_description {
    type: string
    sql: ${TABLE}."meta_description" ;;
  }
  dimension: meta_keywords {
    type: string
    sql: ${TABLE}."meta_keywords" ;;
  }
  dimension: meta_title {
    type: string
    sql: ${TABLE}."meta_title" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: permalink {
    type: string
    sql: ${TABLE}."permalink" ;;
  }
  dimension: spree_taxon_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_taxon_id" ;;
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
	spree_taxons.icon_file_name,
	spree_taxons.product_listing_background_image_ar_file_name,
	spree_taxons.product_listing_background_image_en_file_name,
	spree_taxons.icon_thumbnail_ar_file_name,
	spree_taxons.home_background_image_file_name,
	spree_taxons.background_image_en_file_name,
	spree_taxons.icon_thumbnail_en_file_name,
	spree_taxons.id,
	spree_taxons.product_image_tag_en_file_name,
	spree_taxons.background_image_ar_file_name,
	spree_taxons.name,
	spree_taxons.product_image_tag_ar_file_name
	]
  }

}
