view: test_new_attr {
  sql_table_name: `pandera-bi-demo.ccai.test_new_attr` ;;

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
    primary_key: yes
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
  dimension: review_text {
    type: string
    sql: ${TABLE}.Review_Text ;;
  }
  dimension: rating_flag {
    type: yesno
    sql: ${overall_rating}>=4 ;;
  }
  dimension: length_review_text {
    type: yesno
    sql: length(${review_text}) between 17 and 30  ;;
  }
  measure: avg_rating {
    type: average
    sql: round(${overall_rating},0) ;;
    value_format_name: decimal_0
  }
  measure: avg_helpfulness_score {
    type: average
    sql: ${helpfulness_score}*10 ;;
    value_format_name: percent_0
  }
  measure: count {
    type: count
  }
}
