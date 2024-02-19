view: payment_type {
  derived_table: {
    sql: SELECT
        spree_orders.number  AS "spree_orders_number",
        ARRAY_TO_STRING(ARRAY(SELECT unnest(array_agg(DISTINCT spree_payment_method_translations.name )) ORDER BY 1),',') AS "payment_types"
      FROM public.spree_orders
      LEFT JOIN public.danube_slot_to_orders  AS danube_slot_to_orders ON spree_orders.id = danube_slot_to_orders.order_id
      LEFT JOIN public.danube_time_slots_schedules  AS danube_time_slots_schedules ON danube_slot_to_orders.time_slots_schedule_id = danube_time_slots_schedules.id
      LEFT JOIN public.spree_zones  AS spree_zones ON danube_time_slots_schedules.zone_id = spree_zones.id
      LEFT JOIN public.danube_supermarkets  AS danube_supermarkets ON spree_zones.id = danube_supermarkets.zone_id
      LEFT JOIN public.danube_supermarket_translations  AS danube_supermarket_translations ON danube_supermarkets.id = danube_supermarket_translations.danube_supermarket_id
      LEFT JOIN public.spree_payments  AS spree_payments ON spree_orders.id = spree_payments.order_id
      LEFT JOIN public.spree_payment_methods  AS spree_payment_methods ON spree_payments.payment_method_id = spree_payment_methods.id
      LEFT JOIN public.spree_payment_method_translations  AS spree_payment_method_translations ON spree_payment_methods.id = spree_payment_method_translations.spree_payment_method_id

      WHERE (spree_payment_method_translations.name ILIKE 'Credit Card' OR spree_payment_method_translations.name ILIKE 'Drift Credit Payment' OR spree_payment_method_translations.name ILIKE 'Pay On Delivery' OR spree_payment_method_translations.name ILIKE 'Store Credit') AND (danube_supermarket_translations.locale = 'en')
      GROUP BY 1
      ORDER BY 1 ;;

  }

  dimension: spree_orders_number {
    type: string
    sql: ${TABLE}.spree_orders_number ;;
  }
  dimension: Payment_types {
    type: string
    sql: ${TABLE}.Payment_types ;;
  }
}
