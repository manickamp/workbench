*&---------------------------------------------------------------------*
*& Report zryancdsida
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
* sending to github again *
* demo 04/29/2022 *
* update 06/16/2022
REPORT zryancdsida.

parameters: P_edat type sy-datum default sy-datum.

"This would normally be in _TOP include
class lcl_report definition create private.
public section.
    class-methods create
        returning value(r_result) type ref to lcl_report.
    methods run.
    data lcl_alv type ref to IF_SALV_GUI_TABLE_IDA.
protected section.
    data: lt_cds_params type IF_SALV_GUI_TYPES_IDA=>yt_parameter,
          ls_cds_params type IF_SALV_GUI_TYPES_IDA=>ys_parameter.
private section.
endclass.

"This would normally be in _F01 include
class lcl_report implementation.
    method create.
        create object r_result.
    endmethod.
    method run.
        ls_cds_params-name = 'p_evaldat'.
        ls_cds_params-value = p_edat.
        append ls_cds_params to lt_cds_params.
        try.
            lcl_alv = cl_salv_gui_table_ida=>create_for_cds_view('ZCC_RYAN_SALESORDER').
            lcl_alv->set_view_parameters( it_parameters = lt_cds_params ).
            lcl_alv->fullscreen( )->display( ).
        catch cx_root INTO DATA(lo_root).
        endtry.

    endmethod.
endclass.

"This would be the only thing following the include
start-of-selection.
lcl_report=>create(  )->run(  ).