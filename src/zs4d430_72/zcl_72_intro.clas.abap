CLASS zcl_72_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_72_intro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA var TYPE string.
*    DATA VAR TYPE /LRN/S4D430_IND*
*    DATA var TYPE /lrn/s4d430_ind_cds_view.

    SELECT FROM /lrn/s4d430_ind
      FIELDS *
      INTO TABLE @DATA(result).

  ENDMETHOD.

ENDCLASS.
