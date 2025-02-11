debImport "-sv" "+define+TOY_SIM" "-f" \
          "/home/zick/prj/dev-ooo-backword_qqq/vc/sim.f"
nsMsgSwitchTab -tab general
debLoadSimResult /home/zick/prj/dev-ooo-backword_qqq/wave.fsdb
wvCreateWindow
nsMsgSwitchTab -tab cmpl
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "8" "31" "852" "742"
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -line 4 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave2 "/cmn_reg_slice_backward/clk"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top" -win $_nTrace1
srcSetScope "toy_top" -delim "." -win $_nTrace1
srcHBSelect "toy_top" -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar" -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core" -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_rename" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_commit" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cycle" -line 507 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
srcDeselectAll -win $_nTrace1
srcSelect -signal "cycle" -line 507 -pos 1 -win $_nTrace1
srcAction -pos 506 9 2 -win $_nTrace1 -name "cycle" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cycle" -line 507 -pos 1 -win $_nTrace1
srcAction -pos 506 9 2 -win $_nTrace1 -name "cycle" -ctrlKey off
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -previous
wvCreateWindow
verdiSetActWin -win $_nWave3
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvAddSignal -win $_nWave3 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/cycle\[63:0\]"
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
verdiSetActWin -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
wvZoomAll -win $_nWave3
wvCreateWindow
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 {/home/zick/prj/dev-ooo-backword_qqq/novas.fsdb}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvAddSignal -win $_nWave4 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/cycle\[63:0\]"
wvSetPosition -win $_nWave4 {("G1" 0)}
wvSetPosition -win $_nWave4 {("G1" 1)}
wvSetPosition -win $_nWave4 {("G1" 1)}
wvZoomAll -win $_nWave4
verdiSetActWin -win $_nWave4
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave4
wvCloseWindow -win $_nWave3
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
wvSetRadix -win $_nWave4 -format UDec
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_st_ack_commit_en" -line 11 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave4
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_st_ack_commit_entry" -line 12 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave4
srcDeselectAll -win $_nTrace1
srcSelect -signal "cancel_en" -line 35 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave4
srcDeselectAll -win $_nTrace1
srcSelect -signal "cancel_edge_en" -line 36 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave4
srcDeselectAll -win $_nTrace1
srcSelect -signal "cancel_edge_en_d" -line 37 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave4
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rf_commit_en" -line 40 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave4
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_error_en" -line 43 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave4
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_bp_commit_pld" -line 44 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave4
wvZoom -win $_nWave4 819.126290 1058.716210
verdiSetActWin -win $_nWave4
wvZoom -win $_nWave4 1046.736714 1058.329774
wvZoomAll -win $_nWave4
srcDeselectAll -win $_nTrace1
srcSelect -signal "csr_INSTRET" -line 46 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave4
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "commit_credit_rel_en" -line 48 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave4
srcDeselectAll -win $_nTrace1
srcSelect -signal "commit_credit_rel_num" -line 49 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave4
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 1
verdiSetActWin -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 9 )} 
wvSetPosition -win $_nWave4 {("G1" 9)}
wvExpandBus -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 16)}
wvScrollUp -win $_nWave4 1
wvScrollDown -win $_nWave4 1
wvZoom -win $_nWave4 1022.551694 1119.291774
wvScrollUp -win $_nWave4 1
wvScrollUp -win $_nWave4 1
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 0
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 1
wvZoom -win $_nWave4 1084.808616 1119.135742
wvScrollDown -win $_nWave4 1
wvCreateWindow
wvSetPosition -win $_nWave5 {("G1" 0)}
wvOpenFile -win $_nWave5 {/home/zick/prj/dev-ooo-backword_reference/wave.fsdb}
verdiDockWidgetSetCurTab -dock windowDock_nWave_4
verdiSetActWin -win $_nWave4
wvScrollUp -win $_nWave4 3
wvSelectGroup -win $_nWave4 {G1}
wvSetPosition -win $_nWave4 {("G1" 0)}
wvSetPosition -win $_nWave4 {("G1" 1)}
wvSetPosition -win $_nWave4 {("G1" 16)}
wvSetPosition -win $_nWave4 {("G1" 9)}
wvSetPosition -win $_nWave4 {("G1" 10)}
wvSetPosition -win $_nWave4 {("G1" 12)}
wvSetPosition -win $_nWave4 {("G1" 14)}
wvSetPosition -win $_nWave4 {("G1" 15)}
wvSetPosition -win $_nWave4 {("G1" 16)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
wvAddSignal -win $_nWave5 -marker -group {"G1#1" \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cycle\[63:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_st_ack_commit_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_st_ack_commit_entry\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cancel_en} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cancel_edge_en} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cancel_edge_en_d} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_commit_error_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[3\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[2\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[1\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/csr_INSTRET\[63:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/commit_credit_rel_en} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/commit_credit_rel_num\[2:0\]} \
}
wvSetPosition -win $_nWave5 {("G1#1" 16)}
verdiSetActWin -win $_nWave5
wvSelectGroup -win $_nWave5 {G1}
wvScrollDown -win $_nWave5 0
wvSelectSignal -win $_nWave5 {( "G1#1" 1 )} 
wvSelectSignal -win $_nWave5 {( "G1#1" 1 )} 
wvSetRadix -win $_nWave5 -format UDec
wvZoom -win $_nWave5 253.438418 1491.666119
wvZoom -win $_nWave5 1055.022297 1181.306540
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvZoom -win $_nWave5 1074.778086 1137.756486
wvZoom -win $_nWave5 1084.358206 1122.787549
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvZoom -win $_nWave5 1087.314309 1122.521832
wvSelectSignal -win $_nWave5 {( "G1#1" 13 )} 
verdiDockWidgetSetCurTab -dock windowDock_nWave_4
verdiSetActWin -win $_nWave4
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 1
wvSelectSignal -win $_nWave4 {( "G1" 13 )} 
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_error_en" -line 43 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1#1" 9)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_commit_error_en\[3:0\]"
wvSetPosition -win $_nWave5 {("G1#1" 9)}
wvSetPosition -win $_nWave5 {("G1#1" 10)}
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1#1" 12 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rf_commit_pld" -line 41 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1#1" 8)}
wvSetPosition -win $_nWave5 {("G1#1" 9)}
wvSetPosition -win $_nWave5 {("G1#1" 10)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_pld\[3:0\]"
wvSetPosition -win $_nWave5 {("G1#1" 10)}
wvSetPosition -win $_nWave5 {("G1#1" 11)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "stq_commit_id" -line 15 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1#1" 10)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/stq_commit_id\[5:0\]"
wvSetPosition -win $_nWave5 {("G1#1" 10)}
wvSetPosition -win $_nWave5 {("G1#1" 11)}
wvZoomOut -win $_nWave5
verdiSetActWin -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoom -win $_nWave5 976.345189 1248.998086
wvZoom -win $_nWave5 1068.015005 1161.805716
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_alu_commit_id" -line 8 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1#1" 4)}
wvSetPosition -win $_nWave5 {("G1#1" 3)}
wvSetPosition -win $_nWave5 {("G1#1" 4)}
wvSetPosition -win $_nWave5 {("G1#1" 5)}
wvSetPosition -win $_nWave5 {("G1#1" 6)}
wvSetPosition -win $_nWave5 {("G1#1" 7)}
wvSetPosition -win $_nWave5 {("G1#1" 8)}
wvSetPosition -win $_nWave5 {("G1#1" 9)}
wvSetPosition -win $_nWave5 {("G1#1" 10)}
wvAddSignal -win $_nWave5 \
           "toy_top/u_toy_scalar/u_core/u_toy_commit/v_alu_commit_id\[3:0\]"
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
verdiSetActWin -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_4
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 4)}
wvSetPosition -win $_nWave4 {("G1" 6)}
wvSetPosition -win $_nWave4 {("G1" 7)}
wvSetPosition -win $_nWave4 {("G1" 16)}
wvSetPosition -win $_nWave4 {("G1" 10)}
wvSetPosition -win $_nWave4 {("G1" 11)}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave4 {("G1" 12)}
wvSetPosition -win $_nWave4 {("G1" 13)}
wvAddSignal -win $_nWave4 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_alu_commit_id\[3:0\]"
wvSetPosition -win $_nWave4 {("G1" 13)}
wvSetPosition -win $_nWave4 {("G1" 14)}
wvScrollDown -win $_nWave4 1
wvScrollDown -win $_nWave4 1
verdiSetActWin -win $_nWave4
wvTpfCloseForm -win $_nWave4
wvGetSignalClose -win $_nWave4
wvCloseWindow -win $_nWave4
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvCreateWindow
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiSetActWin -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 0)}
wvOpenFile -win $_nWave6 {/home/zick/prj/dev-ooo-backword_qqq/wave.fsdb}
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvScrollUp -win $_nWave5 6
wvSelectGroup -win $_nWave5 {G1#1}
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1#1" 2)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
wvAddSignal -win $_nWave6 -marker -group {"G1#1" \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cycle\[63:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_st_ack_commit_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_st_ack_commit_entry\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cancel_en} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cancel_edge_en} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cancel_edge_en_d} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_commit_error_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_commit_error_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/stq_commit_id\[5:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_pld\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[3\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[2\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[1\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/csr_INSTRET\[63:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/commit_credit_rel_en} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/commit_credit_rel_num\[2:0\]} \
}
wvSetPosition -win $_nWave6 {("G1#1" 19)}
wvSetPosition -win $_nWave5 {("G1#1" 10)}
verdiSetActWin -win $_nWave6
wvZoomAll -win $_nWave6
wvScrollUp -win $_nWave6 9
wvSelectGroup -win $_nWave6 {G1}
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
wvSetRadix -win $_nWave6 -format UDec
wvZoom -win $_nWave6 1006.901037 1159.492221
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 1103.309123 1159.228451
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvZoom -win $_nWave5 1103.601973 1161.643589
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvZoom -win $_nWave5 1106.662075 1141.677674
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 1121.240040 1132.742892
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 919.562662 1159.492221
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 1095.206860 1159.077477
wvScrollDown -win $_nWave6 1
wvZoomAll -win $_nWave6
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvZoomAll -win $_nWave5
wvZoom -win $_nWave5 0.000000 8327.262316
wvZoom -win $_nWave5 554.191183 3454.698282
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvSetCursor -win $_nWave5 1491.779476 -snap {("G1#1" 2)}
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 287.112360 -snap {("G1#1" 17)}
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvZoomAll -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
wvZoomAll -win $_nWave6
wvZoomAll -win $_nWave6
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
wvZoomAll -win $_nWave6
wvZoomAll -win $_nWave6
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvZoom -win $_nWave5 0.000000 10572.002593
wvZoom -win $_nWave5 648.757290 2759.502838
wvScrollUp -win $_nWave5 1
wvZoom -win $_nWave5 1334.703985 1790.785564
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvZoom -win $_nWave5 1464.787754 1558.999938
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "cycle" -next
wvZoomAll -win $_nWave5
verdiSetActWin -win $_nWave5
wvZoom -win $_nWave5 941.342697 6082.522040
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_rename" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_decode_pld\[i\].goto_lsu" -line 340 -pos 1 -win $_nTrace1
srcAction -pos 339 7 17 -win $_nTrace1 -name "v_decode_pld\[i\].goto_lsu" \
          -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcBackwardHistory -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_decoder_top.DECODE_GEN\[0\].u_dec" \
           -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1#1" 3)}
