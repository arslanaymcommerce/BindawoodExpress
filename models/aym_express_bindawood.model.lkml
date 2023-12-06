connection: "aym_bindawood_transactional"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: aym_express_bindawood_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: aym_express_bindawood_default_datagroup

explore: spree_products {

  join: spree_variants {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_variants.product_id};;
  }

  join: spree_product_aisle_maps  {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_product_aisle_maps.product_id};;
  }


  join: spree_weighted_dimensions {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_weighted_dimensions.variant_id} = ${spree_variants.id};;
  }


  join: spree_product_translations {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_product_translations.spree_product_id};;
  }

  join: spree_products_taxons {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_products_taxons.product_id};;
  }

  join: spree_nutritional_facts {
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_nutritional_facts.product_id};;
  }



  #produts orders > Spree Line Items > Spree Variants > Spree Products > Spree Product Inventory Modifiers
  join: spree_product_inventory_modifiers {
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_product_inventory_modifiers.product_id} ;;
  }


  join: spree_taxon_translations {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_products_taxons.taxon_id} = ${spree_taxon_translations.spree_taxon_id};;
  }

  join: products_english {
    relationship: one_to_one
    sql_on: ${spree_products.id} = ${products_english.id} ;;
  }

}


explore: spree_orders {

 always_join: [danube_supermarket_translations]
sql_always_where:  (danube_supermarket_translations.locale = 'en') ;;

  # Orders > Spree Order Promotions
  join: spree_adjustments {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_orders.id} = ${spree_adjustments.order_id};;
  }



  join: spree_shelf_reviews {
    relationship: many_to_one
    sql_on: ${spree_orders.id} = ${spree_shelf_reviews.order_id};;
  }


  #orders > spree_return_items > spree_line_items

  join: spree_order_return_items {
    relationship: many_to_one
    sql_on: ${spree_line_items.id} = ${spree_order_return_items.line_item_id};;
  }



  # Orders > Spree Picked Items
  join: spree_picked_items {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_lift_assignments.id} = ${spree_picked_items.assignment_id};;
  }

  join: spree_kitchen_ingredients {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_kitchen_ingredients.recommended_product_id};;
  }

  join: spree_nutritional_facts {
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_nutritional_facts.product_id};;
  }

  join: spree_kitchen_recipes {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_kitchen_ingredients.kitchen_recipe_id} = ${spree_kitchen_recipes.id};;
  }

  join: spree_kitchen_recipe_translations{
    view_label: "spree_kitchen_recipes"
    fields: [name,locale]
    relationship: many_to_one
    sql_on: ${spree_kitchen_recipes.id} = ${spree_kitchen_recipe_translations.spree_kitchen_recipe_id} ;;
  }

  # Orders > Spree Lift Assignments
  join: spree_lift_assignments {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_orders.id} = ${spree_lift_assignments.order_id};;
  }

# Orders > Spree Users > Delivered_orders
  join: delivered_orders_dt {
    relationship: many_to_one
    sql_on: ${delivered_orders_dt.users_id} = ${spree_users.id} ;;
  }

  join: spree_storecredit_refunds {
    relationship: many_to_one
    sql_on: ${spree_orders.number} = ${spree_storecredit_refunds.order_number};;
  }

# Orders > Spree drift delivery
  join: spree_drift_deliveries{
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_orders.id} = ${spree_drift_deliveries.order_id};;
  }

# Orders > Spree cashback
  join: spree_cashbacks{
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_orders.id} = ${spree_cashbacks.order_id} and ${spree_cashbacks.store_credit_id} = ${spree_store_credits.id};;
  }

  # Orders > delivery > drift assignments
  join: spree_drift_delivery_batches {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_drift_deliveries.delivery_batch_id} = ${spree_drift_delivery_batches.id};;
  }

# Orders > delivery > drift assignments
  join: spree_electronic_items_details {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_electronic_items_details.line_item_id} = ${spree_line_items.id};;
  }

# Orders > Spree Order Promotions
  join: spree_promotion_codes {
    relationship: one_to_many
    sql_on: ${spree_adjustments.promotion_code_id} = ${spree_promotion_codes.id};;
  }
