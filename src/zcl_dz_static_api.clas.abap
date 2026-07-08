CLASS zcl_dz_static_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF tt_keys,

            key type uuid,

          END of tt_keys,

          begin of tt_reported_upd,

            soid TYPE uuid,
            msg_type TYPE symsgty,
            message type string,

          END OF tt_reported_upd,

          BEGIN OF tys_control,
            cid TYPE abp_behv_cid,
            msg TYPE REF TO if_abap_behv_message,
          END OF tys_control .

    TYPES:
        tt_update_so type table for update zdz_r_sohead_um,
        tt_mapped type response for mapped early zdz_r_sohead_um,
        tt_mapped_late type response for mapped late zdz_r_sohead_um,
        tt_failed  type response for failed early zdz_r_sohead_um,
        tt_reported type response for reported early zdz_r_sohead_um,

        tt_reported_late type response for reported late zdz_r_sohead_um,
        tt_create_so  type table for create zdz_r_sohead_um.




    CLASS-DATA:
        gt_sohead type STANDARD TABLE OF zdz_dt_so,
        gt_reported_late type table of tt_reported_late,
        gt_reported_upd TYPE table of tt_reported_upd,
        gt_reported_create TYPE table of tt_reported_upd,

        gv_create TYPE abap_bool,
        gv_update TYPE abap_bool,
        gt_key  type table of tt_keys.

    CLASS-METHODS:

        update
            importing
              entities    type tt_update_so

            changing
               mapped   TYPE tt_mapped
               failed   TYPE tt_failed
               reported type tt_reported,


          """""""""""""""""""""""Create Method"""""""""""""""""""""""

         create
            importing
              entities    type tt_create_so

            changing
               mapped   TYPE tt_mapped
               failed   TYPE tt_failed
               reported type tt_reported,



         "SAVE METHOD

          save
             changing
                reported    type tt_reported_late,


          adjust_numbers

             changing
                mapped   TYPE     tt_mapped_late
                reported TYPE     tt_reported_late.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dz_static_api IMPLEMENTATION.

  METHOD update.

    "clear: gt_sohead.

    "gt_sohead = CORRESPONDING #( entities MAPPING FROM ENTITY ).



*    DATA(ls_update) = entities[ 1 ].
*
*    select single * from zdz_dt_so
*                    where soid  =   @ls_update-Soid
*                    INTO @data(ls_dt_so).
*
*    if sy-subrc = 0.
*
*        modify ENTITIES of zdz_r_sohead_um
*               entity zdz_r_sohead_um
*               update fields (
*
*                                salesperson
*                             )
*
*               with value #(
*                             (
*                             %key-Soid  =   ls_dt_so-soid
*                             salesperson    =   ls_dt_so-sales_person
*                             )
*
*                           )
*              failed data(lt_upd_failed)
*              REPORTED DATA(lt_upd_reported)
*              mapped data(lt_mapped).
*
*    endif.



"mapping data from entities to gt_sohead.

    gt_sohead = CORRESPONDING #( entities MAPPING FROM ENTITY ).

*    LOOP at entities ASSIGNING FIELD-SYMBOL(<gfs_entities_upd>).
*
*
*         ASSIGN gt_sohead[ soid =   <gfs_entities_upd>-Soid ] to FIELD-SYMBOL(<gfs_sohead_upd>).
*
*            if <gfs_entities_upd>-%control-SalesPerson  =   if_abap_behv=>mk-on.
*
*
*                 select single * from zdz_dt_so
*                        where soid  =   @<gfs_sohead_upd>-soid
*                        INTO @data(ls_dt_so).
*
*                 ls_dt_so-sales_person =   <gfs_sohead_upd>-sales_person.
*
*                 <gfs_sohead_upd> =   ls_dt_so.
*
*            endif.

*            APPEND VALUE #(
*                            soid = <gfs_entities_upd>-Soid
*                            msg_type  = 'I'
*                            message   = |Sales Order successfully updated|
*                          ) TO gt_reported_upd.

