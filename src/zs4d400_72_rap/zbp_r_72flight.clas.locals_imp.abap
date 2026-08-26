CLASS lhc_zr_72flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
       keys FOR Flight~validatePrice.
ENDCLASS.

CLASS lhc_zr_72flight IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.


  METHOD validatePrice.

    DATA ls_failed_record   LIKE LINE OF failed-flight.
    DATA ls_reported_record LIKE LINE OF reported-flight.

    READ ENTITIES OF ZR_72Flight IN LOCAL MODE
      ENTITY Flight
        FIELDS ( Price )
        WITH CORRESPONDING #(  keys )
        RESULT DATA(lt_flights).

    LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<ls_flight>).

      	  IF <ls_flight>-Price <= 0.
        	
        	    ls_failed_record-%tky = <ls_flight>-%tky.
        	APPEND ls_failed_record TO failed-flight.
        		
        ls_reported_record-%tky = <ls_flight>-%tky.
        ls_reported_record-%msg = new_message(
                        id       = '/LRN/S4D400'
                        number   = '101'
                        severity = ms-error ).
        APPEND ls_reported_record TO reported-flight.
        		
      	ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
