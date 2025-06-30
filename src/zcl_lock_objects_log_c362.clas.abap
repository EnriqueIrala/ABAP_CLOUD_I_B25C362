CLASS zcl_lock_objects_log_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lock_objects_log_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( |User has started the process| ).

    " Creo instancia de objeto de bloqueo
    TRY.

        DATA(lo_lock_object) = cl_abap_lock_object_factory=>get_instance( iv_name = 'EZEMP_LGL_C362' ).

      CATCH cx_abap_lock_failure.
        out->write( |Lock Object Instance not created| ).
        RETURN.
    ENDTRY.

    " Bloqueo el objeto
    TRY.

        DATA lt_parameter TYPE if_abap_lock_object=>tt_parameter.

        lt_parameter = VALUE #( ( name = 'EMP_ID'
                                  value = REF #( '1' ) ) ).

        lo_lock_object->enqueue(
*      it_table_mode =
          it_parameter  = lt_parameter
*      _scope        =
*      _wait         =
         ).

      CATCH cx_abap_foreign_lock cx_abap_lock_failure.
        out->write( |Not possible write on the DB. Object is locked| ).
        RETURN.

*      CATCH cx_abap_foreign_lock.
*        out->write( |Foreing Lock Exception| ).
*      CATCH cx_abap_lock_failure.
*        out->write( |Not possible write on the DB. Object is locked| ).
*        RETURN.
    ENDTRY.

    out->write( |Lock Object is active| ).

    " Modifico el objeto
    DATA(ls_employee5) = VALUE zemployee_2_c362( emp_id = 1
                                                 emp_name = 'Juan'
                                                 emp_last_name = 'Lopez'
                                                 emp_age = 36
                                                 emp_sex = 'M' ).

    MODIFY zemployee_2_c362 FROM @ls_employee5.

    IF sy-subrc = 0.
      out->write( |Object Updated in DB| ).
    ENDIF.

    " Libero el objeto
    TRY.

        lo_lock_object->dequeue(
*      it_table_mode =
          it_parameter  = lt_parameter
*      _scope        =
*      _synchronous  =
        ).
      CATCH cx_abap_lock_failure.
        out->write( |Lock Object was not released| ).
        RETURN.
    ENDTRY.

    out->write( |Lock Object was released| ).

  ENDMETHOD.

ENDCLASS.
