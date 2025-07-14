CLASS zcl_sql_i_select_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_i_select_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*
*    SELECT SINGLE FROM zcarrier_lgl_362
*    FIELDS *
*    WHERE currency_code = 'USD'
*    INTO @DATA(ls_airline)
*    BYPASSING BUFFER.
*
*    IF sy-subrc = 0.
*      out->write( ls_airline ).
*    ENDIF.

    DATA: lt_airlines TYPE STANDARD TABLE OF zcarrier_lgl_362.

*    SELECT FROM zcarrier_lgl_362
*    FIELDS *
*    WHERE currency_code = 'USD'
*    INTO TABLE @lt_airlines.
*
*    IF sy-subrc = 0.
*      out->write( lt_airlines ).
*
*      out->write( 'Appending' ).
*
*      SELECT FROM zcarrier_lgl_362
*      FIELDS *
*      WHERE currency_code = 'EUR'
*      APPENDING TABLE @lt_airlines.
*
*      out->write( lt_airlines ).
*
*    ENDIF.

*    out->write( 'New Select' ).
*
*    SELECT FROM zcarrier_lgl_362
*      FIELDS *
*      WHERE currency_code = 'ABD'
*      INTO TABLE @lt_airlines.
*
*    IF sy-subrc = 0.
*      out->write( lt_airlines ).
*    ELSE.
*      out->write( 'No data in internal table ' ).
*    ENDIF.

*    TYPES: BEGIN OF ty_flights,
*             airlineid    TYPE c LENGTH 3,
*             connection   TYPE c LENGTH 4,
*             price        TYPE p LENGTH 16 DECIMALS 2,
*             currencycode TYPE c LENGTH 5,
*           END OF ty_flights.
*
*    DATA: lt_flights TYPE STANDARD TABLE OF ty_flights.
*
*    SELECT FROM /dmo/flight
*    FIELDS carrier_id as airlineid,
*           connection_id as connection,
*           price,
*           currency_code as currencycode
*    WHERE carrier_id = 'LH'
*    INTO TABLE @lt_flights.
*
*    IF sy-subrc = 0.
*
*      out->write( lt_flights ).
*
*    ENDIF.

*    SELECT SINGLE FROM /dmo/flight
*      FIELDS carrier_id as airlineid,
*           connection_id as connectionid,
*           price,
*           currency_code as currencycode
*      WHERE carrier_id = 'AA'
*       AND  connection_id = '0322'
*       AND flight_date = '20250414'
*       INTO @DATA(ls_flight).
*
*    IF sy-subrc = 0.
*
*      out->write( ls_flight ).
*
*    ENDIF.

*    SELECT FROM /dmo/flight
*     FIELDS carrier_id as airlineid,
*          connection_id,
*          price,
*          currency_code
*     WHERE carrier_id = 'AA'
*      INTO TABLE @DATA(lt_flight).
*
*    IF sy-subrc = 0.
*
*      out->write( lt_flight ).
*
*    ENDIF.


*    SELECT FROM /dmo/flight
*    FIELDS *
*     WHERE carrier_id = 'AA'
*     INTO TABLE @DATA(lt_flights)
*     UP TO 4 ROWS.
*
*    IF sy-subrc = 0.
*
*      out->write( lt_flights ).
*
*    ENDIF.

*    DATA: lt_flights TYPE SORTED TABLE OF /dmo/flight
*                      WITH NON-UNIQUE KEY carrier_id connection_id.

*    SELECT FROM /dmo/flight
*        FIELDS *
*        INTO  @DATA(ls_flights).
*      "INTO TABLE @lt_flights.
*      "PACKAGE SIZE 3.
*
*      out->write( ls_flights ).
*
*    ENDSELECT.

*  SELECT single  for Update
*  FROM zflight_lgl
*        FIELDS *
*         INTO @data(lt_flights).
*
*  SELECT single
*  FROM zflight_lgl USING CLIENT '200'
*        FIELDS *
*         INTO @data(lt_flights).
*
*
*   select from /DMO/I_Flight
*   FIELDS *
*   FOR ALL ENTRIES IN @lt_flights
*   where AirlineID = @lt_flights-airlineid
*   into table @data(lt_dummy).

*    SELECT FROM /dmo/flight
*            FIELDS *
*            WHERE flight_date GE '20240414'
*             INTO TABLE @DATA(lt_flights).

* GT, >
* GE, >=
* LT, <
* LE, <=
* EQ, =

*    SELECT FROM /dmo/flight
*    FIELDS *
*     WHERE flight_date GE '20240414'
*       AND flight_date LE '20250414'
*      INTO TABLE @DATA(lt_flights).
*
*    IF sy-subrc = 0.
*      out->write( lines( lt_flights ) ).
*      out->write( lt_flights ).
*    ENDIF.

