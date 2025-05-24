CLASS zcl_text_elements_log_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_text_elements_log_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*    "Text symbols
*    "out->write( 'Welcome ABAP Student' ).
*    out->write( text-001 ).
*    out->write( 'This is your first text symbol' ).

*    DATA lv_string TYPE string VALUE 'LOGALI local  '.

*    "strlen() and numofchar(9
*    DATA(lv_num)   = strlen( 'LOGALI GROUP' ).
*    out->write( lv_num ).
*
*    lv_num = numofchar( '  LOGALI   ' ).
*    out->write( lv_num ).

*    "count
*    lv_num = count( val = lv_string sub = 'LO' ). "encuentra el número de coincidencias con el patron exacto
*    out->write( lv_num ).
*
*    lv_num = count_any_of( val = lv_string sub = 'LO' ). "encuentra las coincidencias no importa el orden
*    out->write( lv_num ). "encuentra el caracter L dos veces y O una vez
*
*    lv_num = count_any_not_of( val = lv_string sub = 'LO'  ).
*    out->write( lv_num ). "devuelve todas las posiciones que no coinciden con el patrón


*    "find
*    lv_num = find( val = lv_string sub = 'LI' ).
*    out->write( lv_num ).
*
*    lv_num = find_any_of( val = lv_string sub = 'LI' ).
*    out->write( lv_num ).
*
*    lv_num = find_any_not_of( val = lv_string sub = 'LI' ).
*    out->write( lv_num ).

    DATA lv_string TYPE string VALUE ' ¡LOGALI GROUP! Welcome to ABAP Cloud Master  '.

*    "Change Case of characters
*    out->write( |TO_UPPER         = {   to_upper(  lv_string ) } | ).
*    out->write( |TO_LOWER         = {   to_lower(  lv_string ) } | ).
*    out->write( |TO_MIXED         = {   to_mixed(  lv_string ) } | ).
*    out->write( |FROM_MIXED       = { from_mixed(  lv_string ) } | ).
*    out->write( | \r\n | ).
*
*    DATA:
*      original  TYPE c LENGTH 30 VALUE 'ABAP_DOCU_START',
*      to_sep    TYPE c LENGTH 1  VALUE '_',
*      to_case   TYPE c LENGTH 1 VALUE 'a',
*      to_min    TYPE i VALUE 1,
*      from_sep  TYPE c LENGTH 1  VALUE '.',
*      from_case TYPE c LENGTH 1  VALUE 'A',
*      from_min  TYPE i VALUE 5.
*
*    TRY.
*        out->write( |original:   { original }| ).
*        DATA(to_mixed) = to_mixed( val  = original
*                                   sep  = to_sep
*                                   case = to_case
*                                   min  = to_min ).
*        out->write( |to_mixed:   { to_mixed }| ).
*        DATA(from_mixed) = from_mixed( val  = to_mixed
*                                       sep  = from_sep
*                                       case = from_case
*                                       min  = from_min ).
*        out->write( |from_mixed: { from_mixed }| ).
*      CATCH cx_sy_strg_par_val.
*        out->write( 'Invalid parameters' ).
*    ENDTRY.

*    out->write( lv_string ).
*    "Change order of characters
*    out->write( |REVERSE             = {  reverse( lv_string ) } | ).
*    out->write( |SHIFT_LEFT  (places)= {  shift_left(  val = lv_string places   = 5  ) } | ).
*    out->write( |SHIFT_RIGHT (places)= {  shift_right( val = lv_string places   = 5  ) } | ).
*    out->write( |SHIFT_LEFT  (circ)  = {  shift_left(  val = lv_string circular = 5  ) } | ).
*    out->write( |SHIFT_RIGHT (circ)  = {  shift_right( val = lv_string circular = 5  ) } | ).
*    out->write( | \r\n | ).
*
*    " Extract a Substring
*    out->write( |SUBSTRING        = {  substring(        val = lv_string off = 9 len = 6 ) } | ).
*    out->write( |SUBSTRING_FROM   = {  substring_from(   val = lv_string sub = 'ABAP'     ) } | ).
*    out->write( |SUBSTRING_AFTER  = {  substring_after(  val = lv_string sub = 'ABAP'     ) } | ).
*    out->write( |SUBSTRING_TO     = {  substring_to(     val = lv_string sub = 'ABAP'     ) } | ).
*    out->write( |SUBSTRING_BEFORE = {  substring_before( val = lv_string sub = 'ABAP'     ) } | ).
*    out->write( | \r\n | ).
*
*    " Condense, REPEAT and Segment
*    out->write( |CONDENSE         = {   condense( val = lv_string ) } | ).
*    out->write( |REPEAT           = {   repeat(   val = lv_string occ = 2 ) } | ).
*    out->write( |SEGMENT1         = {   segment(  val = lv_string sep = '!' index = 1 ) } |  ).
*    out->write( |SEGMENT2         = {   segment(  val = lv_string sep = '!' index = 2 ) } |  ).
*    out->write( | \r\n | ).

*    "Contains
*    DATA: lv_text    TYPE string,
*          lv_pattern TYPE string.
*
*    lv_text = 'The employee`s number is: 123-456-7890'.
*    lv_pattern = `\d{3}-\d{3}-\d{4}`. " Patrón para un número de teléfono
*
*    IF contains( val = lv_text pcre = lv_pattern ).
*      out->write( 'The text contains a phone number' ).
*    ELSE.
*      out->write( 'The text doesn`t contains a phone number' ).
*    ENDIF.
*
*    "match
*    DATA(lv_number) = match( val = lv_text pcre = lv_pattern occ = 1 ).
*    out->write( lv_number ).
*
*    "Contains
*    DATA: lv_string2  TYPE string,
*          lv_pattern2 TYPE string.
*
*    lv_string2 = 'Please contact us at support@logali.com for more information'.
*    lv_pattern2 = `\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b`. " regex for a email
*
*    IF contains( val = lv_string2 pcre = lv_pattern2 ). "verdadero
*
*      out->write( 'The text contains an email address' ).
*
*      DATA(lv_count) = count( val = lv_string2 pcre = lv_pattern2 )." cuantas veces hay coincidencias
*      out->write( lv_count ).
*
*      DATA(lv_pos) = find( val = lv_string2 pcre = lv_pattern2 occ = 1 ). " donde está en lv_String
*      out->write( lv_pos ).
*
*    ELSE.
*      out->write( 'The text does not contain an email address' ).
*    ENDIF.

*    "INSERT
*    DATA(lv_ins_string) = insert( val = '123CLIENT02' sub = 'INV' off = 3 ).
*    out->write(  lv_ins_string  ).
*
*    lv_ins_string = insert( val = '123CLIENT02' sub = `INV` ).
*    out->write(  lv_ins_string  ).
*
*    "REVERSE
*    lv_ins_string = reverse( lv_ins_string ).
*    out->write(  lv_ins_string  ).

*****OVERLAY
    DATA(lv_company) = '--------------->Logali Group'.
    DATA(lv_name) = 'ABAP_Class                        '.
    OVERLAY lv_name WITH lv_company.
    out->write( lv_name ).

    DATA(lv_string3) = 'a.b.c.a.b.c.A'.
    DATA(lv_string4) = 'z.x.y.Z.x.y.z'.
    OVERLAY lv_string3 WITH lv_string4 ONLY 'ab'.
    out->write( lv_string3 ).



  ENDMETHOD.

ENDCLASS.