wvSetPosition -win $_nWave5 {("G1#1" 2)}
wvSetPosition -win $_nWave5 {("G1#1" 1)}
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 0)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_decode_pld\[3:0\]"
wvSetPosition -win $_nWave5 {("G1" 0)}
wvSetPosition -win $_nWave5 {("G1" 1)}
wvSelectSignal -win $_nWave5 {( "G1" 1 )} 
wvExpandBus -win $_nWave5
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 2 )} 
wvSetPosition -win $_nWave5 {("G1" 2)}
wvExpandBus -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 31)}
wvSelectSignal -win $_nWave5 {( "G1" 19 )} 
wvSelectSignal -win $_nWave5 {( "G1" 20 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 30)}
wvSelectSignal -win $_nWave5 {( "G1" 20 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 29)}
wvSelectSignal -win $_nWave5 {( "G1" 20 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 28)}
wvSelectSignal -win $_nWave5 {( "G1" 20 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 27)}
wvSelectSignal -win $_nWave5 {( "G1" 20 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 26)}
wvSelectSignal -win $_nWave5 {( "G1" 20 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 25)}
wvSelectSignal -win $_nWave5 {( "G1" 20 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 24)}
wvSelectSignal -win $_nWave5 {( "G1" 20 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 23)}
wvSelectSignal -win $_nWave5 {( "G1" 20 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 22)}
wvSelectSignal -win $_nWave5 {( "G1" 18 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 21)}
wvScrollUp -win $_nWave5 3
wvSelectSignal -win $_nWave5 {( "G1" 17 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 20)}
wvSelectSignal -win $_nWave5 {( "G1" 16 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 19)}
wvSelectSignal -win $_nWave5 {( "G1" 15 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 18)}
wvSelectSignal -win $_nWave5 {( "G1" 14 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 17)}
wvScrollUp -win $_nWave5 6
wvSelectSignal -win $_nWave5 {( "G1" 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 11)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvSetPosition -win $_nWave5 {("G1" 3)}
wvExpandBus -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 31)}
wvSelectSignal -win $_nWave5 {( "G1" 28 )} 
wvSelectSignal -win $_nWave5 {( "G1" 21 22 23 24 25 26 27 28 29 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 8)}
wvSetPosition -win $_nWave5 {("G1" 22)}
wvScrollUp -win $_nWave5 4
wvSelectSignal -win $_nWave5 {( "G1" 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 16)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvZoom -win $_nWave5 1216.842368 2185.534759
wvZoom -win $_nWave5 1376.756150 1606.161263
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoom -win $_nWave5 1103.999712 1919.309844
wvZoom -win $_nWave5 1371.776592 1583.884068
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvSetPosition -win $_nWave5 {("G1" 4)}
wvExpandBus -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 31)}
wvSelectSignal -win $_nWave5 {( "G1" 30 )} 
wvSetPosition -win $_nWave5 {("G1" 30)}
wvSetPosition -win $_nWave5 {("G1" 29)}
wvSetPosition -win $_nWave5 {("G1" 28)}
wvSetPosition -win $_nWave5 {("G1" 27)}
wvSetPosition -win $_nWave5 {("G1" 26)}
wvSetPosition -win $_nWave5 {("G1" 25)}
wvSetPosition -win $_nWave5 {("G1" 26)}
wvSetPosition -win $_nWave5 {("G1" 27)}
wvSetPosition -win $_nWave5 {("G1" 28)}
wvSetPosition -win $_nWave5 {("G1" 29)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 29)}
wvSetPosition -win $_nWave5 {("G1" 30)}
wvSetPosition -win $_nWave5 {("G1" 29)}
wvSetPosition -win $_nWave5 {("G1" 30)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 30)}
wvSelectSignal -win $_nWave5 {( "G1" 29 )} 
wvSelectSignal -win $_nWave5 {( "G1" 29 )} 
wvSelectSignal -win $_nWave5 {( "G1" 30 )} 
wvSetPosition -win $_nWave5 {("G1" 29)}
wvSetPosition -win $_nWave5 {("G1" 28)}
wvSetPosition -win $_nWave5 {("G1" 29)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 29)}
wvSetPosition -win $_nWave5 {("G1" 30)}
wvSelectSignal -win $_nWave5 {( "G1" 28 29 )} 
wvSelectSignal -win $_nWave5 {( "G1" 30 )} 
wvSetPosition -win $_nWave5 {("G1" 29)}
wvSetPosition -win $_nWave5 {("G1" 27)}
wvSetPosition -win $_nWave5 {("G1" 26)}
wvSetPosition -win $_nWave5 {("G1" 27)}
wvSetPosition -win $_nWave5 {("G1" 28)}
wvSetPosition -win $_nWave5 {("G1" 29)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 29)}
wvSetPosition -win $_nWave5 {("G1" 30)}
wvSelectSignal -win $_nWave5 {( "G1" 29 )} 
wvSelectSignal -win $_nWave5 {( "G1" 30 )} 
wvSetPosition -win $_nWave5 {("G1" 29)}
wvSetPosition -win $_nWave5 {("G1" 28)}
wvSetPosition -win $_nWave5 {("G1" 27)}
wvSetPosition -win $_nWave5 {("G1" 26)}
wvSetPosition -win $_nWave5 {("G1" 27)}
wvSetPosition -win $_nWave5 {("G1" 28)}
wvSetPosition -win $_nWave5 {("G1" 29)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 29)}
wvSetPosition -win $_nWave5 {("G1" 30)}
wvSelectSignal -win $_nWave5 {( "G1" 24 25 26 27 28 29 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 4)}
wvSetPosition -win $_nWave5 {("G1" 24)}
wvSelectSignal -win $_nWave5 {( "G1" 21 )} 
wvSelectSignal -win $_nWave5 {( "G1" 22 )} 
wvSelectSignal -win $_nWave5 {( "G1" 23 )} 
wvSelectSignal -win $_nWave5 {( "G1" 24 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 24)}
wvSetPosition -win $_nWave5 {("G1" 23)}
wvScrollUp -win $_nWave5 4
wvSelectSignal -win $_nWave5 {( "G1" 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 \
           20 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 15)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSelectSignal -win $_nWave5 {( "G1" 7 )} 
wvSetPosition -win $_nWave5 {("G1" 7)}
wvExpandBus -win $_nWave5
wvScrollDown -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 33 )} 
wvSetPosition -win $_nWave5 {("G1" 32)}
wvSetPosition -win $_nWave5 {("G1" 31)}
wvSetPosition -win $_nWave5 {("G1" 30)}
wvSetPosition -win $_nWave5 {("G1" 31)}
wvSetPosition -win $_nWave5 {("G1" 32)}
wvSetPosition -win $_nWave5 {("G1" 33)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 33)}
wvSelectGroup -win $_nWave5 {G1#1}
wvSelectSignal -win $_nWave5 {( "G1" 33 )} 
wvSetPosition -win $_nWave5 {("G1" 32)}
wvSetPosition -win $_nWave5 {("G1" 31)}
wvSetPosition -win $_nWave5 {("G1" 32)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 32)}
wvSetPosition -win $_nWave5 {("G1" 33)}
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 32)}
wvSelectSignal -win $_nWave5 {( "G1" 27 28 29 30 31 32 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 5)}
wvSetPosition -win $_nWave5 {("G1" 26)}
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           22 23 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 16)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvScrollDown -win $_nWave5 0
wvZoom -win $_nWave5 879.961871 1689.526793
wvScrollDown -win $_nWave5 1
wvSetCursor -win $_nWave5 1149.350371 -snap {("G1" 8)}
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_commit" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_st_ack_commit_en" -line 11 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_st_ack_commit_entry" -line 12 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 8)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_st_ack_commit_entry\[3:0\]"
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvZoom -win $_nWave5 1024.801922 1312.382892
verdiSetActWin -win $_nWave5
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_st_ack_commit_en" -line 11 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1" 8)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_st_ack_commit_en\[3:0\]"
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvZoom -win $_nWave5 1098.126370 1168.468128
verdiSetActWin -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoom -win $_nWave5 1359.947271 1667.335284
wvSetCursor -win $_nWave5 1489.597531 -snap {("G1" 10)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
wvZoomAll -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvZoom -win $_nWave6 982.257736 1210.638202
wvSetCursor -win $_nWave6 1110.166588 -snap {("G1#1" 2)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetCursor -win $_nWave6 1267.178997 -snap {("G1#1" 1)}
wvZoom -win $_nWave6 1232.811063 1280.482714
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ld_commit_en" -line 18 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_ld_commit_en\[1:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ld_commit_id" -line 19 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_ld_commit_id\[1:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ld_commit_id" -line 19 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ld_commit_en" -line 18 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSetPosition -win $_nWave5 {("G1" 8)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_ld_commit_en\[1:0\]"
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1#1" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ld_commit_id" -line 19 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1#1" 1)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_ld_commit_id\[1:0\]"
wvSetPosition -win $_nWave5 {("G1#1" 1)}
wvSetPosition -win $_nWave5 {("G1#1" 2)}
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
verdiSetActWin -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvZoom -win $_nWave5 0.000000 7039.371471
wvZoom -win $_nWave5 663.173285 3632.242669
wvZoom -win $_nWave5 1063.497247 2341.454510
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_error_en" -line 43 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rf_commit_en" -line 40 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1#1" 1)}
wvSetPosition -win $_nWave5 {("G1#1" 2)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_en\[3:0\]"
wvSetPosition -win $_nWave5 {("G1#1" 2)}
wvSetPosition -win $_nWave5 {("G1#1" 3)}
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
verdiSetActWin -win $_nWave5
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvZoomAll -win $_nWave5
wvZoom -win $_nWave5 0.000000 4199.836646
wvZoom -win $_nWave5 1208.768888 1822.228173
wvZoom -win $_nWave5 1477.588125 1565.603891
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvSetCursor -win $_nWave5 1272.382828 -snap {("G1#1" 4)}
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1#1" 7 )} 
wvSelectSignal -win $_nWave5 {( "G1#1" 8 )} 
wvSelectSignal -win $_nWave5 {( "G1#1" 9 )} 
wvSelectSignal -win $_nWave5 {( "G1#1" 10 )} 
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoom -win $_nWave5 1021.343910 1496.035682
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 434.588073 -snap {("G1#1" 6)}
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_rename" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave6
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 0)}
wvOpenFile -win $_nWave6 {/home/zick/prj/dev-ooo-backword_qqq/wave.fsdb}
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvSelectGroup -win $_nWave5 {G1#1}
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1#1" 1)}
wvSetPosition -win $_nWave5 {("G1#1" 5)}
wvSetPosition -win $_nWave5 {("G1#1" 6)}
wvSetPosition -win $_nWave5 {("G1#1" 7)}
wvSetPosition -win $_nWave5 {("G1#1" 8)}
wvSetPosition -win $_nWave5 {("G1#1" 10)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
wvAddSignal -win $_nWave6 -marker -group {"G1#1" \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_ld_commit_en\[1:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_ld_commit_id\[1:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cycle\[63:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_st_ack_commit_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_st_ack_commit_entry\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cancel_en} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cancel_edge_en} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cancel_edge_en_d} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_commit_error_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_commit_error_en\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/stq_commit_id\[5:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_pld\[3:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[3\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[2\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[1\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/csr_INSTRET\[63:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/commit_credit_rel_en} \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/commit_credit_rel_num\[2:0\]} \
}
wvSetPosition -win $_nWave6 {("G1#1" 22)}
wvSetPosition -win $_nWave5 {("G1#1" 3)}
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 14 )} 
wvZoomAll -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvSetRadix -win $_nWave6 -format UDec
wvZoom -win $_nWave6 1024.106828 1234.024460
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetCursor -win $_nWave6 1389.385384 -snap {("G1#1" 4)}
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1#1" 13 )} 
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1#1" 11 )} 
wvSelectSignal -win $_nWave5 {( "G1#1" 13 )} 
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvSetCursor -win $_nWave5 1409.877279 -snap {("G1#1" 4)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsu_taken\[i\]" -line 367 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/lsu_taken\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "normal_taken\[i\]" -line 368 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/normal_taken\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_decode_pld\[i\].goto_lsu" -line 392 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_decode_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
verdiSetActWin -win $_nWave6
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 8)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 10)}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1#1" 3)}
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1#1" 1)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_decode_pld\[3:0\]"
wvSetPosition -win $_nWave5 {("G1#1" 1)}
wvSetPosition -win $_nWave5 {("G1#1" 2)}
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
verdiSetActWin -win $_nWave5
wvZoom -win $_nWave5 1385.260593 1457.469540
wvZoom -win $_nWave5 1408.102835 1436.437202
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_decode_commit_bp_pld\[i\].commit_bp_branch_pld.is_last" \
          -line 393 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsu_taken_pend\[i\]" -line 371 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1#1" 3)}
wvSetPosition -win $_nWave5 {("G1#1" 2)}
wvAddSignal -win $_nWave5 \
           "toy_top/u_toy_scalar/u_core/u_toy_rename/lsu_taken_pend\[3:0\]"
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 919.111830 -snap {("G1#1" 6)}
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
wvZoomAll -win $_nWave6
wvZoomAll -win $_nWave6
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 1304.707001 1421.638289
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvSetCursor -win $_nWave6 1409.712712 -snap {("G1#1" 7)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvSetCursor -win $_nWave5 1430.008705 -snap {("G1#1" 5)}
wvZoom -win $_nWave5 1394.547890 1506.807817
wvZoom -win $_nWave5 1404.929750 1462.854708
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_lsu" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_lsu" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_lsu" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -signal "store_en" -line 72 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1#1" 15)}
wvSetPosition -win $_nWave5 {("G1#1" 2)}
wvSetPosition -win $_nWave5 {("G1#1" 20)}
wvSetPosition -win $_nWave5 {("G1#1" 21)}
wvSetPosition -win $_nWave5 {("G1#1" 20)}
wvSetPosition -win $_nWave5 {("G1#1" 19)}
wvSetPosition -win $_nWave5 {("G1#1" 18)}
wvSetPosition -win $_nWave5 {("G1#1" 17)}
wvSetPosition -win $_nWave5 {("G1#1" 16)}
wvSetPosition -win $_nWave5 {("G1#1" 15)}
wvSetPosition -win $_nWave5 {("G1#1" 14)}
wvSetPosition -win $_nWave5 {("G1#1" 13)}
wvSetPosition -win $_nWave5 {("G1#1" 12)}
wvSetPosition -win $_nWave5 {("G1#1" 11)}
wvSetPosition -win $_nWave5 {("G1#1" 10)}
wvSetPosition -win $_nWave5 {("G1#1" 9)}
wvSetPosition -win $_nWave5 {("G1#1" 8)}
wvSetPosition -win $_nWave5 {("G1#1" 7)}
wvSetPosition -win $_nWave5 {("G1#1" 6)}
wvSetPosition -win $_nWave5 {("G1#1" 5)}
wvSetPosition -win $_nWave5 {("G1#1" 4)}
wvSetPosition -win $_nWave5 {("G1#1" 3)}
wvSetPosition -win $_nWave5 {("G1#1" 2)}
wvSetPosition -win $_nWave5 {("G1#1" 1)}
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSetPosition -win $_nWave5 {("G1" 11)}
wvSetPosition -win $_nWave5 {("G1" 10)}
wvSetPosition -win $_nWave5 {("G1" 9)}
wvSetPosition -win $_nWave5 {("G1" 8)}
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 1)}
wvSetPosition -win $_nWave5 {("G1" 0)}
wvAddSignal -win $_nWave5 "/toy_top/u_toy_scalar/u_core/u_toy_lsu/store_en"
wvSetPosition -win $_nWave5 {("G1" 0)}
wvSetPosition -win $_nWave5 {("G1" 1)}
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
verdiSetActWin -win $_nWave5
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G1" 10 )} 
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_rename" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsu_taken\[i\]" -line 367 -pos 1 -win $_nTrace1
srcAction -pos 366 3 3 -win $_nTrace1 -name "lsu_taken\[i\]" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 1023.077226 -snap {("G1#1" 24)}
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
wvZoomAll -win $_nWave6
wvScrollDown -win $_nWave6 2
wvScrollUp -win $_nWave6 9
wvScrollUp -win $_nWave6 5
wvSelectSignal -win $_nWave6 {( "G1#1" 7 )} 
wvZoom -win $_nWave6 43438.153328 156170.503630
wvZoom -win $_nWave6 64776.428795 79878.861204
wvSetCursor -win $_nWave6 70271.782334 -snap {("G1#1" 7)}
wvSetCursor -win $_nWave6 68940.366512 -snap {("G1#1" 7)}
wvSetCursor -win $_nWave6 67765.587846 -snap {("G1#1" 7)}
wvSetCursor -win $_nWave6 66486.384409 -snap {("G1#1" 7)}
wvSetCursor -win $_nWave6 65833.729595 -snap {("G1#1" 7)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetCursor -win $_nWave6 61650.212234 -snap {("G1#1" 7)}
wvSetCursor -win $_nWave6 58360.831968 -snap {("G1#1" 7)}
wvSetCursor -win $_nWave6 53505.080148 -snap {("G1#1" 7)}
wvSetCursor -win $_nWave6 52095.345749 -snap {("G1#1" 7)}
wvZoom -win $_nWave6 50163.487498 57055.522339
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 50610.248615 51563.339000
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomAll -win $_nWave6
wvZoom -win $_nWave6 4136.966984 287519.205359
wvZoom -win $_nWave6 35732.739456 109456.208558
wvZoomAll -win $_nWave6
wvZoom -win $_nWave6 40335.428090 91013.273639
wvZoom -win $_nWave6 50891.487534 57417.847938
wvZoom -win $_nWave6 51675.553305 53418.548434
wvSetCursor -win $_nWave6 52249.521450 -snap {("G1#1" 7)}
wvSetSearchMode -win $_nWave6 -value 
wvSetSearchMode -win $_nWave6 -value 26019
wvSearchNext -win $_nWave6
wvZoom -win $_nWave6 520276.944835 520554.136800
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvZoomAll -win $_nWave6
wvSetSearchMode -win $_nWave6 -value 103
wvSearchPrev -win $_nWave6
wvZoom -win $_nWave6 0.000000 112732.350303
wvZoom -win $_nWave6 0.000000 10425.550114
wvZoom -win $_nWave6 1694.039258 2748.308371
wvZoom -win $_nWave6 2077.658356 2237.119976
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1#1" 6 )} 
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvMoveSelected -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSelectSignal -win $_nWave6 {( "G1#1" 1 2 3 4 5 6 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSelectGroup -win $_nWave6 {G3}
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvSelectGroup -win $_nWave5 {G1}
wvScrollDown -win $_nWave5 0
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1#1" 1)}
wvSetPosition -win $_nWave5 {("G1#1" 0)}
wvSelectGroup -win $_nWave5 {G1#1}
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G3" 0)}
wvSelectGroup -win $_nWave5 {G3}
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 0)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G3" 0)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/cycle\[63:0\]"
wvSetPosition -win $_nWave5 {("G1" 0)}
wvSetPosition -win $_nWave5 {("G1" 1)}
wvSetPosition -win $_nWave5 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 0)}
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 1 )} 
wvSetRadix -win $_nWave5 -format UDec
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
uniFindSearchString -win nWave_6 -pattern "btb err" -next
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_commit" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "btb err" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "btb err" -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_error_en" -line 43 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave5
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_commit_error_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoom -win $_nWave5 1361.762193 1791.117802
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvSetCursor -win $_nWave5 1716.713481 -snap {("G1" 2)}
wvZoom -win $_nWave5 1681.088470 1878.510409
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvSetCursor -win $_nWave5 2148.297642 -snap {("G1" 1)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_error_en" -line 43 -pos 1 -win $_nTrace1
srcAction -pos 42 14 9 -win $_nTrace1 -name "v_commit_error_en" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_bp_commit_pld" -line 44 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G3" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvZoom -win $_nWave6 2074.970801 2257.448921
verdiSetActWin -win $_nWave6
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 1)}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1" 2)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[3:0\]"
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 3)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 1904.084851 2199.330349
wvSelectSignal -win $_nWave6 {( "G1#1" 3 )} 
wvExpandBus -win $_nWave6
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 0
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvExpandBus -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomAll -win $_nWave5
wvZoom -win $_nWave5 1955.096370 5141.179343
wvZoomAll -win $_nWave5
wvZoom -win $_nWave5 0.000000 3692.959810
wvZoom -win $_nWave5 941.593037 1465.054929
wvZoom -win $_nWave5 1095.419349 1168.713063
wvZoom -win $_nWave5 1103.401206 1139.826344
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 857.411300 1616.832737
wvZoom -win $_nWave6 1063.511845 1265.017793
wvZoom -win $_nWave6 1099.737634 1181.419820
wvZoom -win $_nWave6 1105.597289 1147.179664
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvSetCursor -win $_nWave5 1489.831943 -snap {("G1" 2)}
wvZoom -win $_nWave5 1411.251868 1689.304438
wvZoom -win $_nWave5 1445.137272 1685.218964
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 1455.884771 1592.743615
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 1008.579912 1326.537194
wvZoom -win $_nWave6 1066.015584 1186.108351
wvZoom -win $_nWave6 1083.038241 1149.779511
wvZoom -win $_nWave6 1107.958058 1139.569308
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoom -win $_nWave5 1048.079090 1411.625437
wvZoom -win $_nWave5 1085.784848 1209.271204
wvZoom -win $_nWave5 1105.209668 1162.630290
wvZoom -win $_nWave5 1107.045937 1143.324653
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoom -win $_nWave5 1429.713292 1559.150233
wvZoom -win $_nWave5 1479.608604 1556.129665
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 1431.952877 1578.834535
wvZoom -win $_nWave6 1468.768504 1578.072832
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_rename" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_decode_pld\[i\].fe_bypass_pld.offset" -line 380 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 0)}
wvSetPosition -win $_nWave5 {("G1" 1)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_decode_pld\[3:0\]"
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
verdiSetActWin -win $_nWave5
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_commit" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rf_commit_pld" -line 41 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_pld\[3:0\]"
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvExpandBus -win $_nWave5
verdiSetActWin -win $_nWave5
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 8)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvScrollDown -win $_nWave5 0
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvSetPosition -win $_nWave5 {("G1" 3)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvSelectSignal -win $_nWave5 {( "G1" 3 4 )} 
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvExpandBus -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSetPosition -win $_nWave5 {("G1" 3)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSelectSignal -win $_nWave6 {( "G1#1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G3" 0)}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSelectSignal -win $_nWave6 {( "G1#1" 3 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSelectSignal -win $_nWave6 {( "G1#1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_rename" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_decode_commit_bp_pld\[i\].commit_common_pld.is_cext" -line \
          377 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_decode_commit_bp_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSelectSignal -win $_nWave6 {( "G1#1" 3 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 1401.513749 1449.789040
wvZoom -win $_nWave6 1407.939328 1436.478912
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rename_pld\[i\].goto_lsu" -line 340 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_rename_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 8)}
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvExpandBus -win $_nWave6
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1#1" 25 )} 
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\]" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.ALU_INST\[0\]" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\]" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -delim "." -win \
           $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -win $_nTrace1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
verdiSetActWin -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1#1" 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 \
           20 21 22 23 24 25 26 27 28 29 30 31 32 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_update_en" -line 41 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "alu_commit_bp_pld.inst_nxt_pc" -line 42 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "alu_commit_bp_pld.commit_error" -line 44 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/alu_commit_bp_pld.commit_error"
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 1441.350622 1534.492775
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "full_offset" -line 43 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/full_offset\[31:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 1463.891506 -snap {("G1#1" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_id" -line 16 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/inst_id\[5:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
debReload
wvZoomAll -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 62853.775281 408549.539326
wvZoom -win $_nWave6 107671.722218 169819.275305
wvZoom -win $_nWave6 108584.866905 120348.319045
wvZoom -win $_nWave6 110059.111123 114380.171762
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 110581.970664 111519.383128
wvZoom -win $_nWave6 110696.210213 110965.199787
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvZoomAll -win $_nWave6
wvZoom -win $_nWave6 0.000000 558700.224719
wvZoom -win $_nWave6 83056.558904 201363.866645
wvZoom -win $_nWave6 99110.359522 124775.989810
wvZoom -win $_nWave6 103391.661722 110068.718521
wvZoom -win $_nWave6 104447.756272 105809.714271
wvZoom -win $_nWave6 104897.426069 105110.489507
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 105153.120610 105307.807981
wvZoom -win $_nWave6 105164.618548 105245.638899
wvScrollUp -win $_nWave6 4
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSelectSignal -win $_nWave6 {( "G1#1" 2 3 4 5 6 7 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSelectSignal -win $_nWave6 {( "G1#1" 2 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 1)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 2 3 4 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 1)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_commit" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rename_en" -line 32 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cancel_en" -line 35 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "stq_commit_en" -line 14 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ld_commit_en" -line 18 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ld_commit_en" -line 18 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ld_commit_id" -line 19 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rf_commit_en" -line 40 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G3" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_error_en" -line 43 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_commit_error_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_bp_commit_pld" -line 44 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 100813.083395 107625.235333
wvZoom -win $_nWave6 104475.277436 105953.108150
wvZoom -win $_nWave6 104903.171376 105089.656497
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 104928.637797 105013.096054
wvZoom -win $_nWave6 104941.996363 104996.379597
wvZoom -win $_nWave6 104947.166766 104984.346660
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 3 )} 
wvZoom -win $_nWave6 105142.369245 105262.167556
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvZoomOut -win $_nWave6
wvZoomAll -win $_nWave6
wvZoom -win $_nWave6 0.000000 24443.134831
wvZoom -win $_nWave6 190.136745 5197.071019
wvZoom -win $_nWave6 609.905651 3158.811690
wvZoom -win $_nWave6 1246.581403 2722.611694
wvZoom -win $_nWave6 2055.400076 2324.581054
wvZoom -win $_nWave6 2116.588146 2222.678488
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 2135.293790 2201.497097
wvZoom -win $_nWave6 2145.765013 2194.916820
wvSelectSignal -win $_nWave6 {( "G1#1" 6 )} 
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1" 1)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[3:0\]"
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvExpandBus -win $_nWave5
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 3 )} 
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvSetCursor -win $_nWave5 1857.551217 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 2050.143550 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 2117.868327 -snap {("G1" 1)}
wvZoom -win $_nWave5 2079.773140 2251.201481
wvZoom -win $_nWave5 2125.704675 2203.936450
wvZoom -win $_nWave5 2128.815013 2187.573365
wvZoom -win $_nWave5 2146.640580 2175.740438
wvZoomAll -win $_nWave5
wvSetSearchMode -win $_nWave5 -value 
wvSelectSignal -win $_nWave5 {( "G1" 1 )} 
wvSetSearchMode -win $_nWave5 -value 5440
wvSearchNext -win $_nWave5
wvSearchNext -win $_nWave5
wvSearchNext -win $_nWave5
wvSearchNext -win $_nWave5
wvSearchNext -win $_nWave5
wvSearchNext -win $_nWave5
wvSearchPrev -win $_nWave5
wvSearchPrev -win $_nWave5
wvSearchNext -win $_nWave5
wvSearchNext -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 1 )} 
wvSetRadix -win $_nWave5 -format UDec
wvZoom -win $_nWave5 1955.096370 5792.878133
wvSetCursor -win $_nWave5 3626.869930 -snap {("G1" 0)}
wvSetCursor -win $_nWave5 3802.671514 -snap {("G1" 1)}
tfgGenerate -incr -ref "toy_top.u_toy_scalar.u_core.u_toy_commit.cycle\[63:0\]#3810#T" -startWithStmt -schFG -ans 2
tfgNodeTraceActTrans -win $_tFlowView7 -folder "group_0#T" "toy_top.u_toy_scalar.u_core.u_toy_commit.cycle\[63:0\]" -stopLevel 10
tfgCloseViewer -win $_tFlowView7
verdiSetActWin -win $_nWave5
wvSearchNext -win $_nWave5
wvSearchNext -win $_nWave5
wvSearchNext -win $_nWave5
wvZoomAll -win $_nWave5
wvSearchNext -win $_nWave5
wvSearchNext -win $_nWave5
wvSetCursor -win $_nWave5 6516.987900 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 10065.125756 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 14627.017286 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 25199.019879 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 36639.954192 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 50253.217805 -snap {("G1" 0)}
wvSetCursor -win $_nWave5 47791.244598 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 60680.398444 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 72773.031547 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 78348.676750 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 80303.773120 -snap {("G1" 1)}
wvSetCursor -win $_nWave5 81172.704840 -snap {("G1" 1)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvZoomAll -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
wvSearchNext -win $_nWave6
wvSearchNext -win $_nWave6
wvSearchNext -win $_nWave6
wvSetCursor -win $_nWave6 1197713.606742 -snap {("G1#1" 1)}
wvSetCursor -win $_nWave6 300301.370787 -snap {("G1#1" 1)}
wvSetSearchMode -win $_nWave6 -value 5440
wvSearchPrev -win $_nWave6
wvZoom -win $_nWave6 73329.404494 247923.224719
wvZoom -win $_nWave6 91739.470240 127805.090839
wvZoom -win $_nWave6 102431.352578 114245.414987
wvZoom -win $_nWave6 107557.246553 110069.138820
wvZoom -win $_nWave6 108627.568842 109211.578366
wvZoom -win $_nWave6 108814.835508 108963.740271
wvZoom -win $_nWave6 108872.750066 108938.643962
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvSetCursor -win $_nWave5 14771.839239 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 1 )} 
wvSearchNext -win $_nWave5
wvZoom -win $_nWave5 104824.123660 112934.153047
wvZoom -win $_nWave5 108539.176015 109835.939573
wvZoom -win $_nWave5 108709.537347 108974.045730
wvZoom -win $_nWave5 108841.905847 108973.588499
wvZoom -win $_nWave5 108872.863220 108921.347931
wvZoom -win $_nWave5 108887.320632 108918.498354
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_error_en" -line 43 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1" 1)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 2)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_commit_error_en\[3:0\]"
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 3)}
verdiSetActWin -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 108885.279588 108919.451012
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 108839.279594 108977.264809
wvZoom -win $_nWave6 108899.267980 108950.431037
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 102630.687984 111143.654651
wvZoom -win $_nWave6 104749.732409 105772.465656
wvZoom -win $_nWave6 104853.154872 105159.002498
wvZoom -win $_nWave6 104920.827294 105058.551247
wvZoom -win $_nWave6 104935.825754 105001.890398
wvZoom -win $_nWave6 104947.017345 104977.223219
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoom -win $_nWave5 101369.811320 112683.255462
wvZoom -win $_nWave5 104616.192872 105818.918567
wvZoom -win $_nWave5 104860.480286 105119.320993
wvZoom -win $_nWave5 104899.630782 105041.243718
wvZoom -win $_nWave5 104934.881020 104996.936127
wvZoom -win $_nWave5 104942.550752 104983.152063
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoom -win $_nWave5 105093.393218 105267.448964
wvZoom -win $_nWave5 105167.257843 105248.042576
wvZoom -win $_nWave5 105180.384489 105224.861477
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 105170.767948 105202.931853
wvSelectSignal -win $_nWave6 {( "G1#1" 6 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rf_commit_pld" -line 41 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 9)}
wvSetPosition -win $_nWave6 {("G1#1" 8)}
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 8)}
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvSelectSignal -win $_nWave6 {( "G1#1" 6 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSelectSignal -win $_nWave6 {( "G1#1" 6 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvZoom -win $_nWave6 105185.166647 105214.133621
wvScrollDown -win $_nWave6 1
wvSetCursor -win $_nWave6 105196.232682 -snap {("G1#1" 7)}
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 6 )} 
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 3)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 7 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvExpandBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 9)}
wvScrollDown -win $_nWave6 3
wvSelectSignal -win $_nWave6 {( "G1#1" 10 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 9)}
wvSelectSignal -win $_nWave6 {( "G1#1" 10 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 9)}
wvSelectSignal -win $_nWave6 {( "G1#1" 10 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 9)}
wvSelectSignal -win $_nWave6 {( "G1#1" 8 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 8)}
wvSelectSignal -win $_nWave6 {( "G1#1" 7 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 6 )} 
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_rename" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_decode_commit_bp_pld\[i\].commit_common_pld.is_cext" -line \
          377 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSetPosition -win $_nWave6 {("G3" 0)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_decode_commit_bp_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G3" 0)}
wvSetPosition -win $_nWave6 {("G3" 1)}
wvSetPosition -win $_nWave6 {("G3" 1)}
wvSelectSignal -win $_nWave6 {( "G3" 1 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 105084.459470 105143.344796
wvZoom -win $_nWave6 105088.123899 105117.337535
wvSelectSignal -win $_nWave6 {( "G3" 3 )} 
wvSelectSignal -win $_nWave6 {( "G3" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 4)}
wvSelectSignal -win $_nWave6 {( "G3" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 3)}
wvSelectSignal -win $_nWave6 {( "G3" 2 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 2)}
wvSelectSignal -win $_nWave6 {( "G3" 1 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 1)}
wvSelectSignal -win $_nWave6 {( "G3" 1 )} 
wvExpandBus -win $_nWave6
wvScrollDown -win $_nWave6 0
wvSelectSignal -win $_nWave6 {( "G3" 4 )} 
wvSetPosition -win $_nWave6 {("G3" 4)}
wvExpandBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 13)}
wvScrollDown -win $_nWave6 2
wvScrollUp -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G3" 4 )} 
wvSelectSignal -win $_nWave6 {( "G3" 3 )} 
wvSetPosition -win $_nWave6 {("G3" 3)}
wvExpandBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 24)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvScrollUp -win $_nWave6 4
wvSelectSignal -win $_nWave6 {( "G3" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 23)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 22)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 21)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 20)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 19)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 18)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 17)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 16)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 15)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 14)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 13)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 12)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 11)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 10)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 9)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 8)}
wvSelectSignal -win $_nWave6 {( "G3" 4 )} 
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 7)}
wvSelectSignal -win $_nWave6 {( "G3" 4 )} 
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 6)}
wvSelectSignal -win $_nWave6 {( "G3" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G3" 5)}
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 0
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvZoomIn -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoom -win $_nWave5 105064.694347 105163.104968
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rename_pld\[i\].inst_imm" -line 334 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G2" 0)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_rename_pld\[3:0\]"
wvSetPosition -win $_nWave5 {("G2" 0)}
wvSetPosition -win $_nWave5 {("G2" 1)}
wvSetPosition -win $_nWave5 {("G2" 1)}
wvZoom -win $_nWave5 105085.533242 105126.870807
verdiSetActWin -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G2" 1 )} 
wvExpandBus -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G2" 1 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G3" 0)}
wvSetPosition -win $_nWave5 {("G2" 4)}
wvSelectSignal -win $_nWave5 {( "G2" 1 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G3" 0)}
wvSetPosition -win $_nWave5 {("G2" 3)}
wvSelectSignal -win $_nWave5 {( "G2" 2 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G3" 0)}
wvSetPosition -win $_nWave5 {("G2" 2)}
wvSelectSignal -win $_nWave5 {( "G2" 2 )} 
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G3" 0)}
wvSetPosition -win $_nWave5 {("G2" 1)}
wvSelectSignal -win $_nWave5 {( "G2" 1 )} 
wvExpandBus -win $_nWave5
wvScrollDown -win $_nWave5 1
wvSelectSignal -win $_nWave5 {( "G2" 29 )} 
wvExpandBus -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G2" 36 )} 
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 3)}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G3" 4)}
wvSetPosition -win $_nWave6 {("G3" 3)}
wvSetPosition -win $_nWave6 {("G3" 2)}
wvSetPosition -win $_nWave6 {("G3" 1)}
wvSetPosition -win $_nWave6 {("G3" 0)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_rename_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G3" 0)}
wvSetPosition -win $_nWave6 {("G3" 1)}
wvSelectSignal -win $_nWave6 {( "G3" 1 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G3" 1 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 5)}
wvSetPosition -win $_nWave6 {("G3" 4)}
wvSelectSignal -win $_nWave6 {( "G3" 1 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 4)}
wvSetPosition -win $_nWave6 {("G3" 3)}
wvSelectSignal -win $_nWave6 {( "G3" 2 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 3)}
wvSetPosition -win $_nWave6 {("G3" 2)}
wvSelectSignal -win $_nWave6 {( "G3" 2 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 2)}
wvSetPosition -win $_nWave6 {("G3" 1)}
wvSelectSignal -win $_nWave6 {( "G3" 1 )} 
wvExpandBus -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G3" 22 )} 
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\]" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.ALU_INST\[0\]" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\]" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -delim "." -win \
           $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -delim "." -win \
           $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_id" -line 16 -pos 1 -win $_nTrace1
srcAction -pos 15 14 3 -win $_nTrace1 -name "inst_id" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_commit_en" -line 15 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_id" -line 16 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G3" 18)}
wvSetPosition -win $_nWave6 {("G3" 5)}
wvSetPosition -win $_nWave6 {("G3" 22)}
wvSetPosition -win $_nWave6 {("G3" 23)}
wvSetPosition -win $_nWave6 {("G3" 24)}
wvSetPosition -win $_nWave6 {("G3" 25)}
wvSetPosition -win $_nWave6 {("G3" 26)}
wvSetPosition -win $_nWave6 {("G3" 27)}
wvSetPosition -win $_nWave6 {("G3" 28)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/inst_id\[5:0\]"
wvSetPosition -win $_nWave6 {("G3" 28)}
wvSetPosition -win $_nWave6 {("G3" 29)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 105132.020101 105251.601589
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 105165.300342 105230.517212
srcDeselectAll -win $_nTrace1
srcSelect -signal "alu_commit_bp_pld" -line 18 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "instruction_pld" -line 9 -pos 1 -win $_nTrace1
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "instruction_pld" -line 9 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G3" 23)}
wvSetPosition -win $_nWave6 {("G3" 5)}
wvSetPosition -win $_nWave6 {("G3" 30)}
wvSetPosition -win $_nWave6 {("G3" 29)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/instruction_pld"
wvSetPosition -win $_nWave6 {("G3" 29)}
wvSetPosition -win $_nWave6 {("G3" 30)}
wvScrollDown -win $_nWave6 1
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 105168.400539 105215.185329
wvZoomAll -win $_nWave6
wvZoom -win $_nWave6 0.000000 258398.853933
wvZoom -win $_nWave6 87770.742952 135787.816068
wvZoom -win $_nWave6 102047.210672 112049.038348
wvZoom -win $_nWave6 104303.457019 107190.760773
wvZoom -win $_nWave6 105032.145607 105930.528797
wvZoom -win $_nWave6 105116.781534 105390.101225
wvZoom -win $_nWave6 105155.051015 105283.324648
wvScrollDown -win $_nWave6 1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollDown -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollUp -win $_nWave5 1
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
wvScrollDown -win $_nWave5 0
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 30
wvZoom -win $_nWave6 105178.998383 105229.997407
wvZoom -win $_nWave6 105186.800308 105216.024468
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvZoom -win $_nWave5 105115.291287 105314.797734
wvZoom -win $_nWave5 105171.159989 105248.065672
wvZoom -win $_nWave5 105183.191042 105222.607698
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvScrollDown -win $_nWave6 1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
debReload
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_commit" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
wvSelectSignal -win $_nWave6 {( "G1#1" 6 )} 
verdiSetActWin -win $_nWave6
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\]" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.ALU_INST\[0\]" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\]" -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -delim "." -win \
           $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -win $_nTrace1
srcShowCalling -win $_nTrace1
srcSelect -win $_nTrace1 -range {479 479 4 5 1 1}
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_alu_forward_pld\[i\]" -line 483 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_alu" -line 479 -pos 1 -win $_nTrace1
srcShowDefine -win $_nTrace1
srcSelect -win $_nTrace1 -range {2 2 3 4 1 1}
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_id" -line 16 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/inst_id\[5:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetCursor -win $_nWave6 105169.990733 -snap {("G1#1" 7)}
wvZoom -win $_nWave6 105154.835594 105215.658219
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 0)}
wvSetPosition -win $_nWave5 {("G1" 1)}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvAddSignal -win $_nWave5 \
           "toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/inst_id\[5:0\]"
srcTraceLoad "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu.inst_id\[5:0\]" \
           -win $_nTrace1
srcShowDefine -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit.genblk1\[0\].genblk2\[0\]" \
           -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit.genblk1\[0\].genblk2\[0\]" \
           -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.ALU_INST\[0\].u_alu" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "inst_id" -line 16 -pos 1 -win $_nTrace1
srcAction -pos 15 14 3 -win $_nTrace1 -name "inst_id" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "instruction_pld.inst_id" -line 25 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/instruction_pld.inst_id\[5:0\]"
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
verdiSetActWin -win $_nWave5
wvSetCursor -win $_nWave5 105169.989699 -snap {("G1" 6)}
wvZoom -win $_nWave5 105157.588953 105216.185883
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "alu_commit_bp_pld" -line 18 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcAction -pos 17 5 11 -win $_nTrace1 -name "alu_commit_bp_pld" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "instruction_pld.inst_pc" -line 40 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 2)}
wvSetPosition -win $_nWave5 {("G1" 3)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/instruction_pld.inst_pc\[31:0\]"
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "instruction_pld" -line 29 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 7)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/instruction_pld.inst_pld\[14:12\]"
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSetPosition -win $_nWave5 {("G1" 8)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/instruction_pld.inst_pld\[14:12\]"
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvSetPosition -win $_nWave6 {("G1#1" 8)}
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 8 )} 
wvExpandBus -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 8 )} 
wvSetPosition -win $_nWave6 {("G1#1" 8)}
wvCollapseBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 8)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "instruction_pld.inst_imm" -line 97 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -range {97 97 1 10 1 1} -backward
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "instruction_pld" -line 9 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvSetPosition -win $_nWave6 {("G1#1" 6)}
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/instruction_pld"
wvSetPosition -win $_nWave6 {("G1#1" 7)}
wvSetPosition -win $_nWave6 {("G1#1" 8)}
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
verdiSetActWin -win $_nWave6
verdiDockWidgetSetCurTab -dock windowDock_nWave_5
verdiSetActWin -win $_nWave5
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave5 {("G1" 7)}
wvAddSignal -win $_nWave5 \
           "/toy_top/u_toy_scalar/u_core/ALU_INST\[0\]/u_alu/instruction_pld"
