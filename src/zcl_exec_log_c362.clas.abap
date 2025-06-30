CLASS zcl_exec_log_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
    DATA: v_variable1 TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_exec_log_c362 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    out->write( 'Hola Logali' ).
*
*    DATA: lv_string TYPE string,                " Variable de tipo string (cadena de caracteres)
*          lv_int    TYPE i VALUE 20250110,      " Variable de tipo número entero
*          lv_date   TYPE d,
*          lv_dec    TYPE p LENGTH 8 DECIMALS 2 VALUE '202501.13',
*          lv_car    TYPE c LENGTH 10 VALUE 'LogaliHOLAABAP',
*          lv_num    TYPE n LENGTH 6 VALUE '345678'.
*
*    lv_string = '20250110'.
*    lv_date =  '20250110'.
*
*    lv_num = 1234.
*
*    out->write( lv_string ).
*    out->write( lv_int ).
*    out->write( lv_date ).
*    out->write( lv_dec ).
*    out->write( lv_car ).
*    out->write( lv_num ).
*
** Complex data types
*    TYPES: BEGIN OF ty_data,
*             id   TYPE i,
*             name TYPE string,
*             age  TYPE i,
*           END OF ty_data.
*
*    DATA: ls_employee TYPE ty_data.
*
*    ls_employee = VALUE #(   id   = 12345
*                             name = 'Laura'
*                             age  = 25   ).
*
*    out->write( ls_employee ).
*
** Reference data types.
*
*    DATA: lvr_int   TYPE REF TO i,
*          lvr_strig TYPE REF TO string.
*
*    DATA lvr_ddic_tab TYPE REF TO /dmo/airport.
*
*    DATA lvr_int2 LIKE lvr_int.
*
*    TYPES: lvr_int3 TYPE REF TO i.
*
*    DATA: lvr_int4 TYPE lvr_int3.
*
*
*
*    DATA: lo_ref TYPE REF TO zcl_exec_log_c362.
*
** Data Objects
*
*    DATA: lv_variable1 TYPE c LENGTH 20.
*
*    CONSTANTS: c_constant1 TYPE c LENGTH 6 VALUE 'LOGALI',
*               c_date      TYPE d VALUE '20250510',
*               c_int       TYPE i VALUE 220.
*
*    lv_variable1 = 'Hola Logali'.
*
*    DATA(lv_result) = 4 + 7.
*
*    out->write( lv_result ).
*
*    DATA(str_b3) = `ghi`.
*    "In the following case, it is a text field literal with quotes. Type c is derived.
*    "The length is derived from the number of characters.
*    DATA(c_l3) = 'jkl'. "type c length 3
*    DATA(c_l4) = 'mnop'. "type c length 4
*
*
*   data(ls_employee2) = value zst_employee_c362( employee_id = 1
*                                                name = 'Juan'
*                                                last_name = 'Lopez'
*                                                age = 35
*                                                sex = 'M'
*                                                adress-address_id = 1
*                                                adress-street_name = 'Street 1'
*                                                adress-int_number = 12
*                                                adress-city = 'New York'
*                                                adress-country = 'US' ).
*
*   out->write( ls_employee2 ).
*
*   data(ls_employee3) = value zst_employee2_c362( employee_id = 1
*                                                name = 'Juan'
*                                                last_name = 'Lopez'
*                                                age = 35
*                                                sex = 'M'
*                                                address_id = 1
*                                                street_name = 'Street 1'
*                                                int_number = 12
*                                                city = 'New York'
*                                                country = 'US' ).
*
*   out->write( ls_employee3 ).
*
*   data(lt_emp_addr) = value ztt_emp_address_c362( ( address_id = 1
*                                                street_name = 'Street 1'
*                                                int_number = 12
*                                                city = 'New York'
*                                                country = 'US' )
*                                                ( address_id = 2
*                                                street_name = 'Street 1'
*                                                int_number = 13
*                                                city = 'New York'
*                                                country = 'US' ) ).
*
*   out->write( lt_emp_addr ).
*
*
*   data(ls_employee4) = value zst_employe3_c362( employee_id = 1
*                                                name = 'Juan'
*                                                last_name = 'Lopez'
*                                                age = 35
*                                                sex = 'M' ).
*
*   ls_employee4-address = VALUE #( ( address_id = 1
*                                   street_name = 'Street 1'
*                                   int_number = 12
*                                   city = 'New York'
*                                   country = 'US' )
*                                   ( address_id = 2
*                                   street_name = 'Street 1'
*                                   int_number = 12
*                                   city = 'New York'
*                                   country = 'US' ) ).
*
*   out->write( ls_employee4 ).


    DATA(ls_employee5) = VALUE zemployee_2_c362( emp_id = 1
                                                 emp_name = 'Juana'
                                                 emp_last_name = 'Lopez'
                                                 emp_age = 35
                                                 emp_sex = 'F'
                                                 emp_salary = 3000
                                                 currency = 'USD' ).

    MODIFY zemployee_2_c362 FROM @ls_employee5.

    ls_employee5 = VALUE zemployee_2_c362( emp_id = 2
                                                 emp_name = 'Juan'
                                                 emp_last_name = 'Lopez'
                                                 emp_age = 23
                                                 emp_sex = 'M'
                                                 emp_salary = 2000
                                                 currency = 'EUR' ).

    MODIFY zemployee_2_c362 FROM @ls_employee5.

    ls_employee5 = VALUE zemployee_2_c362( emp_id = 3
                                                 emp_name = 'Pedro'
                                                 emp_last_name = 'Lopez'
                                                 emp_age = 56
                                                 emp_sex = 'M'
                                                 emp_salary = 1000
                                                 currency = 'USD' ).

    MODIFY zemployee_2_c362 FROM @ls_employee5.

    IF sy-subrc = 0.
      out->write( 'data inserted' ).
    ELSE.
      out->write( 'Error' ).
    ENDIF.









































  ENDMETHOD.
ENDCLASS.
