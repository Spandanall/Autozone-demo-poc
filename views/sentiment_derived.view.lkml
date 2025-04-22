view: sentiment_derived {
  derived_table: {
    sql: SELECT
           item,
           weekend_date,
           AVG(CAST(sentiment_score AS FLOAT64)) AS avg_sentiment
         FROM ${sentiment_score.SQL_TABLE_NAME}
         GROUP BY 1, 2 ;;
  }

  dimension: item {
    type: string
    sql: ${TABLE}.item ;;
  }

  dimension: weekend_date {
    type: date
    sql: ${TABLE}.weekend_date ;;
  }

  measure: avg_sentiment_score {
    type: average
    sql: ${TABLE}.avg_sentiment ;;
  }
  measure: avg_sentiment_magnitude {
    type: average
    sql: ${TABLE}.avg_magnitude ;;
  }
}
