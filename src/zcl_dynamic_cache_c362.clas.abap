CLASS zcl_dynamic_cache_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dynamic_cache_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    GET TIME STAMP FIELD DATA(lv_begin).

    SELECT FROM zemployee_2_c362
    FIELDS currency,
           SUM( emp_salary ) AS TotalSalary
    GROUP BY currency
    INTO TABLE @DATA(lt_salary).

    IF sy-subrc = 0.
      GET TIME STAMP FIELD DATA(lv_end).

      DATA(lv_dif) = cl_abap_tstmp=>subtract(
                       tstmp1 = lv_end
                       tstmp2 = lv_begin ).

      out->write( lt_salary ).
      out->write( |Execution Time: { lv_dif }| ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.
