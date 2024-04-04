import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/footer_client/footer_client_job/footer_client_job_widget.dart';
import 'job_details_widget.dart' show JobDetailsWidget;
import 'package:flutter/material.dart';

class JobDetailsModel extends FlutterFlowModel<JobDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for footer_client_job component.
  late FooterClientJobModel footerClientJobModel;

  @override
  void initState(BuildContext context) {
    footerClientJobModel = createModel(context, () => FooterClientJobModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    footerClientJobModel.dispose();
  }
}
