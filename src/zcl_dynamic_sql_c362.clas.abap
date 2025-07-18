CLASS zcl_dynamic_sql_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dynamic_sql_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    TYPES: BEGIN OF ty_content,
*             AirlineID          TYPE /dmo/carrier_id,
*             ConnectionID       TYPE /dmo/connection_id,
*             FlightDate         TYPE /dmo/flight_date,
*             Price              TYPE /dmo/flight_price,
*             CurrencyCode       TYPE /dmo/currency_code,
*             DepartureAirport   TYPE /dmo/airport_from_id,
*             DestinationAirport TYPE /dmo/airport_to_id,
*           END OF ty_content.

* Dynamic Internal Table
    DATA lo_generic_data TYPE REF TO data.
    FIELD-SYMBOLS <lt_itab> TYPE STANDARD TABLE.

    DATA: "lt_content          TYPE STANDARD TABLE OF ty_content,
      lv_datasource_name  TYPE string,
      lv_selected_columns TYPE string,
      lv_where_conditions TYPE string.

    lv_datasource_name = '/DMO/I_Flight'. " /DMO/I_Flight /DMO/I_Connection

    IF lv_datasource_name = '/DMO/I_Flight'.

      lv_selected_columns = |AirlineID, ConnectionID, FlightDate, Price, CurrencyCode|.
      lv_where_conditions = |( AirlineID eq 'LH' or AirlineID eq 'AA' ) or  CurrencyCode eq 'USD'|.

    ELSEIF lv_datasource_name = '/DMO/I_Connection'.

      lv_selected_columns = |AirlineID, ConnectionID, DepartureAirport, DestinationAirport|.
      lv_where_conditions = |AirlineID eq 'LH' or AirlineID eq 'AA'|.

    ENDIF.

    TRY.

        " Dynamic Internal Table
        DATA(lo_comp_table) = CAST cl_abap_structdescr(
                                   cl_abap_typedescr=>describe_by_name( lv_datasource_name ) )->get_components( ).

        DATA(lo_struct_type) = cl_abap_structdescr=>create( lo_comp_table ).

        DATA(lo_table_type) = cl_abap_tabledescr=>create( lo_struct_type ).

        CREATE DATA lo_generic_data TYPE HANDLE lo_table_type.

        ASSIGN lo_generic_data->* TO <lt_itab>.

        SELECT FROM (lv_datasource_name)
        FIELDS (lv_selected_columns)
        WHERE (lv_where_conditions)
        "INTO CORRESPONDING FIELDS OF TABLE @lt_content.
        INTO TABLE @<lt_itab>.

      CATCH cx_sy_dynamic_osql_syntax
            cx_sy_dynamic_osql_semantics
            cx_sy_dynamic_osql_error INTO DATA(lx_dynamic_sql).

        out->write( lx_dynamic_sql->get_text( ) ).

    ENDTRY.

    IF sy-subrc = 0.
      "out->write( lt_content ).
      out->write( <lt_itab> ).
    ENDIF.




















  ENDMETHOD.

ENDCLASS.