wvSetPosition -win $_nWave5 {("G1" 7)}
wvSetPosition -win $_nWave5 {("G1" 8)}
wvZoomOut -win $_nWave5
verdiSetActWin -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiSetActWin -win $_nWave5
srcSearchString "fetch3" -next -case -win $_nTrace1
srcSearchString "fetch3" -next -case -allfiles -win $_nTrace1 -fileType "*.*"
nsMsgSwitchTab -tab search
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvTpfCloseForm -win $_nWave5
wvGetSignalClose -win $_nWave5
wvCloseWindow -win $_nWave5
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar" -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar" -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_rename" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_decode_commit_bp_pld\[i\].commit_common_pld.is_call" -line \
          378 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_decode_commit_bp_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 2 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 5)}
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSelectSignal -win $_nWave6 {( "G1#1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSelectSignal -win $_nWave6 {( "G1#1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 3)}
wvSetPosition -win $_nWave6 {("G1#1" 2)}
wvSelectSignal -win $_nWave6 {( "G1#1" 2 )} 
wvExpandBus -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1#1" 2 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 3 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 5 )} 
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvSetCursor -win $_nWave6 105087.950470 -snap {("G1#1" 4)}
wvSelectSignal -win $_nWave6 {( "G1#1" 4 )} 
wvSetPosition -win $_nWave6 {("G1#1" 4)}
wvExpandBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 18)}
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 2
wvScrollUp -win $_nWave6 2
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1#1" 6 )} 
wvScrollUp -win $_nWave6 3
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 105255.650990 105562.014801
wvSetCursor -win $_nWave6 105349.724661 -snap {("G1#1" 3)}
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvZoom -win $_nWave6 105332.519447 105404.392841
wvZoom -win $_nWave6 105345.539989 105380.630351
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 105356.219664 105371.762406
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvScrollUp -win $_nWave6 2
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 18)}
wvSetPosition -win $_nWave6 {("G1#1" 17)}
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 17)}
wvSetPosition -win $_nWave6 {("G1#1" 16)}
wvSetPosition -win $_nWave6 {("G1#1" 1)}
wvExpandBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 22)}
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 22)}
wvSetPosition -win $_nWave6 {("G1#1" 16)}
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
wvScrollDown -win $_nWave6 0
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 16)}
wvSetPosition -win $_nWave6 {("G1#1" 15)}
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 15)}
wvSetPosition -win $_nWave6 {("G1#1" 14)}
wvSelectSignal -win $_nWave6 {( "G1#1" 1 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 14)}
wvSetPosition -win $_nWave6 {("G1#1" 13)}
wvSelectSignal -win $_nWave6 {( "G1#1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 \
           17 18 19 20 21 22 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G3" 12)}
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvScrollUp -win $_nWave6 16
wvScrollUp -win $_nWave6 4
wvSelectGroup -win $_nWave6 {G3}
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1#1" 0)}
wvSelectGroup -win $_nWave6 {G1}
wvSelectGroup -win $_nWave6 {G1#1}
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSelectGroup -win $_nWave6 {G1}
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G4" 0)}
wvSelectGroup -win $_nWave6 {G4}
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 0)}
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_commit" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_commit" -win $_nTrace1
uniFindSearchString -widget <Inst._Tree> -pattern "cycle" -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "cycle" -line 507 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/cycle\[63:0\]"
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 1)}
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 1 )} 
wvSetRadix -win $_nWave6 -format UDec
wvZoom -win $_nWave6 105270.284070 105509.056625
wvSetCursor -win $_nWave6 105190.520195 -snap {("G1" 1)}
wvZoom -win $_nWave6 105174.299233 105271.192444
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_error_en" -line 43 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_commit_error_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_bp_commit_pld" -line 44 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_bp_commit_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvZoom -win $_nWave6 105186.410885 105227.134118
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
srcActiveTrace \
           "toy_top.u_toy_scalar.u_core.u_toy_commit.v_commit_error_en\[3:0\]" \
           -TraceByDConWave -TraceTime 105410 -TraceValue 0100 -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
