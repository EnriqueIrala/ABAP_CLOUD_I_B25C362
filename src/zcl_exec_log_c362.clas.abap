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

    out->write( 'Hola Logali' ).

    DATA: lv_string TYPE string,                " Variable de tipo string (cadena de caracteres)
          lv_int    TYPE i VALUE 20250110,      " Variable de tipo número entero
          lv_date   TYPE d,
          lv_dec    TYPE p LENGTH 8 DECIMALS 2 VALUE '202501.13',
          lv_car    TYPE c LENGTH 10 VALUE 'LogaliHOLAABAP',
          lv_num    TYPE n LENGTH 6 VALUE '345678'.

    lv_string = '20250110'.
    lv_date =  '20250110'.

    lv_num = 1234.

    out->write( lv_string ).
    out->write( lv_int ).
    out->write( lv_date ).
    out->write( lv_dec ).
    out->write( lv_car ).
    out->write( lv_num ).

* Complex data types
    TYPES: BEGIN OF ty_data,
             id   TYPE i,
             name TYPE string,
             age  TYPE i,
           END OF ty_data.

    DATA: ls_employee TYPE ty_data.

    ls_employee = VALUE #(   id   = 12345
                             name = 'Laura'
                             age  = 25   ).

    out->write( ls_employee ).

* Reference data types.

    DATA: lvr_int   TYPE REF TO i,
          lvr_strig TYPE REF TO string.

    DATA lvr_ddic_tab TYPE REF TO /dmo/airport.

    DATA lvr_int2 LIKE lvr_int.

    TYPES: lvr_int3 TYPE REF TO i.

    DATA: lvr_int4 TYPE lvr_int3.



    DATA: lo_ref TYPE REF TO zcl_exec_log_c362.

* Data Objects

    DATA: lv_variable1 TYPE c LENGTH 20.

    CONSTANTS: c_constant1 TYPE c LENGTH 6 VALUE 'LOGALI',
               c_date      TYPE d VALUE '20250510',
               c_int       TYPE i VALUE 220.

    lv_variable1 = 'Hola Logali'.

    DATA(lv_result) = 4 + 7.

    out->write( lv_result ).

    DATA(str_b3) = `ghi`.
    "In the following case, it is a text field literal with quotes. Type c is derived.
    "The length is derived from the number of characters.
    DATA(c_l3) = 'jkl'. "type c length 3
    DATA(c_l4) = 'mnop'. "type c length 4










































  ENDMETHOD.

ENDCLASS.
