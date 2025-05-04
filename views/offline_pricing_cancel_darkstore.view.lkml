view: offline_pricing_cancel_darkstore {
    derived_table: {
      sql: select o.id ,
              s.spree_zone_id as supermarket_id,
              o.user_id,
              'test@test.com' email,
              o.number,
              o.completed_at,
              o.store_id,
              ---o.promo_total,
              o.promo_total - COALESCE((select sum(amount) from spree_promotion_actions sp , spree_adjustments sa
        where sp.id = sa.source_id
        and sp.type = 'Spree::Promotion::Actions::FreeShipping'--id = 1337
        --and sp.deleted_at is not null
        and sa.eligible = 'true'
        and adjustable_id = o.id),0) promo_total,
              i.id as line_item_id,
              i.quantity  quantity,
              i.requested_quantity requested_quantity,
              0 Total,
              i.price price,
              i.offline_price,
              i.on_sale,
              b.barcode,
              s.time_slot_date,
              v.weight_increment,
              i.variant_id,
              p.child_product_id,
              p.barcode as bundle_barcode,
              p.quantity as bundle_quantity,
              mp.bundle_items as bundle_items,
              sp.payment_name as payment_name,

        f.state,
        max(vs.created_at) out_for_delivery_date,
        CAST( vs.object_changes AS TEXT ) out_for_delivery_status,
        max(vs2.created_at) delivered_Date,
        vs2.object_changes delivery_Status/*,
        now() - interval '1 day' current_datetime,
        (EXTRACT(
        EPOCH FROM now() - COALESCE(max(vs.created_at),null,max(vs2.created_at)))
        /3600)::int numofhours*/

        from public.spree_fulfilments f
        full outer join public.versions vs  on vs.item_id = f.id and vs.item_type = 'Spree::Fulfilment' and ((vs.object_changes::text  like '%"assigned_to_delivery_batch", "out_for_delivery"%' ) /*or (v.object_changes::text like '%delivered%')*/  )
        left join  spree_orders o on f.order_id = o.id
        full outer join public.versions vs2 on  vs2.item_id = f.id and vs2.item_type = 'Spree::Fulfilment' and (vs2.object_changes::text like '%delivered%')
        left join spree_line_items i on
        i.order_id = o.id
        left join (
        select
        product_id, max(barcode) as barcode
        from
        spree_product_barcodes
        group by
        1) b on
        b.product_id = (select max(product_id) from spree_variants vs where vs.id = i.variant_id)
        left join danube_slot_to_orders s on
        s.order_id = i.order_id
        left join spree_variants v on
        v.id = i.variant_id
        left join (
        select
        master_product_id, child_product_id, quantity, barcode
        from
        spree_bundle_products p
        left join (
        select
        product_id, max(barcode) as barcode
        from
        spree_product_barcodes
        group by
        1) b on
        p.child_product_id = b.product_id) p on
        p.master_product_id =  (select max(product_id) from spree_variants vs where vs.id = i.variant_id) -- i.variant_id
        left join (
        select
        master_product_id, count(child_product_id) as bundle_items
        from
        spree_bundle_products
        group by
        1) mp on
        mp.master_product_id = (select max(product_id) from spree_variants vs where vs.id = i.variant_id)
        left join (
        select
        spree_payments.order_id as "order_id", ARRAY_TO_STRING(array(select unnest(array_agg(distinct spree_payment_method_translations.name )) order by 1), ',') as payment_name
        from
        spree_payments
        left join public.spree_payment_methods as spree_payment_methods on
        spree_payments.payment_method_id = spree_payment_methods.id
        left join public.spree_payment_method_translations as spree_payment_method_translations on
        spree_payment_methods.id = spree_payment_method_translations.spree_payment_method_id
        where
        (spree_payment_method_translations.name not ilike 'الدفع عند الاستلام'
        and spree_payment_method_translations.name not ilike 'الرصيد المتاح'
        or spree_payment_method_translations.name is null)
        group by
        1) sp on
        sp.order_id = o.id
        where
        i.quantity > 0
        and f.state = 'canceled'
        -- and o.order_type = 'Express'
        and i.variant_id not in (select v.id variant_id from public.danube_supermarket_products p , spree_variants v
        where v.product_id = p.product_id)
        --and COALESCE(o.parent_id,-1) = -1
        and s.spree_zone_id in (97)--,98,100,101,102,103)
        and  CAST( vs.object_changes AS TEXT ) like '%out_for_delivery%'
        and v.sku not in ('11572820', '11572830', '11572840', '11572850', '11572860', '11572870', '11572880', '11572890', '11572900', '11572910', '11572920', '11572930', '11572940', '11572950', '11572960', '11572970', '11573170', '11573180', '11573190', '11573200', '11573210', '11573260', '11573270', '11573280', '11573310', '11573320', '11573330', '11573340', '11573350', '11573360', '11573370', '11573380', '11573390', '11573400', '11573410', '11573420', '11573570', '11573580', '11573600', '11573610', '11573650', '11573670', '11573680', '11573690', '11573700', '11573710', '11573720', '11573740', 'Mobily20', 'Mobily25', 'Mobily34.50', 'Mobily57.50', 'Mobily115', 'Mobily230', 'Mobily300', 'Mobily395', 'Sawa20', 'Sawa30', 'Sawa50', 'Sawa100', 'Sawa200', 'Sawa300', 'Zain020', 'Zain029', 'Zain034', 'Zain057', 'Zain059', 'Zain0115', 'Zain0140', 'Zain0230', 'Zain0249', 'Zain0345', 'Zain0460', 'Zain0575', 'gc50', 'gc100', 'gc150', 'gc200', 'gc250', 'gc300', 'gc500', 'gc1000')


        group by
        vs.object_changes,vs2.object_changes,
        o.number , o.completed_At,  f.state, o.id ,s.spree_zone_id,
        o.store_id,
        o.promo_total,
        i.id ,
        i.price,
        i.offline_price,
        i.on_sale,
        b.barcode,
        s.time_slot_date,
        v.weight_increment,
        i.variant_id,
        p.child_product_id,
        p.barcode,
        p.quantity,
        mp.bundle_items,
        sp.payment_name
        ;;
    }

    dimension: line_item_id {
      type: number
      sql: ${TABLE}.line_item_id ;;
    }

    dimension: order_id {
      type: number
      sql: ${TABLE}.id ;;
    }

    dimension: price1 {
      type: number
      sql: ${TABLE}.price ;;

      ##case
      ##        WHEN ${TABLE}.on_sale = 'yes'
      ##      THEN ${TABLE}.price
      ##      WHEN ${TABLE}.on_sale = 'no'
      ##      THEN COALESCE(${TABLE}.offline_price,${TABLE}.price)
      ##      ELSE
      ##      COALESCE(${TABLE}.offline_price,${TABLE}.price)
      ##        END;;

      value_format: "0.00"
    }

    dimension: price {
      type: number
      sql: CASE
              WHEN ${TABLE}.bundle_barcode IS NULL
              THEN ${price1}
              ELSE ${price1}/(${TABLE}.bundle_quantity*${TABLE}.bundle_items)
              END ;;
      value_format: "0.00"
    }

    dimension: quantity1 {
      type: number
      sql: CASE
              WHEN ${TABLE}.bundle_barcode IS NULL
              THEN ${TABLE}.quantity
              ELSE ${TABLE}.bundle_quantity*${TABLE}.quantity
              END ;;
      value_format: "0.00"
    }

    dimension: requested_quantity1 {
      type: number
      sql:  CASE
              WHEN ${TABLE}.bundle_barcode IS NULL
              THEN ${TABLE}.requested_quantity
              ELSE ${TABLE}.bundle_quantity*${TABLE}.requested_quantity
              END ;;
      value_format: "0.00"
    }

    dimension: quantity {
      type: number
      sql: CASE
              WHEN ${TABLE}.weight_increment > 0
              THEN ${quantity1}*100.000/100000
              ELSE ${quantity1}
              END ;;
      value_format: "0.00"
    }

    dimension: requested_quantity {
      type: number
      sql:  CASE
              WHEN ${TABLE}.weight_increment > 0
              THEN ${requested_quantity1}*100.000/100000
              ELSE ${requested_quantity1}
              END ;;
      value_format: "0.00"
    }

    dimension: Offline_total {
      type: number
      sql: ${TABLE}.total;;
    }

    dimension: product_id {
      type: number
      sql: CASE
              WHEN ${TABLE}.barcode IS NULL
              THEN ${TABLE}.child_product_id
              ELSE variant_id END ;;
    }


    dimension: barcodes {
      type: string
      sql: CASE
              WHEN ${TABLE}.barcode IS NULL
              THEN ${TABLE}.bundle_barcode
              ELSE ${TABLE}.barcode END ;;
    }

    dimension: promo_total {
      type: number
      sql: ${TABLE}.promo_total ;;
    }

  dimension: number{
    type: string
    sql: case when  ${TABLE}.number  like 'JHZ%' then concat('J',substring( ${TABLE}.number,4))
              when  ${TABLE}.number  like 'CHZ%' then concat('C',substring( ${TABLE}.number,4)) else  ${TABLE}.number
   end ;;
  }

    dimension: mobile_phone_number {
      type: string
      sql: '0000000000' ;;
    }

    dimension: email {
      type: string
      sql: ${TABLE}.email;;
    }

    dimension: payment_name {
      type: string
      sql: ${TABLE}.payment_name;;
    }

    dimension: user_id {
      type: number
      sql: ${TABLE}.user_id ;;
    }

    dimension: total_line {
      type: number
      sql: ${TABLE}.price * ${TABLE}.quantity ;;
    }

##    dimension:  numofhours {
##      type: number
##      sql: ${TABLE}.numofhours;;
##    }

    measure: Total {
      type: sum
      sql: ${price}*${quantity} ;;
    }

    dimension_group: completed {
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
      sql: ${TABLE}.completed_at ;;
    }

    dimension_group: time_slot {
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
      sql: ${TABLE}.time_slot_date ;;
    }

  dimension: supermarket_id {
    case: {


      when: {
        sql: ${TABLE}.supermarket_id  = 97 ;;
        label: "57011"
      }
      }
      hidden: no
    }


    dimension: Branch_plus_Code {
      type: string
      sql: concat(${supermarket_id},to_char(${time_slot_date},'DDMMYY') );;
    }

  }
