view: spree_storecredit_refunds {
  derived_table: {
    sql: SELECT
      spree_store_credits.id AS "id",
  spree_store_credits.memo  AS "memo",
  spree_store_credits.amount  AS "amount",
  substr(memo,22,11) AS "order_number"
FROM public.spree_store_credits

      WHERE (spree_store_credits.category_id  = 63)
      GROUP BY 1,2,3,4
      ORDER BY 1  ;;

  }
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }
  dimension: memo {
    type: string
    sql: ${TABLE}.memo ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: Refunded_Amount {
    type: sum
    sql: ${amount} ;;
    value_format: "#,##0.00 \" SAR\""
  }
}
