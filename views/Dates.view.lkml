view: Dates {
  sql_table_name: blkm3sdt2ntv4qbczuf6.Dates ;;
  drill_fields: [Year]

  dimension: Year {
    type: string
    sql: ${TABLE}.Year;;
  }
  dimension: Next_Year {
    type: string
    sql: ${TABLE}.year_next;;
  }
  dimension: Previous_Year {
    type: string
    sql: ${TABLE}.year_previous;;
  }

}
