CLASS zcl_string_functions_log_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_string_functions_log_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " separated by a comma.
    DATA: flag TYPE c LENGTH 1 VALUE 'X',
          str1 TYPE string VALUE `Hallo!`.

    "Examples for type n
    DATA zip_code TYPE n LENGTH 5 VALUE '12345'.
    DATA isbn_number TYPE n LENGTH 13 VALUE '1234567890123'.

    "Constant; content cannot be changed at runtime
    CONSTANTS pi TYPE p LENGTH 8 DECIMALS 14 VALUE '3.14159265358979'.

    "More data object declarations
    DATA: char1 TYPE c LENGTH 5,
          html  TYPE string,
          str2  LIKE html.

    "Value assignments
    char1 = 'ab123'.
    html  = `<p>hallo</p>`.

    "Inline declarations
    DATA(char2) = 'abcd'. "Type c length 4
    DATA(str5)  = `efgh`.

* Concatenate

    DATA: lv_string_a TYPE string VALUE 'Welcome to Logali  Group',
          lv_string_b TYPE string.

    "si no le especifico el espacio, quedan pegados
    lv_string_b = 'ABAP' && ` ` && 'Student'.

*    CONCATENATE lv_string_a lv_string_b INTO DATA(lv_fin_string) SEPARATED BY ' '. "or space
*    out->write( | Concatenation 1: { lv_fin_string } | ).
*
*    CONCATENATE 'x ' 'y ' 'z ' INTO DATA(lv_string_c) RESPECTING BLANKS.
*    out->write( | Concatenation 2: { lv_string_c } | ).
*
*    DATA(lv_fin_string2) = | Concatenation 3: { lv_string_a } / { lv_string_b } |.
*    out->write( lv_fin_string2 ).
*
*    "para concatenar lineas de una tabla interna
*    SELECT FROM /dmo/flight
*       FIELDS carrier_id
*       INTO TABLE @DATA(lt_itab).
*
*    DATA(lv_itab_string) = concat_lines_of( table = lt_itab sep = ` ` ).
*    out->write( | { lv_itab_string } | ).

**    """"CONDENSE
*    out->write( lv_string_a ).
*    CONDENSE lv_string_a. "deja un solo espacio
*    out->write( lv_string_a ).
*
*    CONDENSE lv_string_a NO-GAPS. "quita todos los espacios
*    out->write( lv_string_a ).
*
*    """"condense() function
*    lv_string_a = '        Welcome       to Logali     Group '.
**    lv_string_a = condense( lv_string_a ). "deja solo un espacio
**    out->write( lv_string_a ).
*
**    lv_string_a = condense( val = lv_string_a from = `` ). "quita espacios iniciales y finales
*    lv_string_a = condense( val = lv_string_a to = `` ).  "quita todos los espacios en blanco
*    out->write( lv_string_a ).
*
*    lv_string_a = condense( val = '!!!ABAP!!!Course!!!' del = '!' ). "El parámetro especifica los caracteres iniciales y finales que se eliminarán
*    out->write( lv_string_a ).

* Split
*    DATA(lv_string1) = 'Logali-Group-SAP-Academy'.
*    out->write( lv_string1 ).
*    SPLIT lv_string1 AT '-' INTO DATA(gv_word1)
*                                 DATA(gv_word2)
*                                 DATA(gv_word3)
*                                 DATA(gv_word4).
*    out->write( gv_word1 ).
*    out->write( gv_word2 ).
*    out->write( gv_word3 ).
*    out->write( gv_word4 ).
*
*    "Function segment para obtener el valor de un segmento en particular
*    gv_word3 = segment( val = lv_string1 index = 4 sep = `-` ).
*
*    out->write( gv_word3 ).

    "LOWER / UPPER
*    DATA(lv_invoice) = to_upper( 'abcdexyc' ).
*    out->write( lv_invoice ).
*
*    lv_invoice = to_lower( 'INVaXXYYZz' ).
*    out->write( lv_invoice ).
*
*    "TRANSLATE statements
*    lv_invoice = '123invclient02'.
*    TRANSLATE lv_invoice TO UPPER CASE. "HALLO
*    out->write( lv_invoice ).
*
*    TRANSLATE lv_invoice TO LOWER CASE. "hallo
*    out->write( lv_invoice ).
*
*    "transformar directamente el valor
*    lv_invoice = to_upper( lv_invoice ).
*    out->write( lv_invoice ).

*    " Reemplazar REPLACE
    DATA(lv_replace) = 'Logali-Group-Academia-SAP'.
    DATA(lv_sign) = '-'.
    out->write( lv_replace ). "Valor Inicial

*    REPLACE '-' WITH '/' INTO lv_replace.
*    out->write( lv_replace ). "valor reemplazado el primero que encuentra


   "REPLACE ALL OCCURRENCES OF '-' IN lv_replace WITH '/'.
*   out->write( lv_replace ). "valor reemplazado todos
    out->write( lv_replace ). "Valor Inicial

    lv_replace = replace( val = lv_replace sub = lv_sign with = '/' occ = 0 ).
    "lv_replace = replace( val = lv_replace  with = `#` off = 5 len = 3  ).
    out->write( lv_replace ).

* REGEX
    DATA(lv_regex) = '^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$'.
    DATA(lv_email) = 'alumno@logali.com'.

    FIND REGEX lv_regex IN lv_email .

    IF sy-subrc EQ 0.
      out->write( 'Correo electrónico válido' ).
    ELSE.
     out->write( 'Correo electrónico inválido, verifique sus datos' ).
    ENDIF.

    FINAL(regex)    = `(\b.at\b)`.
    FINAL(text)     = `Cathy's cat with the hat sat on Matt's mat.`.
    FIND PCRE regex IN text SUBMATCHES FINAL(subm).
    IF sy-subrc = 0.
      out->write( subm ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