debReload
wvSetCursor -win $_nWave6 105504.229163 -snap {("G1" 1)}
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 106018.876403 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 106576.017451 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 106873.474113 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 107178.485229 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 107655.360194 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 108042.526007 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 108171.896047 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 108497.681915 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 108875.404659 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 108894.290797 -snap {("G1" 2)}
wvZoom -win $_nWave6 108596.834135 109441.988777
wvZoom -win $_nWave6 108853.289574 109033.191151
wvZoom -win $_nWave6 108869.585007 108945.032860
wvZoom -win $_nWave6 108886.943480 108916.603234
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_alu_commit_en" -line 7 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_alu_commit_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 108599.157897 108943.039102
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_st_ack_commit_entry" -line 12 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_st_ack_commit_entry\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_st_ack_commit_en" -line 11 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_st_ack_commit_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 0
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 108676.406573 108762.065388
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 108529.296870 109147.530054
wvScrollDown -win $_nWave6 0
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -signal "cancel_en" -line 35 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rf_commit_en" -line 40 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
verdiSetActWin -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvScrollDown -win $_nWave6 1
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_error_en" -line 43 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_commit_error_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 9)}
wvSelectSignal -win $_nWave6 {( "G1" 8 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 108775.694153 108948.172252
wvZoom -win $_nWave6 108875.681457 108922.238045
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rf_commit_pld" -line 41 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 9)}
wvSelectSignal -win $_nWave6 {( "G1" 9 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvSelectSignal -win $_nWave6 {( "G1" 12 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 12)}
wvSelectSignal -win $_nWave6 {( "G1" 11 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 11)}
wvSelectSignal -win $_nWave6 {( "G1" 10 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 10)}
wvSelectSignal -win $_nWave6 {( "G1" 9 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 9)}
wvZoom -win $_nWave6 108886.350675 108913.593026
srcDeselectAll -win $_nTrace1
srcSelect -signal "cancel_en" -line 35 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 9)}
wvAddSignal -win $_nWave6 "/toy_top/u_toy_scalar/u_core/u_toy_commit/cancel_en"
wvSetPosition -win $_nWave6 {("G1" 9)}
wvSetPosition -win $_nWave6 {("G1" 10)}
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 107522.851247 107674.460854
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetCursor -win $_nWave6 107668.967753 -snap {("G1" 10)}
wvZoom -win $_nWave6 107545.922274 108512.708178
wvZoom -win $_nWave6 107634.369173 107967.139683
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rf_commit_en" -line 40 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 10)}
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 10)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 10)}
wvSetPosition -win $_nWave6 {("G1" 11)}
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 0
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 86423.877544 181490.142842
wvZoom -win $_nWave6 105971.017238 116390.417692
wvZoom -win $_nWave6 107433.885962 108141.725666
wvZoom -win $_nWave6 107698.684692 107870.515345
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetCursor -win $_nWave6 108003.746358 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 108158.144916 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 108327.485269 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 108506.786820 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 108745.855555 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 108840.486929 -snap {("G1" 1)}
wvSetCursor -win $_nWave6 108930.137704 -snap {("G1" 1)}
wvZoom -win $_nWave6 108815.583936 109079.555664
wvSetCursor -win $_nWave6 108889.945537 -snap {("G1" 1)}
wvZoom -win $_nWave6 108867.708788 108948.287114
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvZoom -win $_nWave6 108877.781079 108919.019081
srcDeselectAll -win $_nTrace1
srcSelect -signal "commit_credit_rel_num" -line 49 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 10)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/commit_credit_rel_num\[2:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 93635.366259 133415.097022
wvZoom -win $_nWave6 107507.826715 112840.616709
wvZoom -win $_nWave6 108628.485482 109430.336151
wvZoom -win $_nWave6 108865.990164 108974.210952
wvZoom -win $_nWave6 108879.321710 108936.078808
wvZoom -win $_nWave6 108884.051468 108919.370423
debReload
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rf_commit_pld" -line 41 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_commit/v_rf_commit_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvZoom -win $_nWave6 108888.370362 108910.028815
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
srcHBSelect "toy_top.u_toy_scalar.u_core.u_fetch" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_fetch" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_fetch" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "cycle" -line 240 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 "/toy_top/u_toy_scalar/u_core/u_fetch/cycle\[63:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvSetRadix -win $_nWave6 -format UDec
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetSearchMode -win $_nWave6 -value 5440
wvSetSearchMode -win $_nWave6 -value 5253
wvSearchPrev -win $_nWave6
wvZoom -win $_nWave6 105053.572799 105435.263803
wvZoom -win $_nWave6 105125.831331 105227.477305
wvZoom -win $_nWave6 105148.664847 105182.362697
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ack_pc\[a\]" -line 252 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 "/toy_top/u_toy_scalar/u_core/u_fetch/v_ack_pc\[7:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 9)}
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvSetCursor -win $_nWave6 105158.401816 -snap {("G2" 0)}
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_instruction_en\[a\]" -line 250 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_fetch/v_instruction_en\[7:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_instruction_en\[a\]" -line 250 -pos 1 -win $_nTrace1
srcAction -pos 249 3 15 -win $_nTrace1 -name "v_instruction_en\[a\]" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ack_vld" -line 71 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave6 "/toy_top/u_toy_scalar/u_core/u_fetch/v_ack_vld\[7:0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal "INST_READ_CHANNEL" -line 70 -pos 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ack_rdy" -line 71 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 "/toy_top/u_toy_scalar/u_core/u_fetch/v_ack_rdy\[7:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_ack_rdy" -line 71 -pos 1 -win $_nTrace1
srcAction -pos 70 11 3 -win $_nTrace1 -name "v_ack_rdy" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dec_inst_rdy" -line 206 -pos 1 -win $_nTrace1
srcAction -pos 205 7 9 -win $_nTrace1 -name "dec_inst_rdy" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_merge_vld" -line 65 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_merge_vld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_merge_rdy" -line 65 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_merge_rdy\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_merge_vld" -line 65 -pos 1 -win $_nTrace1
srcAction -pos 64 7 8 -win $_nTrace1 -name "v_merge_vld" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_decode_vld" -line 63 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_vld" -line 63 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_fp_vld" -line 63 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave6
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_fp_vld" -line 63 -pos 1 -win $_nTrace1
srcAction -pos 62 15 11 -win $_nTrace1 -name "v_pre_allocate_fp_vld" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_m_vld_temp\[i\]" -line 43 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_m_vld_temp\[i\]" -line 43 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_m_vld_temp\[i\]" -line 43 -pos 1 -win $_nTrace1
srcAction -pos 42 7 5 -win $_nTrace1 -name "v_m_vld_temp\[i\]" -ctrlKey off
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top" \
           -win $_nTrace1
srcSetScope \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top" \
           -delim "." -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top" \
           -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_issue" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_issue" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_issue" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_en" -line 18 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/v_commit_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "cancel_edge_en" -line 21 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/cancel_edge_en"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvZoom -win $_nWave6 105106.005322 105237.866475
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_int_backup_phy_id" -line 27 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/v_int_backup_phy_id\[31:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsu_buffer_rd_ptr" -line 33 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/lsu_buffer_rd_ptr\[4:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSelectSignal -win $_nWave6 {( "G1" 8 )} 
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcTraceConnectivity \
           "toy_top.u_toy_scalar.u_core.u_toy_rename.v_pre_allocate_fp_vld\[3:0\]" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_fp_vld" -line 63 -pos 1 -win $_nTrace1
srcAction -pos 62 15 11 -win $_nTrace1 -name "v_pre_allocate_fp_vld" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_m_vld_temp\[i\]" -line 43 -pos 1 -win $_nTrace1
srcAction -pos 42 7 6 -win $_nTrace1 -name "v_m_vld_temp\[i\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 23 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_fp_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/pntr_w\[1:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_r" -line 23 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_fp_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/pntr_r\[1:0\]"
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_fp_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].u_cmn_reg_slice_full" \
           -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_fp_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].genblk1" \
           -win $_nTrace1
srcForwardHistory -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_fp_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].genblk1" \
           -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_fp_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].u_cmn_reg_slice_full" \
           -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_fp_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].u_cmn_reg_slice_full" \
           -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_fp_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].genblk1" \
           -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_fp_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].genblk1" \
           -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_vld" -line 63 -pos 1 -win $_nTrace1