# Orders > Spree Order Promotions > promotion codes > Promotions
  join: spree_promotions {
    relationship: one_to_many
    sql_on: ${spree_promotion_codes.promotion_id} = ${spree_promotions.id};;
  }
  join: spree_promotion_translations{
    view_label: "Spree Promotions"
    fields: [name,locale,description]
    relationship: many_to_one
    sql_on: ${spree_promotions.id} = ${spree_promotion_translations.spree_promotion_id} ;;
  }
  # Orders > Spree Users
  join: spree_users {
    relationship: many_to_one
    sql_on: ${spree_orders.user_id} = ${spree_users.id} ;;
  }




# Orders > Spree Users
##  join: monthly_activity {
##    relationship: many_to_one
##    sql_on: ${monthly_activity.user_id} = ${spree_users.id} ;;
##  }


# Orders > previous_order_date
##  join: previous_order_date {
##    relationship: one_to_one
##    sql_on: ${previous_order_date.user_id} = ${spree_users.id} ;;
##  }


#Orders>Users>Store credit
  join: spree_credit_cards {
    relationship: one_to_one
    sql_on: ${spree_payments.source_id} = ${spree_credit_cards.id} ;;
  }

#Orders>Users>Store credit
  join: danube_salutations {
    relationship: one_to_many
    sql_on: ${spree_users.danube_salutation_id} = ${danube_salutations.id} ;;
  }

  #Orders>Users>Store credit
  join: spree_store_credits {
    relationship: many_to_one
    sql_on: ${spree_users.id} = ${spree_store_credits.user_id} ;;
  }

#Orders>Users>Store credit>created_by
  ## join: created_by {
##    relationship: many_to_one
##    sql_on: ${created_by.id} = ${spree_store_credits.created_by_id};;
##  }

#Orders>Users>Store credit > store_credit_coupons
  join: spree_store_credit_coupons {
    relationship: many_to_one
    sql_on: ${spree_store_credit_coupons.store_credit_id} = ${spree_store_credits.id} ;;
  }

#Orders>Users>Store credit > store_credit_coupons > store_credit_Campaign
  join: spree_store_credit_campaigns {
    relationship: many_to_one
    sql_on: ${spree_store_credit_campaigns.id} = ${spree_store_credit_coupons.store_credit_campaigns_id};;
  }



#Orders>Users>Referal
  join: spree_referrals {
    relationship: many_to_one
    sql_on: ${spree_users.id} = ${spree_referrals.referrer_id} ;;
  }

#Orders>Users>Referee-> to get only referee information
  join: spree_referee{
    relationship: many_to_one
    sql_on: ${spree_users.id} = ${spree_referee.referee_id} ;;
  }

##  join: Spree_Orders_New {
  ##  relationship: one_to_one
  ##  sql_on: ${Spree_Orders_New.user_id} = ${spree_referrals.referee_id} ;;
##  }

  #Orders>Users>app_ratings
##  join: danube_app_ratings {
##    relationship: many_to_one
##    sql_on: ${spree_users.id} = ${danube_app_ratings.user_id} ;;
##  }

  #Orders>Users>Store credit
  join: spree_store_credit_categories {
    relationship: one_to_many
    sql_on: ${spree_store_credits.category_id} = ${spree_store_credit_categories.id} ;;
  }

  # Orders > CustomerNotAvailable
##  join: CustomerNotAvailable {
##    relationship: one_to_one
##    sql_on: ${spree_orders.number} = ${CustomerNotAvailable.spree_orders_number};;
##  }


  join: user_facts {
    relationship: many_to_one
    sql_on: ${spree_orders.user_id} = ${user_facts.user_id} ;;
  }

##  join: cancelled_users {
##    relationship: many_to_one
##    sql_on: ${spree_orders.canceler_id} = ${cancelled_users.user_id} ;;
##  }

  join: spree_user_clients {
    relationship: many_to_one
    sql_on: ${spree_orders.user_id} = ${spree_user_clients.user_id} ;;
  }

  # Orders > Spree Addresses
  join: spree_addresses {
    relationship: one_to_many
    sql_on: ${spree_orders.ship_address_id} = ${spree_addresses.id} ;;
  }

  # Orders > Spree Addresses > Spree Districts
  join: spree_districts {
    relationship: many_to_one
    sql_on: ${spree_addresses.district_id} = ${spree_districts.id} ;;
  }

  # Orders > Spree Addresses > Spree Districts > Spree District Translations
  join: spree_district_translations {
    view_label: "Spree Districts"
    fields: [name,locale]
    relationship: many_to_one
    sql_on: ${spree_districts.id} = ${spree_district_translations.spree_district_id} ;;
  }

