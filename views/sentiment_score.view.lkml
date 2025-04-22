view: sentiment_score {
  sql_table_name: `pandera-bi-demo.ccai.sentiment_score` ;;

  dimension: _ {
    type: number
    sql: ${TABLE}._ ;;
  }
  dimension: unique_key {
    primary_key: yes
    sql: concat(${item},${weekend_date}) ;;
    hidden: yes
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: item {
    type: number
    sql: ${TABLE}.item ;;
  }
  dimension: minor {
    type: string
    sql: ${TABLE}.minor ;;
  }
  dimension: review_text {
    type: string
    sql: ${TABLE}.Review_Text ;;
  }
  dimension: sentiment_magnitude {
    type: number
    sql: ${TABLE}.sentiment_magnitude ;;
  }
  dimension: sentiment_score {
    type: number
    sql: CAST(${TABLE}.sentiment_score AS FLOAT64) ;;
  }
  dimension: sub_category {
    type: string
    sql: ${TABLE}.sub_category ;;
  }
  dimension_group: weekend {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.weekend_date ;;
  }
  measure: avg_sentiment_score {
    label: "AVG Sentiment Score"
    type: average
    sql: ${sentiment_score} ;;
  }
  measure: avg_sentiment_magnitude {
    label: "AVG Sentiment Magnitude"
    type: average
    sql: ${sentiment_magnitude} ;;
  }
  measure: count {
    type: count
  }
}