srcAction -pos 62 11 15 -win $_nTrace1 -name "v_pre_allocate_int_vld" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 0 2 9 -win $_nTrace1 -name "toy_pre_alloc_buffer" -ctrlKey off
srcShowCalling -win $_nTrace1
srcSelect -win $_nTrace1 -range {93 93 4 5 1 1}
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cancel_en" -line 102 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/cancel_en"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_id" -line 101 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_allocate_id" -line 98 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_id" -line 101 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {96 102 6 7 1 2} -backward
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_allocate_vld\[3:0\]" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/v_s_rdy\[3:0\]" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_allocate_rdy\[3:0\]" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/v_s_pld\[3:0\]" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_allocate_id\[3:0\]" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/v_m_vld\[3:0\]" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_pre_allocate_vld\[3:0\]" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/v_m_rdy\[3:0\]" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_pre_allocate_rdy\[3:0\]" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/v_m_pld\[3:0\]" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_pre_allocate_id\[3:0\]" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/cancel_edge_en" \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/cancel_en"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 15)}
verdiSetActWin -win $_nWave6
wvScrollUp -win $_nWave6 3
wvSelectSignal -win $_nWave6 {( "G1" 1 )} 
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1" 9 )} 
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvSetCursor -win $_nWave6 105171.458141 -snap {("G1" 2)}
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
verdiSetActWin -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_vld" -line 99 -pos 1 -win $_nTrace1
srcAction -pos 98 5 14 -win $_nTrace1 -name "v_pre_allocate_vld" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\]" \
           -win $_nTrace1
