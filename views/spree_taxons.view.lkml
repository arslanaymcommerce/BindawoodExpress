view: spree_taxons {
  sql_table_name: public.spree_taxons ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: background_image_ar_content_type {
    type: string
    sql: ${TABLE}."background_image_ar_content_type" ;;
  }
  dimension: background_image_ar_file_name {
    type: string
    sql: ${TABLE}."background_image_ar_file_name" ;;
  }
  dimension: background_image_ar_file_size {
    type: number
    sql: ${TABLE}."background_image_ar_file_size" ;;
  }
  dimension_group: background_image_ar_updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."background_image_ar_updated_at" ;;
  }
  dimension: background_image_en_content_type {
    type: string
    sql: ${TABLE}."background_image_en_content_type" ;;
  }
  dimension: background_image_en_file_name {
    type: string
    sql: ${TABLE}."background_image_en_file_name" ;;
  }
  dimension: background_image_en_file_size {
    type: number
    sql: ${TABLE}."background_image_en_file_size" ;;
  }
  dimension_group: background_image_en_updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."background_image_en_updated_at" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: depth {
    type: number
    sql: ${TABLE}."depth" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."end_time" ;;
  }
  dimension: home_background_image_content_type {
    type: string
    sql: ${TABLE}."home_background_image_content_type" ;;
  }
  dimension: home_background_image_file_name {
    type: string
    sql: ${TABLE}."home_background_image_file_name" ;;
  }
  dimension: home_background_image_file_size {
    type: number
    sql: ${TABLE}."home_background_image_file_size" ;;
  }
  dimension_group: home_background_image_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."home_background_image_updated_at" ;;
  }
  dimension: icon_content_type {
    type: string
    sql: ${TABLE}."icon_content_type" ;;
  }
  dimension: icon_file_name {
    type: string
    sql: ${TABLE}."icon_file_name" ;;
  }
  dimension: icon_file_size {
    type: number
    sql: ${TABLE}."icon_file_size" ;;
  }
  dimension: icon_thumbnail_ar_content_type {
    type: string
    sql: ${TABLE}."icon_thumbnail_ar_content_type" ;;
  }
  dimension: icon_thumbnail_ar_file_name {
    type: string
    sql: ${TABLE}."icon_thumbnail_ar_file_name" ;;
  }
  dimension: icon_thumbnail_ar_file_size {
    type: number
    sql: ${TABLE}."icon_thumbnail_ar_file_size" ;;
  }
  dimension_group: icon_thumbnail_ar_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."icon_thumbnail_ar_updated_at" ;;
  }
  dimension: icon_thumbnail_en_content_type {
    type: string
    sql: ${TABLE}."icon_thumbnail_en_content_type" ;;
  }
  dimension: icon_thumbnail_en_file_name {
    type: string
    sql: ${TABLE}."icon_thumbnail_en_file_name" ;;
  }
  dimension: icon_thumbnail_en_file_size {
    type: number
    sql: ${TABLE}."icon_thumbnail_en_file_size" ;;
  }
  dimension_group: icon_thumbnail_en_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."icon_thumbnail_en_updated_at" ;;
  }
  dimension_group: icon_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."icon_updated_at" ;;
  }
  dimension: lft {
    type: number
    sql: ${TABLE}."lft" ;;
  }
  dimension: magerecord_category_entity_id {
    type: number
    sql: ${TABLE}."magerecord_category_entity_id" ;;
  }
  dimension: magerecord_category_id {
    type: number
    sql: ${TABLE}."magerecord_category_id" ;;
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
  dimension: parent_id {
    type: number
    sql: ${TABLE}."parent_id" ;;
  }
  dimension: permalink {
    type: string
    sql: ${TABLE}."permalink" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: product_image_tag_ar_content_type {
    type: string
    sql: ${TABLE}."product_image_tag_ar_content_type" ;;
  }
  dimension: product_image_tag_ar_file_name {
    type: string
    sql: ${TABLE}."product_image_tag_ar_file_name" ;;
  }
  dimension: product_image_tag_ar_file_size {
    type: number
    sql: ${TABLE}."product_image_tag_ar_file_size" ;;
  }
  dimension_group: product_image_tag_ar_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."product_image_tag_ar_updated_at" ;;
  }
  dimension: product_image_tag_en_content_type {
    type: string
    sql: ${TABLE}."product_image_tag_en_content_type" ;;
  }
  dimension: product_image_tag_en_file_name {
    type: string
    sql: ${TABLE}."product_image_tag_en_file_name" ;;
  }
  dimension: product_image_tag_en_file_size {
    type: number
    sql: ${TABLE}."product_image_tag_en_file_size" ;;
  }
  dimension_group: product_image_tag_en_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."product_image_tag_en_updated_at" ;;
  }
  dimension: product_listing_background_image_ar_content_type {
    type: string
    sql: ${TABLE}."product_listing_background_image_ar_content_type" ;;
  }
  dimension: product_listing_background_image_ar_file_name {
    type: string
    sql: ${TABLE}."product_listing_background_image_ar_file_name" ;;
  }
  dimension: product_listing_background_image_ar_file_size {
    type: number
    sql: ${TABLE}."product_listing_background_image_ar_file_size" ;;
  }
  dimension_group: product_listing_background_image_ar_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."product_listing_background_image_ar_updated_at" ;;
  }
  dimension: product_listing_background_image_en_content_type {
    type: string
    sql: ${TABLE}."product_listing_background_image_en_content_type" ;;
  }
  dimension: product_listing_background_image_en_file_name {
    type: string
    sql: ${TABLE}."product_listing_background_image_en_file_name" ;;
  }
  dimension: product_listing_background_image_en_file_size {
    type: number
    sql: ${TABLE}."product_listing_background_image_en_file_size" ;;
  }
  dimension_group: product_listing_background_image_en_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."product_listing_background_image_en_updated_at" ;;
  }
  dimension: product_text_tag_ar {
    type: string
    sql: ${TABLE}."product_text_tag_ar" ;;
  }
  dimension: product_text_tag_en {
    type: string
    sql: ${TABLE}."product_text_tag_en" ;;
  }
  dimension: rgt {
    type: number
    sql: ${TABLE}."rgt" ;;
  }
  dimension: scheduled_jobs {
    type: string
    sql: ${TABLE}."scheduled_jobs" ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."start_time" ;;
  }
  dimension: tag_to_show {
    type: string
    sql: ${TABLE}."tag_to_show" ;;
  }
  dimension: taxonomy_id {
    type: number
    sql: ${TABLE}."taxonomy_id" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: visible {
    type: yesno
    sql: ${TABLE}."visible" ;;
  }
  dimension: visible_only_for_subscriber {
    type: yesno
    sql: ${TABLE}."visible_only_for_subscriber" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: taxonname_parent {
    type: string
    sql: (select st.name from  public.spree_taxon_translations st where st.spree_taxon_id = ${TABLE}.parent_id and st.locale = 'en');;
  }


  dimension: parent_taxonname_en {
    type: string
    sql: (select st.name from  public.spree_taxon_translations st where st.spree_taxon_id = ${TABLE}.parent_id and st.locale = 'en');;
  }
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  icon_file_name,
  product_listing_background_image_ar_file_name,
  product_listing_background_image_en_file_name,
  icon_thumbnail_ar_file_name,
  home_background_image_file_name,
  background_image_en_file_name,
  icon_thumbnail_en_file_name,
  product_image_tag_en_file_name,
  background_image_ar_file_name,
  name,
  product_image_tag_ar_file_name,
  spree_taxon_translations.count
  ]
  }

}
