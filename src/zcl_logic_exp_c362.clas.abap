CLASS zcl_logic_exp_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_logic_exp_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    "IF/ENDIF
*    DATA(lv_letra) = 'D'.
*
*    IF lv_letra EQ 'A'.
*      out->write( lv_letra ).
*    ELSEIF lv_letra EQ 'B'.
*      out->write( lv_letra ).
*    ELSEIF lv_letra EQ 'C'.
*      out->write( lv_letra ).
*    ELSE.
*      out->write( 'Unidentified.' ).
*    ENDIF.
*
*
*    DATA(lv_num) = '3'.
*    IF lv_num EQ '3' OR lv_letra EQ 'B'.
*      out->write( 'valid values' ).
*    ENDIF.
*
** IF ANIDADOS
*    DATA(lv_texto)  = 'ABAP'.
*    DATA(lv_texto2) = 'programming'.
*    DATA(lv_texto3) = 'classes'.
*
*    IF lv_texto = 'ABAP'.
*      IF lv_texto2 EQ 'programming'.
*        IF lv_texto3 = 'classes'.
*          out->write( 'Correct' ).
*        ELSE.
*          out->write( 'Incorrect' ).
*        ENDIF.
*      ENDIF.
*    ENDIF.
*
*    " VALOR INICIAL
*    CLEAR lv_num.
*
*    DATA: lv_char TYPE c LENGTH 3.
*
*    IF lv_num IS INITIAL.
*      out->write( 'The Variable is empty' ).
*    ENDIF.
*
*    IF lv_char IS INITIAL.
*      out->write( 'The Variable is empty' ).
*    ENDIF.
*
** Case
*    CASE lv_letra.
*      WHEN 'A'.
*        out->write( lv_letra ).
*      WHEN 'B'.
*        out->write( lv_letra ).
*      WHEN 'C'.
*        out->write( lv_letra ).
*      WHEN OTHERS.
*        out->write( 'Unidentified.' ).
*    ENDCASE.
*
*    DATA(lv_client) = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
*                                                  min  = 1
*                                                  max  = 3 )->get_next( ).
*    CASE lv_client.
*      WHEN 1.
*        out->write( lv_client ).
*        out->write( 'Company client 1' ).
*      WHEN 2.
*        out->write( lv_client ).
*        out->write( 'Company client 2' ).
*      WHEN 3.
*        out->write( lv_client ).
*        out->write( 'Company client 3' ).
*      WHEN OTHERS.
*        out->write( 'Client not registered in the database' ).
*    ENDCASE.
*


* Do - enddo
*    DO 5 TIMES.
*
*      out->write( 'Master ABAP' ).
*
*    ENDDO.

*    DATA(lv_counter) = 1.
*
*    DO.
*
*      out->write( 'Master ABAP' ).
*
*      IF lv_counter = 10.
*        EXIT.
*      ENDIF.
*
*      lv_counter += 1.
*
*    ENDDO.

* Check
*    DO 20 TIMES.
*      DATA(gv_resto) = sy-index MOD 2.
*      CHECK gv_resto = 0.
*      out->write( sy-index ).
*    ENDDO.

* SWITCH
*    DO 6 TIMES.
*      DATA(lv_value) = SWITCH #( sy-index
*                                 WHEN 1 THEN |Iteration 1|
*                                 WHEN 2 THEN |Iteration 2|
*                                 WHEN 3 THEN |Iteration 3|
*                                 ELSE |# Iteration greater than 3 |  ).
*      out->write( lv_value ).
*    ENDDO.

* COND
*    DATA(lv_get_time) = cl_abap_context_info=>get_system_time(  ).
*
*    DATA(lv_time) = COND #(
*                    WHEN lv_get_time < '120000' THEN |{ lv_get_time TIME = ISO } AM|
*                    WHEN lv_get_time > '120000' THEN |{ CONV t( lv_get_time - 12 * 3600 )  TIME = ISO } PM|
*                    WHEN lv_get_time = '120000' THEN |High Noon|
*                    ELSE |Unidentified time| ).
*
*    out->write( lv_time ).

* While-endwhile
*    DATA: lv_num TYPE i value 1.
*
*    "CLEAR lv_num.
*
*    WHILE lv_num LE 10.
*
*      out->write(  |Número =  { lv_num }| ) .
*
*      lv_num += 1.
*
*      out->write( |# de iteración = { sy-index } | ).
*
*      IF lv_num GT 5.
*        EXIT.
*      ENDIF.
*
*    ENDWHILE.

* loop - endloop
*    SELECT FROM /dmo/airport
*    FIELDS airport_id,
*           name
*    INTO TABLE @DATA(lt_table)
*    UP TO 50 ROWS.
*
*    LOOP AT lt_table INTO DATA(ls_table).
*      out->write( |{ ls_table-airport_id }-{ ls_table-name }| ).
*    ENDLOOP.

* Try-endtry
    TRY.
        DATA(lv_result) = 100 / 0.

      CATCH cx_root INTO DATA(lx_exemp). "CX_SY_ZERODIVIDE
        out->write( lx_exemp->get_text( ) ).
    ENDTRY.





















  ENDMETHOD.

ENDCLASS.
