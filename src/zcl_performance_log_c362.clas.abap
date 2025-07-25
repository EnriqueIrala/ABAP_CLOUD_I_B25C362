CLASS zcl_performance_log_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_performance_log_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES ty_flights TYPE STANDARD TABLE OF /dmo/flight
                      WITH NON-UNIQUE KEY carrier_id connection_id flight_date.

    DATA: lt_flights TYPE ty_flights.

    lt_flights = VALUE #( ( client = sy-mandt
                            carrier_id = 'CO'
                            connection_id = '0500'
                            flight_date = '20250201'
                            plane_type_id = '123-456'
                            price = '1000'
                            currency_code = 'COP' )
                            ( client = sy-mandt
                            carrier_id = 'MX'
                            connection_id = '0600'
                            flight_date = '20250120'
                            plane_type_id = '747-400'
                            price = '800'
                            currency_code = 'MXN' )
                            ( client = sy-mandt
                            carrier_id = 'QF'
                            connection_id = '0006'
                            flight_date = '20230112'
                            plane_type_id = 'A380'
                            price = '1600'
                            currency_code = 'AUD' )
                            ( client = sy-mandt
                            carrier_id = 'SP'
                            connection_id = '0700'
                            flight_date = '20250610'
                            plane_type_id = '321-654'
                            price = '100'
                            currency_code = 'EUR' )
                            ( client = sy-mandt
                            carrier_id = 'LX'
                            connection_id = '0900'
                            flight_date = '20250101'
                            plane_type_id = '258-963'
                            price = '50'
                            currency_code = 'COP' )
                            ( client = sy-mandt
                            carrier_id = 'CO'
                            connection_id = '0500'
                            flight_date = '20250204'
                            plane_type_id = '123-456'
                            price = '3000'
                            currency_code = 'COP' )  ).

*    out->write( 'Before sort' ).
*    out->write( lt_flights ).
*    out->write( lines( lt_flights ) ).

*    " Sort with primary key
*    SORT lt_flights.
*    out->write( 'Sort by Primary key' ).
*    out->write( lt_flights ).
*
*    " Sort by any fields
*    SORT lt_flights BY currency_code plane_type_id.
*    out->write( 'Sort by any field' ).
*    out->write( lt_flights ).
*
*    " Sort by any field - ascending and descending
*    SORT lt_flights BY carrier_id ASCENDING flight_date DESCENDING.
*    out->write( 'Sort by any field - ASC & DES' ).
*    out->write( lt_flights ).

* Delete records
*    DELETE ADJACENT DUPLICATES FROM lt_flights.
*    out->write( lines( lt_flights ) ).

*    SORT lt_flights BY carrier_id connection_id.
*    "DELETE ADJACENT DUPLICATES FROM lt_flights COMPARING carrier_id connection_id.
*    DELETE ADJACENT DUPLICATES FROM lt_flights COMPARING ALL FIELDS.
*    out->write( 'After sort' ).
*    out->write( lt_flights ).
*    out->write( lines( lt_flights ) ).

* REDUCE
*    DATA: lt_flights_red TYPE TABLE OF /dmo/flight.
*
*    SELECT FROM /dmo/flight
*    FIELDS *
*    INTO TABLE @lt_flights_red.
*
*    DATA(lv_sum) = REDUCE i( INIT lv_result = 0
*                             FOR ls_flight_red IN lt_flights_red
*                             NEXT lv_result += ls_flight_red-price ).
*
*    out->write( |The price Summatory is: { lv_sum }.| ).

* Internal tables access
    SELECT FROM /dmo/airport
    FIELDS *
    INTO TABLE @DATA(lt_airport).

    out->write( lt_airport ).

    LOOP AT lt_airport ASSIGNING FIELD-SYMBOL(<fs_airport>).
      <fs_airport>-country = 'CO'.
    ENDLOOP.

    out->write( lt_airport ).

    LOOP AT lt_airport INTO DATA(ls_airport).
      ls_airport-country = 'US'.
      MODIFY lt_airport FROM ls_airport.
    ENDLOOP.

    out->write( lt_airport ).

  ENDMETHOD.

ENDCLASS.
