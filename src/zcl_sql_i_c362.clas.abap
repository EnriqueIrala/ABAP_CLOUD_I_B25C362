CLASS zcl_sql_i_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_i_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* Insert Data
    DATA ls_airline TYPE zcarrier_lgl_362.
*
*    ls_airline = VALUE #( carrier_id = 'LH'
*                          name = 'Lufthansa'
*                          currency_code = 'USD' ).
*
*    "INSERT INTO zcarrier_lgl_362 VALUES @ls_airline.
*    "INSERT zcarrier_lgl_362 FROM @ls_airline.
*
*    INSERT zcarrier_lgl_362 FROM @( VALUE #( carrier_id = 'KLM'
*                                             name = 'KLM'
*                                             currency_code = 'EUR' ) ).
*
*    IF sy-subrc = 0.
*      out->write( 'Insert correct' ).
*    ELSE.
*      out->write( 'Insert error' ).
*    ENDIF.

    "Multiple records
*    DELETE FROM zcarrier_lgl_362.
*
    DATA lt_ddbb TYPE STANDARD TABLE OF zcarrier_lgl_362.
*
*    FREE: lt_ddbb.
*
    SELECT FROM /DMO/I_Carrier
    FIELDS *
     WHERE CurrencyCode = 'USD'
      INTO TABLE @DATA(lt_airlines).

*    SELECT FROM /dmo/carrier
*    FIELDS carrier_id,
*           name,
*           currency_code
*     WHERE currency_code = 'USD'
*      INTO CORRESPONDING FIELDS OF TABLE @lt_ddbb.


    IF sy-subrc = 0.

      lt_ddbb = CORRESPONDING #( lt_airlines MAPPING carrier_id = AirlineID
                                                     currency_code = CurrencyCode ).

      INSERT zcarrier_lgl_362 FROM TABLE @lt_ddbb.
*
*      IF sy-subrc = 0.
*        out->write( 'Insert correct' ).
*      ELSE.
*        out->write( 'Insert error' ).
*      ENDIF.
*
    ENDIF.

* Update
**    SELECT SINGLE FROM zcarrier_lgl_362
**    FIELDS *
**    WHERE carrier_id = 'AA'
**     INTO @ls_airline.
*
**    IF sy-subrc = 0.
*
*    ls_airline = VALUE #( carrier_id = 'AA'
*                          "name = ''
*                          currency_code = 'USD' ).
*
*
**    ls_airline-currency_code = 'EUR'.
*
*    UPDATE zcarrier_lgl_362 FROM @ls_airline.
*
*    IF sy-subrc = 0.
*      out->write( 'Update correct' ).
*    ENDIF.

*    ENDIF.

*    "Multiple records
*    SELECT FROM zcarrier_lgl_362
*    FIELDS *
*     INTO TABLE @DATA(lt_airline).
*
*    IF sy-subrc = 0.
*
*      LOOP AT lt_airline ASSIGNING FIELD-SYMBOL(<fs_airline>).
*        <fs_airline>-currency_code = 'MXN'.
*      ENDLOOP.
*
*      UPDATE zcarrier_lgl_362 FROM TABLE @lt_airline.
*
*      IF sy-subrc = 0.
*        out->write( 'Update correct' ).
*      ENDIF.

    " Columns
*    UPDATE  zcarrier_lgl_362
*     set currency_code = 'USD'.
**     where carrier_id = 'AA'
**        or carrier_id = 'FJ'.
*
*     IF sy-subrc = 0.
*       out->write( 'Update correct' ).
*     ENDIF.

*     UPDATE  zcarrier_lgl_362
*     set counter = counter + 10
*     where carrier_id = 'AA'.
**        or carrier_id = 'FJ'.
*
*     IF sy-subrc = 0.
*       out->write( 'Update correct' ).
*     ENDIF.

*  MODIFY
*    ls_airline = VALUE #( carrier_id = 'WZ'
*                          name = 'Wizz Air'
*                          currency_code = 'USD' ).
*
*    MODIFY zcarrier_lgl_362 FROM @ls_airline.
*
*    IF sy-subrc = 0.
*      out->write( 'Modify correct' ).
*    ENDIF.
*
*
*    SELECT FROM zcarrier_lgl_362
*    FIELDS *
*    WHERE carrier_id = 'AA'
*       OR carrier_id = 'WZ'
*     INTO TABLE @DATA(lt_airline).
*
*    IF sy-subrc = 0.
*
*      LOOP AT lt_airline ASSIGNING FIELD-SYMBOL(<fs_airline>).
*        <fs_airline>-currency_code = 'MXN'.
*      ENDLOOP.
*
*      APPEND VALUE #( carrier_id = 'AV'
*                      name = 'Avianca'
*                      currency_code = 'COP' ) TO lt_airline.
*
*      MODIFY zcarrier_lgl_362 FROM TABLE @lt_airline.
*
*      IF sy-subrc = 0.
*        out->write( 'Update correct' ).
*      ENDIF.
*
*    ENDIF.
*
*

* DELETE
*    ls_airline = VALUE #( carrier_id = 'WZ'
*                          name = 'Wizz Air'
*                          currency_code = 'USD' ).
*
*    DELETE zcarrier_lgl_362 FROM @ls_airline.
*
*    IF sy-subrc = 0.
*      out->write( 'Delete correct' ).
*    ENDIF.

    " Multiple records

*    SELECT FROM zcarrier_lgl_362
*    FIELDS *
*    WHERE currency_code = 'USD'
*     INTO TABLE @DATA(lt_airline).
*
*    IF sy-subrc = 0.
*
*      DELETE zcarrier_lgl_362 FROM TABLE @lt_airline.
*
*      IF sy-subrc = 0.
*        out->write( 'Delete correct' ).
*      ENDIF.
*
*    ENDIF.

*    " With condition
*    DELETE FROM zcarrier_lgl_362
*           WHERE currency_code = 'MXN'
*            OR currency_code = 'COP'.
*
*    IF sy-subrc = 0.
*      out->write( 'Delete correct' ).
*    ENDIF.




























  ENDMETHOD.

ENDCLASS.
