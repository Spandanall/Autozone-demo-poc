connection: "autozone_poc_demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: item_region_sales {
  join: bazaarvoice_csv_top_brake_pad_skus2 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${item_region_sales.item} = ${bazaarvoice_csv_top_brake_pad_skus2.product_id} ;;
  }
  join: bazaarvoice_csv_top_oil_filter_sku_sentiment {
    type: left_outer
    relationship: many_to_one
    sql_on: ${item_region_sales.item} = ${bazaarvoice_csv_top_oil_filter_sku_sentiment.product_id} ;;

  }
  join: sales_brakepad_oilfilter2 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${item_region_sales.item} = ${sales_brakepad_oilfilter2.product_id} and ${item_region_sales.minor} = ${sales_brakepad_oilfilter2.minor};;
  }


}
