view: bazaarvoice_csv_top_brake_pad_skus2 {
  sql_table_name: `pandera-bi-demo.ccai.Bazaarvoice_CSV_Top_Brake_Pad_SKUs2` ;;

  dimension: __helpful_votes {
    type: number
    sql: ${TABLE}.__Helpful_Votes ;;
  }
  dimension: __not_helpful_votes {
    type: number
    sql: ${TABLE}.__Not_Helpful_Votes ;;
  }
  dimension: helpfulness_score {
    type: number
    sql: ${TABLE}.Helpfulness_Score ;;
  }
  dimension: overall_rating {
    type: number
    sql: ${TABLE}.Overall_Rating ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}.Product_ID ;;
  }
  dimension: ratings_only__y_n_ {
    type: yesno
    sql: ${TABLE}.Ratings_only__Y_N_ ;;
  }
  dimension: recommend_to_a_friend__y_n_ {
    type: yesno
    sql: ${TABLE}.Recommend_to_a_Friend__Y_N_ ;;
  }
  dimension: review_id {
    type: number
    sql: ${TABLE}.Review_ID ;;
  }
  dimension_group: review_submission {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Review_Submission_Date ;;
  }
  dimension: review_text {
    type: string
    sql: ${TABLE}.Review_Text ;;
  }
  dimension: review_title {
    type: string
    sql: ${TABLE}.Review_Title ;;
  }
  dimension: vehicle__free_text_fields_ {
    type: string
    sql: ${TABLE}.Vehicle__Free_text_Fields_ ;;
  }
  dimension: verified_purchaser {
    type: yesno
    sql: ${TABLE}.VerifiedPurchaser ;;
  }
  measure: count {
    type: count
  }
  measure: total_reviews {
    type: count
    sql: ${review_id} ;;
  }
  measure: average_helpfulness_score {
    type: average
    sql: ${TABLE}.Helpfulness_Score ;;
  }
  measure: average_rating {
    type: average
    sql: ${TABLE}.Overall_Rating ;;
  }
  measure: total_helpful_votes {
    type: sum
    sql: ${__helpful_votes} ;;
  }
  measure: total_not_helpful_votes {
    type: sum
    sql: ${__not_helpful_votes} ;;
  }
  measure: product_recommendation_rate {
    type: percent_of_total
    sql: ${recommend_to_a_friend__y_n_} ;;
    filters: [recommend_to_a_friend__y_n_: "Yes"]
  }
}
