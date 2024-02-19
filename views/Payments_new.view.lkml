view: payments_new {
  derived_table: {
    sql: SELECT
        spree_payments.order_id  AS "order_id",
        spree_payments.response_code  AS "transaction_id",
        spree_payments.number  AS "identifier"
      FROM public.spree_orders  AS spree_orders
      LEFT JOIN public.spree_payments  AS spree_payments ON spree_orders.id = spree_payments.order_id
      LEFT JOIN public.spree_payment_methods  AS spree_payment_methods ON spree_payments.payment_method_id = spree_payment_methods.id

      WHERE (spree_payments.state ILIKE 'completed') AND (spree_payment_methods.name ILIKE 'Apple Pay' OR spree_payment_methods.name ILIKE 'Credit Card')
      GROUP BY 1,2,3 ;;

  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
  }
  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }
}
