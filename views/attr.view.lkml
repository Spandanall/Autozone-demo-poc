
view: attr {
  sql_table_name: `pandera-bi-demo.ccai.attr` ;;

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Product_ID ;;
  }

  dimension: review_text {
    type: string
    sql: ${TABLE}.Review_Text ;;
  }

  dimension: overall_rating {
    type: number
    sql: ${TABLE}.Overall_Rating ;;
  }

  dimension: recommend_to_a_friend__y_n_ {
    type: yesno
    sql: ${TABLE}.Recommend_to_a_Friend__Y_N_ ;;
  }

  dimension: helpfulness_score {
    type: number
    sql: ${TABLE}.Helpfulness_Score ;;
  }

  dimension: __not_helpful_votes {
    type: number
    sql: ${TABLE}.__Not_Helpful_Votes ;;
  }

  dimension: __helpful_votes {
    type: number
    sql: ${TABLE}.__Helpful_Votes ;;
  }

  dimension: ratings_only__y_n_ {
    type: yesno
    sql: ${TABLE}.Ratings_only__Y_N_ ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.sub_category ;;
  }

  dimension: minor {
    type: string
    sql: ${TABLE}.minor ;;
  }

  dimension: item {
    type: number
    sql: ${TABLE}.item ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }


  measure: avg_overall_rating {
    type: average
    sql: ${overall_rating} ;;
  }

  dimension: length_review_text {
    type: yesno
    sql: length(${review_text}) between 17 and 30  ;;
  }

  measure: count {
    type: count
  }

}
