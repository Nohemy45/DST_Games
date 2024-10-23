# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: blkm3sdt2ntv4qbczuf6.Orders ;;
  drill_fields: [order_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: order_id {
    ##primary_key: yes
    type: string
    sql: ${TABLE}.OrderID ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${order_id},${product_id},${city}) ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "City" in Explore.

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost ;;
  }

  dimension: year {
    type: number
    sql: EXTRACT(YEAR FROM ${TABLE}.ShipDate) ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;  }
  measure: average_cost {
    type: average
    sql: ${cost} ;;  }

  measure: Margin {
    type: average
    sql: ${profit}/${sales} ;;
    value_format: "0.00%"
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.CustomerID ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.Discount ;;
  }

  dimension: order_date {
    type: date
    sql: ${TABLE}.OrderDate ;;
  }

  dimension: postal_code {
    type: zipcode
    sql: ${TABLE}.PostalCode ;;
  }

  dimension: product_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ProductID ;;
  }

  dimension: profit {
    type: number
    sql: ${TABLE}.Profit ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }

  dimension: ship_date {
    type: date
    sql: ${TABLE}.ShipDate ;;
  }

  dimension: ship_mode {
    type: string
    sql: ${TABLE}.ShipMode ;;
  }



  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }
  measure: count {
    type: count
    drill_fields: [order_id, products.product_id, customers.customer_id, customers.customer_name, returns.count]
  }
}
