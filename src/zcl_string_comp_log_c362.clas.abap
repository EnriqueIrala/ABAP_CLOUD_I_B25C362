CLASS zcl_string_comp_log_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_string_comp_log_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* Define the text to be checked
    DATA(lv_text) = 'This is an example text for SAP ABAP programming.'.

* Check if the text contains the pattern
    IF lv_text CP '*SAP*'.
      out->write( 'The text contains the pattern "SAP"' ).
    ELSE.
      out->write( 'The text does not contain the pattern "SAP"' ).
    ENDIF.

* Check if the text does not contain the pattern
    "el patron g no lo sigue ningun otro caracter
    IF lv_text NP 'g+'.
      out->write( 'The text does not contain the pattern "SAP"' ).
    ELSE.
      out->write( 'The text contains the pattern "SAP"' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