*        clear ls_dt_so.
*
*
*    endloop.

  ENDMETHOD.

  METHOD save.

    if gt_sohead is not initial.
        modify zdz_dt_so from table @gt_sohead.
    endif.


    "if gt_sohead is not initial.
*
*       gv_update    =   abap_true.
*
       "if gt_reported_upd is not initial.

        "update zdz_dt_so from table @gt_sohead.


*            LOOP AT gt_reported_upd ASSIGNING FIELD-SYMBOL(<gs_reported_upd>).
*
*            "ASSIGN gt_reported_upd to FIELD-SYMBOL(<gs_reported_upd>) .
*
*                APPEND VALUE #(
*                                %tky    =  VALUE #( soid = <gs_reported_upd>-soid ) "<gs_reported_upd>-soid
*
*                                %msg    =  <gs_reported_upd>-msg_type
*
*                                 "cl_abap_behv=>new_message_with_text( severity  = if_abap_behv=>severity-information )
*
*                                text    =  <gs_reported_upd>-message
*
*                              ) TO reported-zdz_r_sohead_um.
*            endloop.
        "else
*            if  gt_reported_create is not initial.
*
*                insert zdz_dt_so from table @gt_sohead.
*
*
*           endif.
    "endif.

*
*       loop AT gt_sohead into data(gs_sohead1).
*
*        READ entities OF zdz_r_sohead_um  "root entity
*         entity zdz_r_sohead_um
*         ALL FIELDS    "require all fields
*         with value #( (  %key-Soid    =   gs_sohead1-soid ) )
*
*         result data(lt_result) "storing in internal table
*         failed data(lt_failed).
*
*         loop AT lt_result into data(ls_result).

*
*             APPEND VALUE #(
*                          %key  =  ls_result-%key
*                          %msg  =  CL_ABAP_BEHV=>NEW_MESSAGE_WITH_TEXT(
*                                   id   =   'SABP_BEHV'
*                                   number = 100
*                                   severity = severity
*                                   v1 =   'Not Allowed : Sales Id already exist.'
*                                   )
*
*                          ) to reported-zdz_r_sohead_um.

*                 APPEND VALUE #(
*                    %key = ls_result-%key
*                    %msg = cl_abap_behv_message_factory=>create_message(
*                               severity = if_abap_behv_message=>severity-error
*                               text     = 'Not Allowed: Sales Id already exists.'
*                           )
*                ) TO reported-zdz_r_sohead_um.


*        endloop.
*
*       endloop.

   " endif.

  ENDMETHOD.

  METHOD create.

    "clear: gt_sohead.

    gt_sohead = CORRESPONDING #( entities MAPPING FROM ENTITY ).




   "  insert zdz_dt_so from table @gt_sohead.


    "gv_create =   abap_true.
*    loop at gt_sohead into data(gs_sohead_create).
*
*        select single * from zdz_dt_so
*                    where soid  =   @gs_sohead_create-soid
*                    INTO @data(ls_dt_so).
*        if sy-subrc <> 0.
*
*             APPEND VALUE #(
*                            soid = ls_dt_so-soid
*                            msg_type  = 'I'
*                            message   = |Sales Order successfully updated|
*                          ) TO gt_reported_create.
*        else.
*
*            APPEND VALUE #(
*                            soid = gs_sohead_create-soid
*                            msg_type  = 'E'
*                            message   = |Sales Order already exist.|
*                          ) TO gt_reported_create.
*
*        endif.
*
*
**
*    endloop.



  ENDMETHOD.

  method adjust_numbers.

    cl_uuid_factory=>create_system_uuid( )->create_uuid_x16(
    RECEIVING
      uuid = data(lv_soid)
  ).

    loop AT gt_sohead reference into data(lr_so).

        lr_so->soid =   lv_soid.

    endloop.

    mapped-zdz_r_sohead_um  =   CORRESPONDING #( gt_sohead MAPPING TO ENTITY ).

  endmethod.

ENDCLASS.
