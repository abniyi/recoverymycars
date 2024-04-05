import '/flutter_flow/flutter_flow_util.dart';
import 'setting_q_r_widget.dart' show SettingQRWidget;
import 'package:flutter/material.dart';

class SettingQRModel extends FlutterFlowModel<SettingQRWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