# Orders > Spree Addresses > Spree Districts
  join: spree_state_translations {
    relationship: many_to_one
    sql_on: ${spree_addresses.state_id} = ${spree_state_translations.spree_state_id} ;;
  }

# Orders > Spree supermarkets > state


  # Orders > Spree Fulfilments
  join: spree_fulfilments {
    type: left_outer
    relationship: one_to_one
    sql_on: ${spree_fulfilments.order_id} = ${spree_orders.id} ;;
  }

# Orders > customproducts
  join: spree_custom_line_items {
    type: left_outer
    relationship: one_to_many
    sql_on: ${spree_custom_line_items.order_id} = ${spree_orders.id} ;;
  }

# Orders > customproducts
  join: spree_custom_products {
    type: left_outer
    relationship: one_to_many
    sql_on: ${spree_custom_products.id} = ${spree_custom_line_items.custom_product_id};;
  }

  # Orders > Spree Fulfilments > Versions>This is for Pickers
  join: versions {
    type: left_outer
   relationship: many_to_one
   sql_on: ${spree_fulfilments.id} = ${versions.item_id} ;;
  }

  join: fulfilmentversion_dates {
    type: left_outer
    relationship: many_to_one
    sql_on:  ${spree_fulfilments.id} = ${fulfilmentversion_dates.item_id} ;;
  }



  # Orders > Spree lift Pickers
  join: spree_lift_pickers {
    relationship: one_to_many
    sql_on: ${versions.whodunnit} = ${spree_lift_pickers.id};;
  }

# Orders > Spree Fulfilments > Versions
  join: spree_packers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${spree_fulfilments.id} = ${spree_packers.item_id} ;;
  }

  # Orders > Spree lift Pickers
  join: spree_box_packers {
    relationship: one_to_many
    sql_on: ${spree_packers.whodunnit} = ${spree_box_packers.id};;
  }

# Orders > Bundle_quantity
  join: bundle_quantity {
    type: left_outer
    relationship: one_to_many
    sql_on:  ${bundle_quantity.master_product_id} = ${spree_bundle_products.master_product_id} ;;
  }


  # Orders > Spree Fulfilments > Versions>Delivery
  join: Spree_Delivery{
    type: left_outer
    relationship: many_to_one
    sql_on: ${spree_fulfilments.id} = ${Spree_Delivery.item_id} ;;
  }

  # Orders > Spree Fulfilments > Versions>Delivery
##  join: Issue_dt{
##    type: left_outer
##    relationship: many_to_one
##    sql_on: ${spree_fulfilments.id} = ${Issue_dt.item_id} ;;
##  }

  # Orders > Spree Fulfilments > Versions>Delivery
##  join: arrived_dt{
##    type: left_outer
##    relationship: many_to_one
##    sql_on: ${spree_fulfilments.id} = ${arrived_dt.item_id} ;;
##  }

# Orders > Spree Fulfilments > Versions>Packing
  join: spree_packing{
    type: left_outer
    relationship: many_to_one
    sql_on: ${spree_fulfilments.id} = ${spree_packing.item_id} ;;
  }

  # Orders > Spree drift drivers
  join: spree_drift_drivers {
    relationship: one_to_many
    sql_on: ${spree_drift_delivery_batches.driver_id} = ${spree_drift_drivers.id};;
  }

  # Orders > Spree Line Items
  join: spree_line_items {
    type: left_outer
    relationship: many_to_one
    sql_on: ${spree_orders.id} = ${spree_line_items.order_id} ;;
  }

# Orders > Spree Line Items
##  join: line_items_union {
##    type: left_outer
##    relationship: many_to_one
##    sql_on: ${spree_orders.id} = ${line_items_union.order_id} ;;
##  }

  # Orders > Spree Line Items > Spree Variants
  join: spree_variants {
    type: left_outer
    relationship: one_to_many
    sql_on: ${spree_line_items.variant_id} = ${spree_variants.id} ;;
  }

  # Orders > Second_last_order



  join: spree_weighted_dimensions {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_weighted_dimensions.variant_id} = ${spree_variants.id};;
  }

  # Orders > Spree Line Items > Spree Variants > Spree Prices
  join: spree_prices {
    relationship: one_to_many
    sql_on:  ${spree_variants.id} = ${spree_prices.variant_id} ;;
  }

  # Orders > Spree Line Items > Spree Variants > Spree Prices
  join: spree_sale_prices {
    relationship: one_to_many
    sql_on:  ${spree_prices.id} = ${spree_sale_prices.price_id} ;;
  }

  # Orders > Spree Line Items > Spree Variants > Spree Products
  join: spree_products {
    type: left_outer
    relationship: one_to_many
    sql_on:  ${spree_variants.product_id} = ${spree_products.id} ;;
  }

  join: spree_product_aisle_maps  {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_product_aisle_maps.product_id};;
  }

