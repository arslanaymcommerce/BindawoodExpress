view: products_arabic {
  derived_table: {
    sql: SELECT
        spree_product_translations.spree_product_id  AS "spree_products_id",
        spree_product_translations.name  AS "spree_product_translations_name",
        spree_product_translations.description  AS "description",
        spree_product_translations.manufacturer  AS "manufacturer",
        spree_product_translations.pack_size  AS "pack_size",
        spree_product_translations.package_description AS "package_description",
            spree_product_translations.pack_unit AS "unit"
      FROM public.spree_product_translations
      where spree_product_translations.locale = 'ar'
      GROUP BY 1,2,3,4,5,6,7
      ORDER BY 1 ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.spree_products_id;;
  }

  dimension: Name{
    type: string
    sql: ${TABLE}.spree_product_translations_name ;;
  }

  dimension: description{
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: manufacturer_ar {
    type: string
    sql: ${TABLE}.manufacturer ;;
  }

  dimension: pack_size{
    type: string
    sql: ${TABLE}.pack_size ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }

  dimension: package_description_ar {
    type: string
    sql: ${TABLE}.package_description ;;
  }

}