srcSetScope \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\]" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\]" \
           -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer" \
           -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer" \
           -win $_nTrace1
srcSetScope \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer" \
           -win $_nTrace1
srcShowCalling -win $_nTrace1
srcSelect -win $_nTrace1 -range {93 93 4 5 1 1}
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cancel_en" -line 102 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/cancel_en"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_allocate_id" -line 98 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_allocate_id\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_allocate_rdy" -line 97 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_allocate_rdy\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_allocate_vld" -line 96 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_allocate_vld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvScrollDown -win $_nWave6 1
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 105109.588506 105220.667194
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
srcDeselectAll -win $_nTrace1
srcSelect -word -line 0 -pos 2 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcShowCalling -win $_nTrace1
srcSelect -win $_nTrace1 -range {69 69 2 3 1 1}
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top" \
           -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_issue" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_issue" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_issue" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_pld" -line 19 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcTraceLoad "toy_top.u_toy_scalar.u_core.u_toy_issue.v_commit_pld\[3:0\]" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_phy_release_en\[0\]" -line 86 -pos 1 -win $_nTrace1
srcAction -pos 85 7 10 -win $_nTrace1 -name "v_phy_release_en\[0\]" -ctrlKey off
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/u_fp_backup_rename_regfile/v_phy_release_en\[0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_phy_release_en" \
           -previous
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/u_fp_backup_rename_regfile/v_phy_release_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_phy_index" -line 28 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/u_fp_backup_rename_regfile/v_commit_phy_index\[31:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvZoom -win $_nWave6 105144.401211 105217.849981
verdiSetActWin -win $_nWave6
wvShowOneTraceSignals -win $_nWave6 -signal \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/u_fp_backup_rename_regfile/v_commit_phy_index\[31:0\]" \
           -load
wvScrollUp -win $_nWave6 5
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top.u_fp_backup_rename_regfile.genblk2\[0\].u_toy_backup_rename_regfile_entry.genblk1" \
           -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top.u_fp_backup_rename_regfile.PHY_REG_\[0\].genblk1" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_phy_index" -line 28 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcTraceLoad \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top.u_fp_backup_rename_regfile.v_commit_phy_index\[31:0\]" \
           -win $_nTrace1
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvZoom -win $_nWave6 104968.230609 105794.263156
wvZoom -win $_nWave6 105071.484678 105327.375195
wvZoom -win $_nWave6 105138.006941 105228.403047
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top.u_fp_backup_rename_regfile.genblk2\[0\].u_toy_backup_rename_regfile_entry.genblk1" \
           -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top.u_fp_backup_rename_regfile.PHY_REG_\[0\].genblk1" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_phy_release_comb_index" -line 29 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/u_fp_backup_rename_regfile/v_phy_release_comb_index\[2:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
srcTraceLoad \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top.u_fp_backup_rename_regfile.v_phy_release_comb_index\[2:0\]" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "vv_phy_release_comb\[i\]\[j\]" -line 49 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/u_fp_backup_rename_regfile/vv_phy_release_comb\[0\]\[0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_phy_release" -line 15 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/u_fp_backup_rename_regfile/v_phy_release\[63:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_phy_back_ref" -line 16 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/u_fp_backup_rename_regfile/v_phy_back_ref\[63:0\]"
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_phy_release_comb" -line 17 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/u_fp_backup_rename_regfile/v_phy_release_comb\[63:0\]"
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvZoomAll -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 69530.723732 442800.924819
wvZoom -win $_nWave6 94212.539565 143914.278296
wvZoom -win $_nWave6 103081.418668 111590.140244
wvZoom -win $_nWave6 104545.781983 106403.211240
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_reg_backup_phy_id" -line 10 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/u_fp_backup_rename_regfile/v_reg_backup_phy_id\[31:0\]"
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top.u_fp_backup_rename_regfile" \
           -win $_nTrace1
srcSetScope \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top.u_fp_backup_rename_regfile" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top.u_fp_backup_rename_regfile" \
           -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top" \
           -win $_nTrace1
srcSetScope \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top" \
           -win $_nTrace1
wvZoom -win $_nWave6 105079.119913 105341.582742
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 105156.622523 105206.547518
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_en" -line 7 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/v_commit_en\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_commit_pld" -line 8 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/v_commit_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcSelect -win $_nTrace1 -range {13 18 15 16 5 2} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_int_phy_release" -line 10 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/v_int_phy_release\[63:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_int_phy_release" -line 10 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_int_phy_back_ref" -line 11 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/v_int_phy_back_ref\[63:0\]"
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_int_phy_release_comb" -line 12 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/v_int_phy_release_comb\[63:0\]"
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_int_backup_phy_id" -line 13 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/v_int_backup_phy_id\[31:0\]"
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_fp_phy_release" -line 15 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/v_fp_phy_release\[63:0\]"
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_fp_phy_back_ref" -line 16 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 9)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/v_fp_phy_back_ref\[63:0\]"
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 9)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_fp_phy_release_comb" -line 17 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 9)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/v_fp_phy_release_comb\[63:0\]"
wvSetPosition -win $_nWave6 {("G1" 9)}
wvSetPosition -win $_nWave6 {("G1" 10)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_fp_phy_release_comb" -line 17 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_fp_backup_phy_id" -line 18 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 9)}
wvSetPosition -win $_nWave6 {("G1" 10)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_backup_rename_regfile_top/v_fp_backup_phy_id\[31:0\]"
wvSetPosition -win $_nWave6 {("G1" 10)}
wvSetPosition -win $_nWave6 {("G1" 11)}
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 105163.496255 105205.190861
wvSelectSignal -win $_nWave6 {( "G1" 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 \
           41 42 43 44 45 46 47 48 49 50 51 52 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 1)}
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_issue" -win $_nTrace1
srcSetScope "toy_top.u_toy_scalar.u_core.u_toy_issue" -delim "." -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_issue" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_int_pre_allocate_rdy" -line 39 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/v_int_pre_allocate_rdy\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_int_pre_allocate_id" -line 40 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/v_int_pre_allocate_id\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 105096.120188 105200.658838
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_int_pre_allocate_rdy" -line 39 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_int_pre_allocate_rdy" -line 39 -pos 1 -win $_nTrace1
srcAction -pos 38 14 18 -win $_nTrace1 -name "v_int_pre_allocate_rdy" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rd_index\[i\]" -line 71 -pos 1 -win $_nTrace1
srcAction -pos 70 8 6 -win $_nTrace1 -name "v_rd_index\[i\]" -ctrlKey off
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_rd_index\[0\]\[4:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_fp_rdy\[i\]" -line 77 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_rdy\[i\]" -line 78 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_pre_allocate_int_rdy\[0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_merge_vld" -line 65 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_merge_vld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_merge_rdy" -line 65 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_merge_rdy\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_merge_vld" -line 65 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_merge_vld" -previous
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_vld" -line 63 -pos 1 -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_pre_allocate_int_vld" \
           -previous
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 1 2 4 -win $_nTrace1 -name "toy_rename" -ctrlKey off
srcShowCalling -win $_nTrace1
srcSelect -win $_nTrace1 -range {331 331 4 5 1 1}
srcHBSelect "toy_top.u_toy_scalar.u_core" -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_pre_allocate_int_vld" \
           -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_int_pre_allocate_vld" -line 334 -pos 1 -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -previous
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_toy_issue" -line 388 -pos 1 -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -next
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_toy_issue" -line 388 -pos 1 -win $_nTrace1
srcShowDefine -win $_nTrace1
srcSelect -win $_nTrace1 -range {2 2 3 4 1 1}
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_issue" -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -next
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_toy_physicial_regfile_top" -line 179 -pos 1 -win $_nTrace1
srcShowDefine -win $_nTrace1
srcSelect -win $_nTrace1 -range {1 1 3 4 1 1}
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top" \
           -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -next
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_int_physicial_regfile" -line 69 -pos 1 -win $_nTrace1
srcShowDefine -win $_nTrace1
srcSelect -win $_nTrace1 -range {1 1 3 4 1 1}
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile" \
           -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -next
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile" \
           -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top" \
           -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_int_pre_allocate_vld" \
           -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_vld" -line 77 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_int_physicial_regfile" -line 69 -pos 1 -win $_nTrace1
srcShowDefine -win $_nTrace1
srcSelect -win $_nTrace1 -range {1 1 3 4 1 1}
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile" \
           -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_pre_allocate_vld" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_pre_allocate_vld" -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_allocate_id" -line 98 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_allocate_id\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_allocate_vld" -line 96 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_allocate_vld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_allocate_id" -line 98 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_allocate_rdy" -line 97 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_allocate_rdy\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "cancel_en" -line 102 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/cancel_en"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_toy_pre_alloc_buffer" -line 93 -pos 1 -win $_nTrace1
srcShowDefine -win $_nTrace1
srcSelect -win $_nTrace1 -range {1 1 3 4 1 1}
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer" \
           -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer" \
           -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_vld" -line 99 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/v_pre_allocate_vld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_toy_pre_alloc_buffer" -line 93 -pos 1 -win $_nTrace1
srcShowDefine -win $_nTrace1
srcSelect -win $_nTrace1 -range {1 1 3 4 1 1}
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_m_vld" -line 15 -pos 1 -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_m_vld" -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_m_vld\[i\]" -line 43 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/v_m_vld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 7 )} 
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvMoveSelected -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 5)}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_m_vld_temp\[i\]" -line 37 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/v_m_vld_temp\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "set_rst_n" -line 33 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_s_vld\[i\]" -line 34 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 4)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/v_s_vld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_s_rdy_temp\[i\]" -line 35 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/v_s_rdy_temp\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_s_pld\[i\]" -line 36 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/v_s_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvScrollDown -win $_nWave6 1
verdiSetActWin -win $_nWave6
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_cmn_reg_slice_full" -line 31 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcShowDefine -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\]" \
           -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\]" \
           -win $_nTrace1