# Orders > Spree Line Items > Spree Variants > Spree assests
  join: spree_assets {
    type: left_outer
    relationship: one_to_many
    sql_on:  ${spree_variants.id} = ${spree_assets.viewable_id} ;;
  }




# Orders > Bundle_items
  join: spree_bundle_products {
    type: left_outer
    relationship: one_to_many
    sql_on:  ${spree_bundle_products.master_product_id} = ${spree_products.id} ;;
  }

# Orders > spree_bin_categories
  join: spree_bin_categories {
    relationship: one_to_many
    sql_on:  ${spree_bin_categories.id} = ${spree_products.bin_category_id} ;;
  }

# Orders > Bundle_quantity



  # Orders > Spree Line Items > Spree Variants > Spree Products > Spree Product Taxons
  join: spree_products_taxons {
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_products_taxons.product_id} ;;
  }

  # Orders > Spree Line Items > Spree Variants > Spree Products > Spree Product Taxons > Spree Taxons
  join: spree_taxons {
    relationship: many_to_one
    sql_on: ${spree_products_taxons.taxon_id} = ${spree_taxons.id} ;;
  }

  # Orders > Spree Line Items > Spree Variants > Spree Products > Spree Product Taxons > Spree Taxons > Spree Taxon Translations
  join: spree_taxon_translations {
    view_label: "Spree Taxons"
    fields: [name,locale,permalink]
    relationship: many_to_one
    sql_on:  ${spree_taxons.id} = ${spree_taxon_translations.spree_taxon_id} ;;
  }

  # Orders > Spree Line Items > Spree Variants > Spree Products  Spree Product Translations
  join: spree_product_translations {
    view_label: "Spree Products"
    fields: [name,locale,count,slug,manufacturer,meta_keywords,spree_product_translations.full_name]
    type: left_outer
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_product_translations.spree_product_id} ;;
  }

  # Orders > Spree Line Items > Spree Variants > Spree Products > Spree Product Inventory Modifiers
  join: spree_product_inventory_modifiers {
    relationship: many_to_one
    sql_on: ${spree_products.id} = ${spree_product_inventory_modifiers.product_id}  and ${spree_orders.supermarket_id} = ${spree_product_inventory_modifiers.rule_supermarket_id};;
  }

# Orders > Spree Products > Derived table
  join: products_english {
    relationship: one_to_one
    sql_on: ${spree_products.id} = ${products_english.id} ;;
  }

# Orders > Spree Products > Derived table
##  join: rank {
##    relationship: one_to_one
##    sql_on: ${rank.order_number} = ${spree_orders.number} ;;
##  }
  # Orders > Spree Products > Derived table
  join: products_arabic {
    relationship: one_to_one
    sql_on: ${spree_products.id} = ${products_arabic.id};;
  }
  # Orders > Spree Products > spree_product_barcodes
  join:spree_product_barcodes{
    relationship: one_to_one
    sql_on: ${spree_products.id} = ${spree_product_barcodes.product_id};;
  }

  join: created_by {
    relationship: many_to_one
    sql_on: ${created_by.id} = ${spree_store_credits.created_by_id};;
  }

  # Orders > Danube Slot To Orders
  join: danube_slot_to_orders {
    sql_on: ${spree_orders.id} = ${danube_slot_to_orders.order_id} ;;
    relationship: one_to_one
  }

  # Orders > Danube Slot To Orders > Danube Time Slot Schedules
  join: danube_time_slots_schedules {
    sql_on: ${danube_slot_to_orders.time_slots_schedule_id} = ${danube_time_slots_schedules.id} ;;
    relationship: many_to_one
  }

  # Orders > Danube Slot To Orders > Danube Time Slot Schedules > Spree Zones
  join: spree_zones {
    sql_on: ${danube_slot_to_orders.spree_zone_id} = ${spree_zones.id} ;;
    relationship: one_to_many
    fields: []
  }

  # Orders > Danube Slot To Orders > Danube Time Slot Schedules > Spree Zones > Danube Supermarkets
  join: danube_supermarkets {
    sql_on: ${spree_zones.id} = ${danube_supermarkets.zone_id} ;;
    relationship: one_to_one
  }

