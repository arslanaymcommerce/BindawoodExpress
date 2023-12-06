view: bundle_quantity {
  derived_table: {
    sql: SELECT
          spree_bundle_products.master_product_id AS "master_product_id",
          count(spree_bundle_products.child_product_id)  AS "child_product_count"
FROM public.spree_bundle_products  AS spree_bundle_products
        GROUP BY 1 ;;
  }

  dimension: master_product_id {
    type: number
    sql: ${TABLE}."master_product_id" ;;
  }

  dimension: child_product_count {
    type: number
    sql: ${TABLE}."child_product_count" ;;
  }
}