srcSetScope \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\]" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\]" \
           -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].u_cmn_reg_slice_full" \
           -win $_nTrace1
srcSetScope \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].u_cmn_reg_slice_full" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].u_cmn_reg_slice_full" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 23 -pos 1 -win $_nTrace1
srcAction -pos 22 9 3 -win $_nTrace1 -name "pntr_w" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 29 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/pntr_w\[1:0\]"
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_vld" -line 29 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_vld"
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_rdy" -line 29 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_rdy"
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "rst_n" -line 28 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/rst_n"
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvScrollDown -win $_nWave6 0
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 29 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/pntr_w\[1:0\]"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_vld" -line 29 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rst_n" -line 33 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/rst_n"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 90757.729045 139239.421911
wvZoom -win $_nWave6 100770.252572 108850.534716
wvZoom -win $_nWave6 103617.380972 106720.677738
wvZoom -win $_nWave6 104899.177462 105334.875831
wvZoom -win $_nWave6 105124.130424 105237.790868
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_vld" -line 29 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -line 27 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/clk"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_vld" -line 29 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_vld"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_rdy" -line 29 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_rdy"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "rst_n" -line 27 -pos 1 -win $_nTrace1
srcAction -pos 26 13 3 -win $_nTrace1 -name "rst_n" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cancel_edge_en" -line 25 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/cancel_edge_en"
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
verdiSetActWin -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 6)}
srcTraceConnectivity \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].u_cmn_reg_slice_full.pntr_w\[1:0\]" \
           -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 22 -pos 1 -win $_nTrace1
srcAction -pos 21 9 4 -win $_nTrace1 -name "pntr_w" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvMoveSelected -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 29 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
verdiSetActWin -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvMoveSelected -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
wvSetCursor -win $_nWave6 105149.765796 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105170.356456 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105189.608724 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105149.456936 -snap {("G1" 6)}
wvSetCursor -win $_nWave6 105170.150550 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105190.020537 -snap {("G1" 3)}
wvSetCursor -win $_nWave6 105149.765796 -snap {("G1" 3)}
wvSetCursor -win $_nWave6 105169.841690 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105190.020537 -snap {("G1" 3)}
wvSetCursor -win $_nWave6 105170.253503 -snap {("G1" 1)}
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvZoomCursorMarker -win $_nWave6
wvZoom -win $_nWave6 0.000000 105170.000000
wvZoom -win $_nWave6 381.050725 4572.608696
wvPrevView -win $_nWave6
wvZoomAll -win $_nWave6
wvZoom -win $_nWave6 0.000000 530629.207428
wvZoom -win $_nWave6 59119.014958 157650.706555
wvZoom -win $_nWave6 83751.937857 123914.312149
wvZoom -win $_nWave6 102850.893023 106779.820943
wvZoom -win $_nWave6 104779.768868 105548.472156
wvZoom -win $_nWave6 105143.231836 105266.475026
wvSignalReport -win $_nWave6 -add \
           "\{/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/clk\}"
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "rst_n" -line 28 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/rst_n"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_rdy" -line 29 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_rdy"
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_vld" -line 29 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_vld"
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -line 27 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/clk"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetCursor -win $_nWave6 105189.894565 -snap {("G1" 1)}
wvZoom -win $_nWave6 105166.674834 105171.586700
wvZoom -win $_nWave6 105169.838183 105170.260852
wvZoom -win $_nWave6 105169.978581 105170.060103
wvZoom -win $_nWave6 105169.979487 105170.060103
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomIn -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvVerilogExpression -win $_nWave6 "logical_expression_1" \
           "\"/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/clk\""
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvZoom -win $_nWave6 105187.407023 105193.436008
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetCursor -win $_nWave6 105170.499650 -snap {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_r" -line 34 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 29 -pos 1 -win $_nTrace1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "pntr_w" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "pntr_w" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "pntr_w" -next
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "pntr_w" -next
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_r" -line 20 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/pntr_r\[1:0\]"
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvScrollDown -win $_nWave6 1
verdiSetActWin -win $_nWave6
verdiWindowBeWindow -win $_nWave6
verdiWindowBeDocked -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvSetCursor -win $_nWave6 105129.956907 -snap {("G1" 6)}
wvSetCursor -win $_nWave6 105109.860289 -snap {("G1" 5)}
wvSetCursor -win $_nWave6 105168.752118 -snap {("G1" 6)}
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvSelectSignal -win $_nWave6 {( "G1" 7 )} 
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvMoveSelected -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_rdy" -line 34 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/m_rdy"
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_vld" -line 34 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/m_vld"
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_vld" -line 23 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 29 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_vld" -line 23 -pos 1 -win $_nTrace1
srcAction -pos 22 3 4 -win $_nTrace1 -name "m_vld" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_r" -line 23 -pos 1 -win $_nTrace1
wvSelectSignal -win $_nWave6 {( "G1" 7 )} 
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 9 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_rdy" -line 12 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 9)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_rdy" -line 12 -pos 1 -win $_nTrace1
srcAction -pos 11 5 3 -win $_nTrace1 -name "m_rdy" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_zero\[i\]" -line 79 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_pre_allocate_zero\[0\]"
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 9)}
wvSelectSignal -win $_nWave6 {( "G1" 9 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 9)}
wvSetPosition -win $_nWave6 {("G1" 8)}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_pre_allocate_zero" \
           -previous
