view: item_region_sales {
  sql_table_name: `pandera-bi-demo.ccai.item_region_sales` ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }
  dimension: item {
    type: number
    sql: ${TABLE}.item ;;
  }
  dimension: majmin {
    type: number
    sql: ${TABLE}.majmin ;;
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
  measure: profit {
    type: sum
    sql: ${rtl}-${cost} ;;
  }
  measure: count {
    type: count
  }
  measure: total_quantity {
    type: sum
    sql: ${qty} ;;

  }
  measure: average_sentiment_score {
    type: average
    sql: ${sales_brakepad_oilfilter2.sentiment_score} ;;
  }
  measure: average_sentiment_magnitude {
    type: average
    sql: ${sales_brakepad_oilfilter2.sentiment_magnitude} ;;
  }
  measure: total_reviews {
    type: count_distinct
    sql: ${bazaarvoice_csv_top_brake_pad_skus2.review_id} ;;
  }
  measure: average_helpfulness_score {
    type: average
    sql: ${bazaarvoice_csv_top_brake_pad_skus2.helpfulness_score} ;;
  }
  measure: average_rating {
    type: average
    sql: ${bazaarvoice_csv_top_brake_pad_skus2.overall_rating} ;;
  }
  measure: total_helpful_votes {
    type: sum
    sql: ${bazaarvoice_csv_top_brake_pad_skus2.__helpful_votes} ;;
  }
  measure: total_not_helpful_votes {
    type: sum
    sql: ${bazaarvoice_csv_top_brake_pad_skus2.__not_helpful_votes} ;;
  }
  measure: product_recommendation_rate {
    type: average
    sql: CASE
         WHEN ${bazaarvoice_csv_top_brake_pad_skus2.recommend_to_a_friend__y_n_} THEN 1
         ELSE 0
       END ;;
  }
  dimension: site_nav {
    type: string
    sql: "" ;;
    html:
    <div style="border:solid 0px #000000; border-radius: 4px; padding: 10px 12px;
               background: #00A1F1; text-align: center; font-family: Google Sans; height: 100%">
        <nav style="display: flex; justify-content: space-evenly; align-items: center; font-size: 14px; letter-spacing: 1px;">
            <a style="flex: 1; text-align: center; padding: 16px; line-height: 40px; color:#FFFFFF;" href="/dashboards/689">Overall Performance</a>
            <a style="color: #FFFFFF;">|</a>
            <a style="flex: 1; text-align: center; padding: 16px; line-height: 40px; color:#FFFFFF;" href="/dashboards/691">Category Specific Insights</a>
        </nav>
    </div>
    ;;
  }


}
