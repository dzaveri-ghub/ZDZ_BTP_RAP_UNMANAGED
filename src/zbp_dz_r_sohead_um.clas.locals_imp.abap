CLASS lhc_ZDZ_R_SOHEAD_UM DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zdz_r_sohead_um RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zdz_r_sohead_um RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zdz_r_sohead_um.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zdz_r_sohead_um.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zdz_r_sohead_um.

    METHODS read FOR READ
      IMPORTING keys FOR READ zdz_r_sohead_um RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zdz_r_sohead_um.

    METHODS rba_Soitem FOR READ
      IMPORTING keys_rba FOR READ zdz_r_sohead_um\_Soitem FULL result_requested RESULT result LINK association_links.

    METHODS cba_Soitem FOR MODIFY
      IMPORTING entities_cba FOR CREATE zdz_r_sohead_um\_Soitem.

*    METHODS earlynumbering_create FOR NUMBERING
*      IMPORTING entities FOR CREATE ZDZ_R_SOHEAD_UM.

ENDCLASS.

CLASS lhc_ZDZ_R_SOHEAD_UM IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.


    zcl_dz_static_api=>create(
      EXPORTING
        entities = entities
      CHANGING
        mapped   = mapped
        failed   = failed
        reported = reported
    ).



*    importing   entities    type table for create zdz_r_sohead_um   [ derived type... ]
*changing    mapped  type response for mapped early zdz_r_sohead_um  [ derived type... ]
*failed  type response for failed early zdz_r_sohead_um  [ derived type... ]
*reported    type response for reported early zdz_r_sohead_um


  ENDMETHOD.

  METHOD update.

    zcl_dz_static_api=>update(
      EXPORTING
        entities = entities
      CHANGING
        mapped   = mapped
        failed   = failed
        reported = reported
    ).

  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Soitem.
  ENDMETHOD.

  METHOD cba_Soitem.
  ENDMETHOD.

*  METHOD earlynumbering_create.
*
*  cl_uuid_factory=>create_system_uuid( )->create_uuid_x16(
*    RECEIVING
*      uuid = data(lv_soid)
*  ).
*  CATCH cx_uuid_error.



"mapped parameter will pass value to the screen
"early numbering (triggered before save method)->
"%cid will act as a primary key when primary key value is blank

*    mapped-zdz_r_sohead_um  =   value #( For ls_entities in entities
*
*                                            (
*
*                                            "unique id - temporary primary key
*                                            %cid    =   ls_entities-%cid
*
*                                            "enabling draft functionality
*                                            %is_draft    =   ls_entities-%is_draft
*
*                                            "generated soid (lv_soid)
*                                            "Generated soid will takeover
*                                            soid    =   lv_soid
*
*                                            )
*                                       ).
*   " clear lv_soid.
*
*  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZDZ_I_SOIT_UM DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zdz_i_soit_um.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zdz_i_soit_um.

    METHODS read FOR READ
      IMPORTING keys FOR READ zdz_i_soit_um RESULT result.

    METHODS rba_Soheader FOR READ
      IMPORTING keys_rba FOR READ zdz_i_soit_um\Soheader FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZDZ_I_SOIT_UM IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Soheader.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZDZ_R_SOHEAD_UM DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS adjust_numbers REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZDZ_R_SOHEAD_UM IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.



  METHOD save.


    zcl_dz_static_api=>save(
      CHANGING
        reported = reported
    ).

*    if zcl_dz_static_api=>gt_reported_upd is NOT initial.
*
*        LOOP AT zcl_dz_static_api=>gt_reported_upd into data(gs_report_upd).
**
**
**            READ entities OF zdz_r_sohead_um  "root entity
**             entity zdz_r_sohead_um
**             ALL FIELDS    "require all fields
**             with value #( (  %key-Soid    =   gs_report_upd-soid ) )
**
**             result data(lt_result) "storing in internal table
**             failed data(lt_failed).
***
**             loop AT lt_result into data(ls_result).
*
*                    APPEND VALUE #(
*                                  %key = VALUE #( Soid = gs_report_upd-soid )"gs_report_upd-soid "ls_result-%key
*                                  %msg = new_message_with_text(
*                                             severity = if_abap_behv_message=>severity-information
*                                             text     = gs_report_upd-message " 'Sales order successfully updated.'
*                                         )
*                              ) TO reported-zdz_r_sohead_um.
*
*
**            endloop.
*        endloop.
*
*    elseif zcl_dz_static_api=>gt_reported_create is not initial.
*
*            LOOP AT zcl_dz_static_api=>gt_reported_create into data(gs_report_create).
*
*
*                 APPEND VALUE #(
*                              %key = VALUE #( Soid = gs_report_create-soid )"gs_report_upd-soid "ls_result-%key
*                              %msg = new_message_with_text(
*                                         severity = if_abap_behv_message=>severity-information
*                                         text     = gs_report_create-message
*                                     )
*                          ) TO reported-zdz_r_sohead_um.
*            ENDLOOP.
*
*
*    endif.

*
*
*    LOOP AT zcl_dz_static_api=>gt_sohead into data(gs_sohead).
*
*
*        READ entities OF zdz_r_sohead_um  "root entity
*         entity zdz_r_sohead_um
*         ALL FIELDS    "require all fields
*         with value #( (  %key-Soid    =   gs_sohead-soid ) )
*
*         result data(lt_result) "storing in internal table
*         failed data(lt_failed).
**
*         loop AT lt_result into data(ls_result).
*
*
*
*
*                APPEND VALUE #(
*                              %key = ls_result-%key
*                              %msg = new_message_with_text(
*                                         severity = if_abap_behv_message=>severity-error
*                                         text     = 'Not Allowed: Sales Id already exists.'
*                                     )
*                          ) TO reported-zdz_r_sohead_um.
*
*
*
*
*        endloop.
*        endloop.
*
*  endif.

  ENDMETHOD.


   Method adjust_numbers.

        zcl_dz_static_api=>adjust_numbers(
          CHANGING
            mapped   = mapped
            reported = reported
        ).




  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
