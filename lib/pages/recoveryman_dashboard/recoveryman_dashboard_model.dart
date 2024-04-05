import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'recoveryman_dashboard_widget.dart' show RecoverymanDashboardWidget;
import 'package:flutter/material.dart';

class RecoverymanDashboardModel
    extends FlutterFlowModel<RecoverymanDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
  }
}
