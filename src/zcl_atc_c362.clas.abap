CLASS zcl_atc_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_atc_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT *
        FROM /DMO/I_Connection
        INTO  @DATA(ls_connection).

   ENDSELECT.

  ENDMETHOD.

ENDCLASS.
