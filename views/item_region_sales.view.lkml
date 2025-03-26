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
}
