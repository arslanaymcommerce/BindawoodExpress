view: darkstore_product_onhand_v_bd {
    derived_table: {
      sql: /*select spree_product_id , spt.full_name product_desc, v.sku , sb.barcode,
              COALESCE(m.stock_quantity,0) AFS, (COALESCE(m.uploaded_stock_quantity,0) - COALESCE(m.stock_quantity,0)) Reserve , COALESCE(m.stock_quantity,0)  + (COALESCE(m.uploaded_stock_quantity,0) - COALESCE(m.stock_quantity,0)) StockonHand,
              m.rule_supermarket_id,
              ds.name supermarketname,
              p.promotionable
              from spree_variants v, spree_products p ,
              public.spree_product_translations spt,
              public.spree_product_barcodes sb,
              public.spree_product_inventory_modifiers m,
              public.danube_supermarket_translations ds
              where v.product_id = p.id
              and spt.spree_product_id = p.id
              and sb.product_id = p.id
              and m.product_id = p.id
              and ds.danube_supermarket_id= m.rule_supermarket_id
              and ds.locale = 'en'
              and spt.locale = 'en'
              and ds.danube_supermarket_id in (131,120,121,132,127,64,65,61,60,75,69,54,74)*/


        select spree_product_id , spt.full_name product_desc, v.sku , sb.barcode,
        COALESCE(m.stock_quantity,0) AFS, (COALESCE(m.uploaded_stock_quantity,0) - COALESCE(m.stock_quantity,0)) Reserve , COALESCE(m.stock_quantity,0)  + (COALESCE(m.uploaded_stock_quantity,0) - COALESCE(m.stock_quantity,0)) StockonHand,
        m.rule_supermarket_id,
        ds.name supermarketname,
        p.promotionable,
        stt.name Taxon_name,
        stt.name SubDepartment,
        (select stt1.name from  public.spree_taxon_translations stt1 where stt1.spree_taxon_id = st.parent_id and stt1.locale = 'en') department,
        stt.spree_taxon_id taxon_id
        from spree_variants v, spree_products p ,
        public.spree_product_translations spt,
        public.spree_product_barcodes sb,
        public.spree_product_inventory_modifiers m,
        public.danube_supermarket_translations ds,
        public.spree_taxons st,
        public.spree_taxon_translations stt,
        public.spree_products_taxons pt

        where v.product_id = p.id
        and spt.spree_product_id = p.id
        and sb.product_id = p.id
        and m.product_id = p.id
        and ds.danube_supermarket_id= m.rule_supermarket_id
        and pt.product_id = p.id
        and pt.taxon_id = st.id
        and st.id = stt.spree_taxon_id
        and stt.locale = 'en'
        and ds.locale = 'en'
        and spt.locale = 'en'
        and ds.danube_supermarket_id in (98)
        and v.tenant_id = 1
        ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: spree_product_id {
      type: number
      primary_key: yes
      sql: ${TABLE}."spree_product_id" ;;
    }

    dimension: product_desc {
      type: string
      sql: ${TABLE}."product_desc" ;;

    }


    dimension: promotionable {
      type: yesno
      sql: ${TABLE}.promotionable ;;
    }

    dimension: Department {
      type: string
      sql: ${TABLE}.department ;;
    }


    dimension: Sub_Department {
      type: string
      sql: ${TABLE}.SubDepartment ;;
    }



    dimension: taxon {
      type: string
      sql: ${TABLE}.Taxon_name ;;
    }


    dimension: taxon_id {
      type: number
      sql: ${TABLE}.taxon_id ;;
    }


    dimension: sku {
      type: string
      sql: ${TABLE}."sku" ;;
    }

    dimension: barcode {
      type: string
      sql: ${TABLE}."barcode" ;;
    }

    dimension: afs {
      type: number
      sql: ${TABLE}."afs" ;;
    }

    dimension: reserve {
      type: number
      sql: ${TABLE}."reserve" ;;
    }

    dimension: stockonhand {
      type: number
      sql: ${TABLE}."stockonhand" ;;
    }

    measure: total_stockonhand {
      type: sum_distinct
      sql: ${TABLE}."stockonhand"  ;;
    }

    dimension: DarkStore_Code {
      case: {
        when: {
          sql: ${TABLE}.rule_supermarket_id  in (98) ;;
          label: "7011"
        }

      }
      hidden: no
    }


    measure: Total_delivered_Qty_AllDS{
      type: number
      sql:  (select  sum((CASE WHEN sv.weight_increment > 0 THEN (sl.quantity)*100.000/100000 ELSE sl.quantity END ))quantity_delivered
        from public.spree_line_items sl,
             public.spree_orders so,
             public.spree_fulfilments sf,
             public.spree_variants sv

        where
        so.id = sl.order_id
        and sf.order_id = so.id
        and sv.id = sl.variant_id
        and sv.product_id =  ${TABLE}."spree_product_id"
        and so.supermarket_id = ${TABLE}.rule_supermarket_id
        and sf. state = 'delivered'
        and so.order_type = 'Express'
        and ((( so.completed_at  ) >= ((SELECT (DATE_TRUNC('day', CURRENT_TIMESTAMP AT TIME ZONE 'Asia/Riyadh') AT TIME ZONE 'Asia/Riyadh'))) AND ( so.completed_at  ) < ((SELECT ((DATE_TRUNC('day', CURRENT_TIMESTAMP AT TIME ZONE 'Asia/Riyadh') + (1 || ' day')::INTERVAL) AT TIME ZONE 'Asia/Riyadh')))))
        );;
    }





    measure: AvailableForSale {
      type: max
      sql:  ${TABLE}."afs" ;;

    }


    dimension: rule_supermarket_id {
      type: number
      sql: ${TABLE}."rule_supermarket_id" ;;
    }

    dimension: supermarketname {
      type: string
      sql: ${TABLE}."supermarketname" ;;
      suggestable: yes

    }


    set: detail {
      fields: [
        spree_product_id,
        product_desc,
        sku,
        barcode,
        afs,
        reserve,
        stockonhand,
        rule_supermarket_id
      ]
    }
  }
