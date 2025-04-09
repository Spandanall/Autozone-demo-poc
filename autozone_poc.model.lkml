connection: "autozone_poc_demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#


explore: item_region_sales {
  join: test_new_attr {
    sql_on: ${item_region_sales.item} = ${test_new_attr.product_id} ;;
    relationship: many_to_one
  }
}

explore: attr {}