*    SELECT FROM /dmo/flight
*    FIELDS *
*     WHERE flight_date NOT BETWEEN '20240414' AND '20250414'
*      INTO TABLE @DATA(lt_flight2).
*
*    IF sy-subrc = 0.
*      out->write( lines( lt_flight2 ) ).
*      out->write( lt_flight2 ).
*    ENDIF.

*    DATA: lv_search_criteria TYPE string VALUE '%_egel%'.
*
*    SELECT FROM /DMO/I_Airport
*    FIELDS *
*     WHERE name LIKE @lv_search_criteria
*      INTO TABLE @DATA(lt_airports).
*
*    IF sy-subrc = 0.
*      out->write( lt_airports ).
*    ELSE.
*      out->write( 'No Data' ).
*    ENDIF.


*    modify zcarrier_0904 from @( VALUE #( carrier_id = 'AV'
*                                             name = 'AVIANCA%'
*                                    currency_code = 'COP' ) ) .

*    DATA: c_escape TYPE c LENGTH 1 VALUE '*'.
*
*    SELECT FROM zcarrier_0904
*    FIELDS *
*     WHERE name LIKE '%*%%' ESCAPE @c_escape
*      INTO TABLE @DATA(lt_carrier).
*
*    IF sy-subrc = 0.
*      out->write( lt_carrier ).
*    ELSE.
*      out->write( 'No Data' ).
*    ENDIF.

*    SELECT FROM /dmo/flight
*    FIELDS *
*     WHERE carrier_id IN ( 'AA', 'AC', 'JL' )
*      INTO TABLE @DATA(lt_carrier).
*
*    IF sy-subrc = 0.
*      out->write( lt_carrier ).
*    ELSE.
*      out->write( 'No Data' ).
*    ENDIF.

*    DATA lr_price TYPE RANGE OF /dmo/price.
*
*    lr_price = VALUE #( ( sign = 'I' "E
*                          option = 'BT' " EQ
*                          low = 500
*                          high = 1500 ) ).
*
*    APPEND VALUE #( sign = 'I' "E
*                    option = 'EQ' " EQ
*                       low = '4996.00' ) to lr_price.
*
*    SELECT FROM /dmo/flight
*    FIELDS *
*     WHERE price IN @lr_price
*       and currency_code = 'USD'
*      INTO TABLE @DATA(lt_flights).
*
*    IF sy-subrc = 0.
*      out->write( lt_flights ).
*    ELSE.
*      out->write( 'No Data' ).
*    ENDIF.

*    CONSTANTS lc_no_value TYPE c VALUE ''.
*
*    SELECT FROM /dmo/flight
*      FIELDS *
*       WHERE currency_code IS NULL
*          OR currency_code = @lc_no_value
*          OR currency_code = @space
*        INTO TABLE @DATA(lt_flights).
*
*    IF sy-subrc = 0.
*      out->write( lt_flights ).
*    ELSE.
*      out->write( 'No Null or empty values available' ).
*    ENDIF.

*    SELECT FROM /DMO/I_Connection
*      FIELDS *
*       WHERE
*             ( AirlineID = 'AA' OR AirlineID = 'LH' )
*         AND
*             ( DepartureAirport = 'SFO' OR
*               DepartureAirport = 'JFK' )
*        AND
*            NOT ConnectionID = '0401'
*
*         INTO TABLE @DATA(lt_connection).
*
*    IF sy-subrc = 0.
*      out->write( lt_connection ).
*    ELSE.
*      out->write( 'No Data' ).
*    ENDIF.


*    SELECT FROM /DMO/I_Flight
*          FIELDS MIN( MaximumSeats ) AS MinSeats,
*                 MAX( MaximumSeats ) AS MaxSeats
*          INTO ( @DATA(lv_minseats), @DATA(lv_maxseats) ).
*        "   INTO @DATA(ls_min_max).
*
*    IF sy-subrc = 0.
*      out->write( |Min Seats: { lv_minseats }, Max Seats: { lv_maxseats }| ).
*     " out->write( ls_min_max ).
*    ENDIF.

*    SELECT FROM /DMO/I_Flight
*    FIELDS AVG( DISTINCT MaximumSeats ) AS AvgSeats,
*           SUM( DISTINCT MaximumSeats ) AS SumSeats
*    WHERE AirlineID = 'AA'
*      INTO ( @DATA(lv_avgseats), @DATA(lv_sumseats) ).
*
*    IF sy-subrc = 0.
*      out->write( |AVG Seats: { lv_avgseats }, SUM Seats: { lv_sumseats }| ).
*    ENDIF.

