CLASS zcl_global_temp_table_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_global_temp_table_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA: lt_employee TYPE STANDARD TABLE OF zemployee_3_c362.

    lt_employee = VALUE #( ( emp_id = 1
                             emp_name = 'Enrique'
                             emp_last_name  = 'Perez'
                             emp_age        = '36'
                             emp_sex       = 'M' )
                           ( emp_id = 2
                             emp_name = 'Laura'
                             emp_last_name  = 'Perez'
                             emp_age        = '36'
                             emp_sex       = 'F' )  ).

    MODIFY zemployee_3_c362 FROM TABLE @lt_employee.

    IF sy-subrc = 0.

      SELECT * FROM zemployee_3_c362 INTO TABLE @DATA(lt_results).

      out->write( lt_results ).

    ENDIF.

  ENDMETHOD.

ENDCLASS.
