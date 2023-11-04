view: delivered_orders_dt {
  derived_table: {
    sql: SELECT
        spree_users1.id  AS "users_id",
        sum(DISTINCT CASE WHEN (spree_fulfilments.state ILIKE 'delivered') THEN spree_orders.total  ELSE NULL END) AS "delivered_orders",
        sum(CASE WHEN (spree_fulfilments.state ILIKE 'delivered') THEN spree_line_items.price *
        (case when spree_variants.weight_increment > 0 THEN (spree_line_items.quantity)*100.000/100000
                else spree_line_items.quantity end ) ELSE NULL END) AS net_delivered_Price


      FROM public.spree_orders  AS spree_orders
      LEFT JOIN public.spree_users  AS spree_users1 ON spree_orders.user_id = spree_users1.id
      LEFT JOIN public.spree_fulfilments  AS spree_fulfilments ON spree_fulfilments.order_id = spree_orders.id
      LEFT JOIN public.spree_line_items AS spree_line_items ON spree_line_items.order_id = spree_orders.id
      LEFT JOIN public.spree_variants AS spree_variants ON spree_variants.id = spree_line_items.variant_id
      GROUP BY 1
      ;;
  }

  dimension: users_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.users_id ;;
  }

  dimension: Delivered_Orders {
    type: number
    sql: ${TABLE}.delivered_orders ;;

  }

  dimension: lifetimenet_revenue {
    type: number
    sql: ${TABLE}.net_delivered_Price;;
  }


}