*    SELECT FROM /DMO/I_Flight
*    FIELDS DISTINCT MaximumSeats
*    WHERE AirlineID = 'AA'
*      INTO @DATA(lv_distinct).
*
*      IF sy-subrc = 0.
*        out->write( lv_distinct ).
*      ENDIF.
*
*    ENDSELECT.

*    SELECT FROM /DMO/I_Flight
*    FIELDS DISTINCT MaximumSeats
*    WHERE AirlineID = 'AA'
*      INTO table @DATA(lt_distinct).
*
*      IF sy-subrc = 0.
*        out->write( lt_distinct ).
*      ENDIF.

*    SELECT FROM /DMO/I_Flight
*     FIELDS COUNT( * ) AS countall,
*            COUNT( DISTINCT MaximumSeats ) AS countMaxSeats
*     WHERE AirlineID = 'AA'
*       INTO ( @DATA(lv_countall), @DATA(lv_scountmaxseats) ).
*
*    IF sy-subrc = 0.
*      out->write( |Count All: { lv_countall }, Count max Seats: { lv_scountmaxseats }| ).
*    ENDIF.

*    SELECT FROM /DMO/I_Flight
*    FIELDS AirlineID,
*           CurrencyCode,
*           COUNT( DISTINCT ConnectionID ) AS CountDisConn
*    WHERE FlightDate GE '20240101'
*     GROUP BY AirlineID, CurrencyCode
*      INTO TABLE @DATA(lt_results).
*
*    IF sy-subrc = 0.
*      out->write( lt_results ).
*    ENDIF.

*1. from
*2. where
*3. group by
*4. having
*5. select
*6. order by
*7. up to (limit)

*    SELECT FROM /DMO/I_Flight
*    FIELDS AirlineID,
*          MIN( MaximumSeats ) AS MinSeats,
*          MAX( MaximumSeats ) AS MaxSeats
*    WHERE FlightDate BETWEEN '20240101' AND '20301231'
*     GROUP BY AirlineID
*     HAVING AirlineID IN ( 'AA', 'LH', 'UA' )
*      INTO TABLE @DATA(lt_results).
*
*    IF sy-subrc = 0.
*      out->write( lt_results ).
*    ENDIF.

*    SELECT FROM /DMO/I_Flight
*        FIELDS AirlineID,
*               ConnectionID,
*               FlightDate,
*               Price,
*               CurrencyCode
*        WHERE FlightDate BETWEEN '20240101' AND '20301231'
*        ORDER BY FlightDate DESCENDING "Ascending
*          INTO TABLE @DATA(lt_results).
*
*    IF sy-subrc = 0.
*      out->write( lt_results ).
*    ENDIF.

*        SELECT FROM /DMO/I_Flight
*        FIELDS AirlineID,
*               ConnectionID,
*               FlightDate,
*               Price,
*               CurrencyCode
*        WHERE FlightDate BETWEEN '20240101' AND '20301231'
*        ORDER BY PRIMARY KEY
*          INTO TABLE @DATA(lt_results).
*
*    IF sy-subrc = 0.
*      out->write( lt_results ).
*    ENDIF.

*1. from
*2. where
*3. group by
*4. having
*5. select
*6. order by
*7. up to (limit)


*    SELECT FROM /DMO/I_Flight
*    FIELDS AirlineID,
*           MIN( Price ) AS MinPrice
*    WHERE PlaneType = '767-200'
*    GROUP BY AirlineID, CurrencyCode HAVING CurrencyCode IN ( 'USD', 'EUR' )
*    ORDER BY AirlineID ASCENDING
*      INTO TABLE @DATA(lt_results)
*      UP TO 3 ROWS.
*
*    IF sy-subrc = 0.
*      out->write( lt_results ).
*    ENDIF.


*    select SINGLE from /DMO/I_Flight
*      fields *
*      order by
*      into data@( ls_results).

* OFFSET

      DATA: lv_page_number      TYPE i VALUE 2,
            lv_records_per_page type i value 10.

    DATA: gv_offset TYPE int8.

* Page 1 = Block 0
* Page 2 = Block 1

    gv_offset = ( lv_page_number - 1 ) * lv_records_per_page.

    SELECT FROM /DMO/I_Flight
    FIELDS *
    WHERE CurrencyCode = 'USD'
    ORDER BY AirlineID, ConnectionID, FlightDate ASCENDING
    INTO TABLE @DATA(lt_results)
    OFFSET @gv_offset
    UP TO @lv_records_per_page ROWS.

    IF sy-subrc = 0.
      out->write( lt_results ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
