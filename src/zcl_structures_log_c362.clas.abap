CLASS zcl_structures_log_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_structures_log_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "STRUCTURE
    DATA: BEGIN OF ls_empl,
            name  TYPE string, "tipo elemental
            id    TYPE i,
            email TYPE /dmo/email_address,
          END OF ls_empl.

    DATA: ls_employee  LIKE ls_empl. "Crear estructuras utilizando tipos estructurados existentes

* With types
    TYPES: BEGIN OF ty_empl,
             name  TYPE string, "tipo elemental
             id    TYPE i,
             email TYPE /dmo/email_address,
           END OF ty_empl.

    DATA: ls_employee1 TYPE ty_empl.

*    ls_employee1 = VALUE #( name = 'Pedro'
*                            id = 1
*                            email = 'pedro@logali.com' ).
*
*    out->write( ls_employee1 ).
*
*    DATA ls_flight TYPE /dmo/flight.
*
*    SELECT SINGLE *
*      FROM /dmo/flight
*      WHERE carrier_id = 'LH'
*      INTO @ls_flight.
*
*    out->write( data = ls_flight name = `Flight Reference Scenario` ).

* Nested Structure
*    DATA: BEGIN OF ls_empl_info,
*
*            BEGIN OF info,
*              id         TYPE i VALUE 123456,
*              first_name TYPE string VALUE `Laura`,
*              last_name  TYPE string VALUE `Martínez`,
*            END OF info,
*
*            BEGIN OF address,
*              city    TYPE string VALUE `Frankfurt`,
*              street  TYPE string VALUE `123 Main street`,
*              country TYPE string VALUE `Germany`,
*            END OF address,
*
*            BEGIN OF position,
*              department TYPE string VALUE `IT`,
*              salary     TYPE p DECIMALS 2 VALUE `2000.25`,
*            END OF position,
*
*          END OF ls_empl_info.
*
*    out->write( data = ls_empl_info name = `ls_empl_info` ).

* Deep structure

*    "Creando el tipo estructurado para  la tabla interna anidada
*    TYPES: BEGIN OF ty_flights,
*             flight_date   TYPE /dmo/flight-flight_date,
*             price         TYPE /dmo/flight-price,
*             currency_code TYPE /dmo/flight-currency_code,
*           END OF ty_flights.
*
*    "Creando la estructura profunda (DEEP)
*    DATA: BEGIN OF ls_flight,
*            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
*            connid     TYPE /dmo/flight-connection_id VALUE '0018',
*            lt_flights TYPE TABLE OF ty_flights WITH EMPTY KEY,
*          END OF ls_flight.
*
*     "DEEP structure
*    ls_flight = VALUE #(
*                carrier = 'SP' "spain
*                connid  = '2024'
*                lt_flights = VALUE #( ( flight_date = '20250101'
*                                      price = '150'
*                                      currency_code = 'EUR' )
*                                      ( flight_date = '20250101'
*                                      price = '150'
*                                      currency_code = 'EUR' ) ) ).
*
*    SELECT *
*      FROM /dmo/flight
*      WHERE carrier_id = 'AA'
*      INTO CORRESPONDING FIELDS OF TABLE @ls_flight-lt_flights "el nombre de los campos debe ser igual
*      UP TO 4 ROWS.
*
*    "out->write( data = ls_flight name = `ls_flight` ).
*
*    DATA: BEGIN OF ls_flight2,
*            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
*            connid     TYPE /dmo/flight-connection_id VALUE '0018',
*            ls_flights TYPE ty_flights,
*          END OF ls_flight2.
*
*    ls_flight2-carrier = 'LH'.
*    ls_flight2-connid = '0001'.
*    ls_flight2-ls_flights-currency_code = 'USD'.
*    ls_flight2-ls_flights-flight_date = '20250523'.
*    ls_flight2-ls_flights-price = '100.00'.
*
*    out->write( data = ls_flight2 name = `ls_flight2` ).
*
*
*    ls_flight2 = value #( carrier = 'AA'
*                          connid  = '0002'
*                          ls_flights-currency_code = 'EUR'
*                          ls_flights-price = '200.00' ).
*
*    out->write( data = ls_flight2 name = `ls_flight2` ).
*
*
*    clear: ls_flight2-carrier.
*
*    out->write( data = ls_flight2 name = `ls_flight2` ).
*
*    clear: ls_flight2.
*
*    out->write( data = ls_flight2 name = `ls_flight2` ).


    "NESTED Structure
    TYPES: BEGIN OF purchase_order_type,
             order_id   TYPE i,
             order_date TYPE d,
           END OF purchase_order_type,

           BEGIN OF supplier_type,
             supplier_id TYPE i,
             name        TYPE string,
           END OF supplier_type,

           BEGIN OF material_type,
             material_id TYPE i,
             name        TYPE string,
           END OF material_type.

    DATA ls_mat TYPE material_type.

    TYPES BEGIN OF invoice_type.
    INCLUDE TYPE purchase_order_type AS purchase.
    INCLUDE TYPE supplier_type AS supplier RENAMING WITH SUFFIX _supplier.
    INCLUDE STRUCTURE ls_mat AS mat RENAMING WITH SUFFIX _mat.
    TYPES END OF invoice_type.

    DATA: ls_purchase TYPE purchase_order_type,
          ls_invoice  TYPE invoice_type.

    ls_purchase-order_id   = 1234.
    ls_purchase-order_date = '20250101'.
    ls_invoice-purchase = ls_purchase.
    ls_invoice-supplier-supplier_id = 123.
    ls_invoice-supplier-name = 'xx'.
    ls_invoice-material_id_mat = 123.
    ls_invoice-name_mat = 'xx'.

    out->write( data = ls_invoice name = `ls_invoice` ).





  ENDMETHOD.

ENDCLASS.
