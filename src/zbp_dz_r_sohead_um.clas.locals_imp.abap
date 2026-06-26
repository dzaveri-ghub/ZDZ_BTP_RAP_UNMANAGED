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

ENDCLASS.

CLASS lhc_ZDZ_R_SOHEAD_UM IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
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
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
