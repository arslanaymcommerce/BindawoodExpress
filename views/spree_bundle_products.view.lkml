view: spree_bundle_products {
  derived_table: {
    sql: SELECT
        spree_bundle_products.id  AS "id",
        spree_bundle_products.master_product_id AS "master_product_id",
        spree_bundle_products.child_product_id  AS "child_product_id",
      spree_bundle_products.quantity  AS "quantity",
        max(spree_product_barcodes.barcode)  AS "barcode"
      FROM public.spree_bundle_products  AS spree_bundle_products
      LEFT JOIN public.spree_product_barcodes  AS spree_product_barcodes ON (spree_bundle_products."child_product_id") = spree_product_barcodes.product_id

      GROUP BY 1,2,3,4 ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: child_product_id {
    type: number
    sql: ${TABLE}."child_product_id" ;;
  }

  dimension: child_count {
    type: number
    sql: ${bundle_quantity.child_product_count};;
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
    sql: ${TABLE}."created_at" ;;
  }

  dimension: master_product_id {
    type: number
    sql: ${TABLE}."master_product_id" ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}."quantity" ;;
  }

  dimension: barcode {
    type: number
    sql: ${TABLE}."barcode" ;;
    value_format: "0"
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
    sql: ${TABLE}."updated_at" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  }
