CLASS zcl_72_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_72_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA:
      number1 TYPE i,
      number2 TYPE i,
      number3 TYPE i,
      number4 TYPE i.

    number1 = -10.
    number2 = 20.

    out->write( |number1 = { number1 }| )->write( |number2 = { number2 }| ).

    number3 = abs( number1 ).
    number4 = number2.

    DATA(result) = number3 / number4.

    out->write( |number3 = { number3 }| )->write( |number4 = { number4 }| )->write( |result = { result }| ).

  ENDMETHOD.
ENDCLASS.
