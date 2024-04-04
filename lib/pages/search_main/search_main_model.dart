import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/footer_client/footer_client_home/footer_client_home_widget.dart';
import 'search_main_widget.dart' show SearchMainWidget;
import 'package:flutter/material.dart';

class SearchMainModel extends FlutterFlowModel<SearchMainWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for header component.
  late HeaderModel headerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for footer_client_home component.
  late FooterClientHomeModel footerClientHomeModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    footerClientHomeModel = createModel(context, () => FooterClientHomeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    footerClientHomeModel.dispose();
  }
}
