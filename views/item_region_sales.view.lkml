view: item_region_sales {
  sql_table_name: `pandera-bi-demo.ccai.test_new_item_region_sales` ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: item {
    primary_key: yes
    type: number
    sql: ${TABLE}.item ;;
  }
  dimension: minor {
    type: string
    sql: ${TABLE}.minor ;;
  }
  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: rtl {
    type: number
    sql: ${TABLE}.rtl ;;
  }
  dimension: sub_category {
    type: string
    sql: ${TABLE}.sub_category ;;
  }
  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }
  dimension_group: week_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.week_end ;;
  }
  dimension: week_id {
    type: number
    sql: ${TABLE}.week_id ;;
  }

####################### Measures Starts

  measure: cost_price {
    type: sum
    sql: ${cost} ;;
  }

  measure: sale_price {
    type: sum
    sql: ${rtl} ;;
  }

  measure: total_quantity {
    label: "Total Quantity Sold"
    type: sum
    sql: ${qty} ;;
    # value_format_name: decimal_0
    # value_format: "0.0,, M"
    description: "Measures sales volume"
  }

  measure: total_revenue  {
    label: "Total Revenue"
    type: sum
    sql: ${rtl} ;;
    value_format_name: usd_0
    # value_format:"$ 0.0,, M"
    description: "Measures overall sales performance"
  }

  measure: total_cost  {
    label: "Total Cost"
    type: sum
    sql: ${cost} ;;
    value_format_name: usd_0
    # value_format:"$ 0.0,, M"
    description: "Tracks total expenditure on items sold"
  }

  measure: gross_profit  {
    label: "Gross Profit"
    type: number
    sql: ${total_revenue}-${total_cost} ;;
    value_format_name: usd_0
    # value_format:"$ 0.0,, M"
    description: "Indicates overall profitability"
  }

  measure: gross_margin  {
    label: "Gross Margin (%)"
    type: number
    sql: (${gross_profit}/${total_revenue})  ;;
    value_format_name: percent_1
    description: "Shows profitability as a percentage of revenue"
  }

  measure: total_net_profit {
    label: "Total Net Profit"
    type: number
    sql: ${total_revenue}-${total_cost} ;;
    value_format_name: usd_0
  }

  measure: average_selling_price {
    label: "Average Selling Price per Unit"
    type: number
    sql: ${total_cost}/${total_quantity} ;;
    value_format_name: usd_0
  }

  # measure: average_helpfulness_score {
  #   label: "Average Helpfulness Score"
  #   type: average
  #   sql: ${helpfulness_score} ;;
  # }

  # measure: average_rating {
  #   label: "Average Rating"
  #   type: average
  #   sql: ${overall_rating} ;;
  # }

  # measure: total_helpful_votes {
  #   label: "Total Helpful Votes"
  #   type: sum
  #   sql: ${__helpful_votes} ;;
  # }

  # measure: total_not_helpful_votes {
  #   label: "Total Not Helpful Votes"
  #   type: sum
  #   sql: ${__not_helpful_votes} ;;
  # }

  measure: count {
    type: count
  }
####################### Measures Ends

####################### Dashboard Navigation Button Starts

  parameter: dashboard_selector {
    type: unquoted
    allowed_value: {
      label: "Overall Performance"
      value: "overall_performance"
    }
    allowed_value: {
      label: "Category Specific Insights"
      value: "category_insights"
    }
  }

  dimension: dashboard_navigation {
    type: string
    sql: "" ;;
    html:
          <div style="border-bottom: solid 1px #4285F4;">
            <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
              {% if dashboard_selector._parameter_value == 'overall_performance' %}
                <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;">Overall Performance</a>
                <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/694">Category Specific Insights</a>
              {% else %}
                <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/693">Overall Performance</a>
                <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;">Category Specific Insights</a>
              {% endif %}
            </nav>
          </div>
        ;;
  }

####################### Dashboard Navigation Button Ends

}
