import '/flutter_flow/flutter_flow_util.dart';
import 'network_detail_widget.dart' show NetworkDetailWidget;
import 'package:flutter/material.dart';

class NetworkDetailModel extends FlutterFlowModel<NetworkDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
