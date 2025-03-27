view: sales_brakepad_oilfilter2 {
  sql_table_name: `pandera-bi-demo.ccai.sales_brakepad_oilfilter2` ;;

  dimension: category {
    hidden: yes
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: item {
    type: number
    sql: ${TABLE}.item ;;
  }
  dimension: minor {
    type: string
    sql: ${TABLE}.minor ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}.Product_ID ;;
  }
  dimension: profit {
    hidden: yes
    type: number
    sql: ${TABLE}.profit ;;
  }
  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: review_text {
    hidden: yes
    type: string
    sql: ${TABLE}.review_text ;;
  }
  dimension: review_text2 {
    hidden: yes
    type: string
    sql: ${TABLE}.Review_Text2 ;;
  }
  dimension: review_title {
    type: string
    sql: ${TABLE}.Review_Title ;;
  }
  dimension: rtl {
    type: number
    sql: ${TABLE}.rtl ;;
  }
  dimension: sentiment_magnitude {
    type: number
    sql: ${TABLE}.sentiment_magnitude ;;
  }
  dimension: sentiment_score {
    type: number
    sql: ${TABLE}.sentiment_score ;;
  }
  dimension: sub_category {
    hidden: yes
    type: string
    sql: ${TABLE}.sub_category ;;
  }
  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }
  dimension: vehicle__free_text_fields_ {
    type: string
    sql: ${TABLE}.Vehicle__Free_text_Fields_ ;;
  }
  dimension_group: weekend {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.weekend_date ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
  }
}