# Orders > Danube Slot To Orders > Danube picker Waves time slot > Danube picker Waves
  join:danube_picker_waves {
    sql_on:  ${danube_picker_waves_time_slots.picker_wave_id}= ${danube_picker_waves.id} ;;
    relationship: one_to_many
  }

  # Orders > Danube Slot To Orders > Danube Time Slot Schedules > Spree Zones > Danube Supermarkets > Danube Supermarkets Translations
  join: danube_supermarket_translations {
    view_label: "Danube Supermarkets"
    fields: [name,locale,city,supermarket_ID,Region,store_mobile_no,danube_supermarket_translations.DarkStore_Code]
    sql_on: ${danube_supermarkets.id} = ${danube_supermarket_translations.danube_supermarket_id} ;;
    relationship: many_to_one
  }

  join: spree_express_busy_slots {
    sql_on: ${danube_supermarkets.id} = ${spree_express_busy_slots.supermarket_id} ;;
    relationship: one_to_many
    type: left_outer
  }


  join: spree_lift_aisle_maps {
    sql_on: ${danube_supermarkets.id} = ${spree_lift_aisle_maps.supermarket_id} ;;
    relationship: many_to_one
  }



# Orders > Danube Slot To Orders > Time Slot Schedules
  join:danube_time_slots{
    sql_on:  ${danube_time_slots_schedules.time_slot_id}= ${danube_time_slots.id} ;;
    relationship:one_to_many
  }

  # Orders > Danube Slot To Orders > Danube picker Waves time slot
  join:danube_picker_waves_time_slots {
    sql_on:  ${danube_time_slots.id}= ${danube_picker_waves_time_slots.time_slot_id} ;;
    relationship: many_to_one
  }

  # Orders > Danube Slot To Orders > Danube end time
##  join:Time_Slot_Endtime {
##    sql_on:  ${danube_slot_to_orders.Time_SlotDate_duration}= ${Time_Slot_Endtime.Time_SlotDate_duration} ;;
##    relationship: one_to_one
##  }

  # Orders > Danube Slot To Orders > Danube end time
##  join:packing_endtime{
##    sql_on:  ${danube_slot_to_orders.Time_SlotDate_duration}= ${packing_endtime.Time_SlotDate_duration} ;;
##    relationship: one_to_one
##  }



  # Orders > Spree Payments
  join: spree_payments {
    sql_on: ${spree_orders.id} = ${spree_payments.order_id} ;;
    relationship: many_to_one
  }

  # Orders > Second_last_order
##  join: second_last_order {
##    sql_on: ${spree_orders.user_id} = ${second_last_order.user_id} ;;
##    relationship: many_to_one
##  }

# Orders > Spree Payments > New derived table created


  # Orders > Spree Payments > Spree Payment Methods
  join: spree_payment_methods {
    sql_on:  ${spree_payments.payment_method_id} = ${spree_payment_methods.id} ;;
    relationship: one_to_one
  }

# Orders > Spree Payments > refunds
  join: spree_refunds {
    sql_on:  ${spree_payments.id} = ${spree_refunds.payment_id} ;;
    relationship: many_to_one
  }

# Orders > Spree Payments > refunds reason
  join: spree_refund_reasons {
    sql_on:  ${spree_refunds.refund_reason_id} = ${spree_refund_reasons.id} ;;
    relationship: many_to_one
  }

  # Orders > Spree Payments > Spree Payment Methods > Spree Payment Method Translations
  join: spree_payment_method_translations {
    view_label: "Spree Payment Methods"
    fields: [name,locale]
    sql_on:  ${spree_payment_methods.id} = ${spree_payment_method_translations.spree_payment_method_id} ;;
    relationship: many_to_one
  }
}

explore: offline_pricing_cancel_darkstore {}
explore: offline_pricing_darkstore {}
explore: darkstore_product_onhand_v {}
