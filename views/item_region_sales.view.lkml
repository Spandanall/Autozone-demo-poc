view: item_region_sales {
  sql_table_name: `pandera-bi-demo.ccai.item_region_sales` ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: cost {
    label: "Cost Price"
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: item {
    primary_key: yes
    label: "Item ID"
    type: number
    sql: ${TABLE}.item ;;
  }

  dimension: majmin {
    type: number
    sql: ${TABLE}.majmin ;;
  }

  dimension: minor {
    label: "Item - label"
    type: string
    sql: ${TABLE}.minor ;;
  }

  dimension: qty {
    label: "Quantity Sold"
    type: number
    sql: ${TABLE}.qty ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: rtl {
    label: "Sale Price"
    type: number
    sql: ${TABLE}.rtl ;;
  }

  dimension: sub_category {
    label: "Sub Category"
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
    value_format_name: decimal_0
    description: "Measures sales volume"
  }

  measure: total_revenue  {
    label: "Total Revenue"
    type: number
    sql: ${sale_price}*${total_quantity} ;;
    value_format_name: usd_0
    description: "Measures overall sales performance"
  }

  measure: total_cost  {
    label: "Total Cost"
    type: number
    sql: ${cost_price}*${total_quantity} ;;
    value_format_name: usd_0
    description: "Tracks total expenditure on items sold"
  }

  measure: gross_profit  {
    label: "Gross Profit"
    type: number
    sql: ${total_revenue}*${total_cost} ;;
    value_format_name: usd_0
    description: "Indicates overall profitability"
  }

  measure: gross_margin  {
    label: "Gross Margin (%)"
    type: number
    sql: (${gross_profit}*${total_revenue}) * 100 ;;
    value_format_name: usd_0
    description: "Shows profitability as a percentage of revenue"
  }

  measure: total_net_profit {
    label: "Total Net Profit"
    type: number
    sql: ${sale_price}-${cost_price} ;;
    value_format_name: usd_0
  }

  measure: average_sentiment_score {
    label: "Average Sentiment Score"
    type: average
    sql: ${sales_brakepad_oilfilter2.sentiment_score} ;;
    value_format_name: decimal_0
    description: "Gauges overall customer satisfaction (positive/negative sentiment)"
  }

  measure: average_sentiment_magnitude {
    label: "Average Sentiment Magnitude"
    type: average
    sql: ${sales_brakepad_oilfilter2.sentiment_magnitude} ;;
    value_format_name: decimal_0
    description: "Measures the intensity of customer feedback"
  }

  measure: total_reviews {
    label: "Total Reviews"
    type: count_distinct
    sql: ${sales_brakepad_oilfilter2.review_title} ;;
  }

  measure: average_helpfulness_score {
    label: "Average Helpfulness Score"
    type: average
    sql: ${bazaarvoice_csv_top_brake_pad_skus2.helpfulness_score} ;;
  }

  measure: average_rating {
    label: "Average Rating"
    type: average
    sql: ${bazaarvoice_csv_top_brake_pad_skus2.overall_rating} ;;
  }

  measure: total_helpful_votes {
    label: "Total Helpful Votes"
    type: sum
    sql: ${bazaarvoice_csv_top_brake_pad_skus2.__helpful_votes} ;;
  }

  measure: total_not_helpful_votes {
    label: "Total Not Helpful Votes"
    type: sum
    sql: ${bazaarvoice_csv_top_brake_pad_skus2.__not_helpful_votes} ;;
  }

  # measure: product_recommendation_rate {
  #   label: "Product Recommendation (Y/N) - (1/0)"
  #   type: average
  #   sql: CASE
  #       WHEN ${bazaarvoice_csv_top_brake_pad_skus2.recommend_to_a_friend__y_n_} THEN 1
  #       ELSE 0
  #     END ;;
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
                <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" href="/dashboards/689">Overall Performance</a>
                <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/691">Category Specific Insights</a>
              {% else %}
                <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards/689">Overall Performance</a>
                <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" href="/dashboards/691">Category Specific Insights</a>
              {% endif %}
            </nav>
          </div>
        ;;
  }

####################### Dashboard Navigation Button Ends

}