uniFindSearchString -widget MTB_SOURCE_TAB_1 -pattern "v_pre_allocate_zero" \
           -previous
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_pre_allocate_zero\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_zero" -line 35 -pos 1 -win $_nTrace1
srcAction -pos 34 12 12 -win $_nTrace1 -name "v_pre_allocate_zero" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_rdy\[i\]" -line 79 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_zero\[i\]" -line 79 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_merge_vld\[i\]" -line 78 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_merge_rdy\[i\]" -line 78 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_merge_rdy\[1\]"
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSelectSignal -win $_nWave6 {( "G1" 8 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_decode_pld\[i\].inst_rd_en" -line 78 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_decode_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSelectSignal -win $_nWave6 {( "G1" 8 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 105109.336029 105235.507842
wvSelectSignal -win $_nWave6 {( "G1" 8 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 12)}
wvSetPosition -win $_nWave6 {("G1" 11)}
wvSelectSignal -win $_nWave6 {( "G1" 8 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 11)}
wvSetPosition -win $_nWave6 {("G1" 10)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvExpandBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 36)}
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 10)}
wvSelectSignal -win $_nWave6 {( "G1" 30 )} 
wvSetPosition -win $_nWave6 {("G1" 30)}
wvExpandBus -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 30 )} 
wvSetPosition -win $_nWave6 {("G1" 30)}
wvCollapseBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 30)}
wvSetPosition -win $_nWave6 {("G1" 29)}
wvSetPosition -win $_nWave6 {("G1" 28)}
wvSetPosition -win $_nWave6 {("G1" 27)}
wvSetPosition -win $_nWave6 {("G1" 26)}
wvSetPosition -win $_nWave6 {("G1" 25)}
wvSetPosition -win $_nWave6 {("G1" 24)}
wvSetPosition -win $_nWave6 {("G1" 23)}
wvSetPosition -win $_nWave6 {("G1" 22)}
wvSetPosition -win $_nWave6 {("G1" 21)}
wvSetPosition -win $_nWave6 {("G1" 20)}
wvSetPosition -win $_nWave6 {("G1" 19)}
wvMoveSelected -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 19)}
wvSetPosition -win $_nWave6 {("G1" 20)}
wvSelectSignal -win $_nWave6 {( "G1" 19 20 21 22 23 24 25 26 27 28 29 30 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 18)}
wvScrollUp -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1" 8 9 10 11 12 13 14 15 16 17 18 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_rdy\[i\]" -line 78 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_merge_vld\[i\]" -line 78 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_merge_vld\[1\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_merge_vld" -line 63 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_merge_vld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_vld" -line 63 -pos 1 -win $_nTrace1
srcAction -pos 62 11 11 -win $_nTrace1 -name "v_pre_allocate_int_vld" -ctrlKey \
          off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_m_vld_temp\[i\]" -line 43 -pos 1 -win $_nTrace1
srcAction -pos 42 7 7 -win $_nTrace1 -name "v_m_vld_temp\[i\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_rdy" -line 12 -pos 1 -win $_nTrace1
srcAction -pos 11 5 3 -win $_nTrace1 -name "m_rdy" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_rdy\[i\]" -line 79 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_decode_vld" -line 63 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_rename_rdy" -line 64 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_rename_rdy\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_merge_vld" -line 63 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_rdy_withoutzero\[i\]" -line 79 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_decode_pld\[i\].inst_rd_en" -line 78 -pos 1 -win $_nTrace1
srcAction -pos 77 14 18 -win $_nTrace1 -name "v_decode_pld\[i\].inst_rd_en" \
          -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_decoder_top.DECODE_GEN\[0\].u_dec" \
           -win $_nTrace1
srcHBSelect "toy_top.u_toy_scalar.u_core.u_toy_rename.genblk1\[0\]" -win \
           $_nTrace1
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_decode_pld\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
wvExpandBus -win $_nWave6
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSetPosition -win $_nWave6 {("G1" 5)}
wvExpandBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 34)}
wvScrollUp -win $_nWave6 2
wvScrollUp -win $_nWave6 11
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 3
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSetPosition -win $_nWave6 {("G1" 5)}
wvCollapseBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 8)}
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSetPosition -win $_nWave6 {("G1" 5)}
wvExpandBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 33)}
wvScrollUp -win $_nWave6 8
wvScrollUp -win $_nWave6 4
wvScrollUp -win $_nWave6 2
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSetPosition -win $_nWave6 {("G1" 5)}
wvCollapseBus -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_rdy_withoutzero" -line 9 -pos 1 -win \
          $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_pre_allocate_int_rdy_withoutzero\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSelectSignal -win $_nWave6 {( "G1" 2 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_rdy_withoutzero" -line 9 -pos 1 -win \
          $_nTrace1
srcAction -pos 8 14 18 -win $_nTrace1 -name "v_pre_allocate_int_rdy_withoutzero" \
          -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_zero\[i\]" -line 79 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_zero" -line 35 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_pre_allocate_zero\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSelectSignal -win $_nWave6 {( "G1" 3 )} 
verdiSetActWin -win $_nWave6
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_rdy\[i\]" -line 79 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_rdy" -line 36 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_rename/v_pre_allocate_int_rdy\[3:0\]"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "v_pre_allocate_int_vld" -line 63 -pos 1 -win $_nTrace1
srcAction -pos 62 11 8 -win $_nTrace1 -name "v_pre_allocate_int_vld" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 30 2 8 -win $_nTrace1 -name "u_cmn_reg_slice_full" -ctrlKey off
srcShowDefine -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].u_cmn_reg_slice_full" \
           -win $_nTrace1
srcSetScope \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].u_cmn_reg_slice_full" \
           -delim "." -win $_nTrace1
srcHBSelect \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].u_cmn_reg_slice_full" \
           -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 29 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/pntr_w\[1:0\]"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -line 27 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G2" 0)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/clk"
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G2" 1)}
wvSetPosition -win $_nWave6 {("G2" 1)}
wvSelectGroup -win $_nWave6 {G2}
verdiSetActWin -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G2" 1 )} 
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvMoveSelected -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "rst_n" -line 27 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/rst_n"
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_vld" -line 23 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/m_vld"
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetCursor -win $_nWave6 105178.479097 -snap {("G2" 0)}
verdiSetActWin -win $_nWave6
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvReloadFile -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_pld" -line 25 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {27 31 1 1 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_vld" -line 29 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -range {29 29 6 8 4 5}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvVerilogExpression -win $_nWave6 -noadd "\\s_vld&&s_rdy " \
           "\"/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_vld\"&&\"/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_rdy\""
wvAddSignal -win $_nWave6 "/\\s_vld&&s_rdy "
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 105097.907423 105235.507842
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -line 27 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 0)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/clk"
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
verdiSetActWin -win $_nWave6
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 105165.461252 105178.174334
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcSelect -win $_nTrace1 -range {27 31 1 1 2 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 29 -pos 1 -win $_nTrace1
wvScrollUp -win $_nWave6 1
verdiSetActWin -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvSelectSignal -win $_nWave6 {( "G1" 7 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
wvCut -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 6 )} 
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvMoveSelected -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_vld" -line 29 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_vld"
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_rdy" -line 29 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave6 \
           "/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_rdy"
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetCursor -win $_nWave6 105189.413435 -snap {("G1" 5)}
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 105169.883193 -snap {("G1" 1)}
wvSetOptions -win $_nWave6 -fixedDelta on
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcSetOptions -annotate on -win $_nTrace1
schSetOptions -win $_nSchema1 -annotate on
wvSetCursor -win $_nWave6 105189.781931 -snap {("G1" 5)}
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 105169.514698 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105150.260827 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105170.251688 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105150.721446 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105170.159565 -snap {("G1" 2)}
wvSelectSignal -win $_nWave6 {( "G1" 7 )} 
wvSetCursor -win $_nWave6 105150.445075 -snap {("G1" 7)}
wvScrollDown -win $_nWave6 1
wvSetCursor -win $_nWave6 105170.159565 -snap {("G1" 8)}
wvSetCursor -win $_nWave6 105149.615961 -snap {("G1" 8)}
wvSetCursor -win $_nWave6 105149.523837 -snap {("G1" 7)}
srcActiveTrace \
           "toy_top.u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_top.u_int_physicial_regfile.u_toy_pre_alloc_buffer.genblk1\[0\].u_cmn_reg_slice_full.pntr_w\[1:0\]" \
           -TraceByDConWave -TraceTime 105110 -TraceValue 11 -win $_nTrace1
wvSetCursor -win $_nWave6 105169.606822 -snap {("G1" 8)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_vld" -line 29 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_rdy" -line 29 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 29 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rst_n" -line 27 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave6
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 29 -pos 1 -win $_nTrace1
wvSelectSignal -win $_nWave6 {( "G1" 8 )} 
verdiSetActWin -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 8)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvMoveSelected -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvZoom -win $_nWave6 105165.277004 105177.713715
wvZoom -win $_nWave6 105169.681672 105170.380111
wvSelectSignal -win $_nWave6 {( "G1" 9 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_rdy" -line 22 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 22 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_r\[1\]" -line 22 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_r\[0\]" -line 22 -pos 1 -win $_nTrace1
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 105169.994172 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105170.005948 -snap {("G1" 2)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetCursor -win $_nWave6 105165.080223 -snap {("G1" 5)}
wvSetCursor -win $_nWave6 105168.094716 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105170.181672 -snap {("G1" 4)}
wvSetCursor -win $_nWave6 105170.413556 -snap {("G1" 4)}
wvSetCursor -win $_nWave6 105169.254136 -snap {("G1" 3)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 107301.698551 107409.292754
wvSetCursor -win $_nWave6 107344.385381 -snap {("G1" 4)}
wvScrollDown -win $_nWave6 1
wvSearchPrev -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvSelectSignal -win $_nWave6 {( "G1" 1 )} 
wvSearchPrev -win $_nWave6
wvSetCursor -win $_nWave6 105169.862046 -snap {("G1" 1)}
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 29 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetCursor -win $_nWave6 105168.887461 -snap {("G1" 5)}
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 105171.323923 -snap {("G1" 4)}
wvSetCursor -win $_nWave6 105128.031338 -snap {("G1" 3)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSearchPrev -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 105061.741567 105250.421256
wvSetCursor -win $_nWave6 105170.608380 -snap {("G1" 2)}
wvSetCursor -win $_nWave6 105169.753853 -snap {("G1" 2)}
wvGetSignalOpen -win $_nWave6
wvGetSignalSetScope -win $_nWave6 "/DW_fp_dp2"
wvSetPosition -win $_nWave6 {("G1" 7)}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvAddSignal -win $_nWave6 -clear
wvAddSignal -win $_nWave6 -group {"G1" \
{/toy_top/u_toy_scalar/u_core/u_toy_commit/cycle\[63:0\]} \
{/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/clk} \
{/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_vld} \
{/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/s_rdy} \
{/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/rst_n} \
{/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/rst_n} \
{/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/pntr_w\[1:0\]} \
{/\\s_vld&&s_rdy } \
{/toy_top/u_toy_scalar/u_core/u_toy_issue/u_toy_physicial_regfile_top/u_int_physicial_regfile/u_toy_pre_alloc_buffer/genblk1\[0\]/u_cmn_reg_slice_full/clk} \
}
wvAddSignal -win $_nWave6 -group {"G2" \
}
wvAddSignal -win $_nWave6 -group {"G3" \
}
wvSetPosition -win $_nWave6 {("G1" 7)}
wvGetSignalClose -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvZoom -win $_nWave6 105133.521883 105262.042831
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_vld" -line 29 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_rdy" -line 29 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "s_vld" -line 29 -pos 1 -win $_nTrace1
srcSelect -signal "s_rdy" -line 29 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 105128.865327 105330.028550
wvSelectSignal -win $_nWave6 {( "G1" 7 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "rst_n" -line 27 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave6
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nWave6
wvZoom -win $_nWave6 105141.984668 105269.533812
wvZoomOut -win $_nWave6
wvScrollUp -win $_nWave6 1
wvScrollDown -win $_nWave6 0
wvScrollDown -win $_nWave6 1
wvScrollDown -win $_nWave6 1
wvScrollUp -win $_nWave6 1
wvScrollUp -win $_nWave6 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pntr_w" -line 29 -pos 2 -win $_nTrace1
srcAction -pos 28 14 3 -win $_nTrace1 -name "pntr_w" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiSetActWin -dock widgetDock_<Message>
nsMsgSelect -range {24 0-0}
verdiDockWidgetSetCurTab -dock windowDock_OneSearch
verdiSetActWin -win $_OneSearch
verdiDockWidgetSetCurTab -dock windowDock_nWave_6
verdiSetActWin -win $_nWave6
wvSetCursor -win $_nWave6 105151.227359 -snap {("G1" 7)}
wvSetCursor -win $_nWave6 105169.943810 -snap {("G1" 1)}
wvSelectSignal -win $_nWave6 {( "G1" 8 )} 
wvSelectSignal -win $_nWave6 {( "G1" 9 )} 
wvSetCursor -win $_nWave6 105149.840956 -snap {("G1" 7)}
wvSetCursor -win $_nWave6 105169.712743 -snap {("G1" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "rst_n" -line 28 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave6
debExit
