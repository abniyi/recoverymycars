import '/flutter_flow/flutter_flow_util.dart';
import 'setting_main_widget.dart' show SettingMainWidget;
import 'package:flutter/material.dart';

class SettingMainModel extends FlutterFlowModel<SettingMainWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
