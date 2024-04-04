import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/footer_client/footer_client_home/footer_client_home_widget.dart';
import 'search_pro_widget.dart' show SearchProWidget;
import 'package:flutter/material.dart';

class SearchProModel extends FlutterFlowModel<SearchProWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for footer_client_home component.
  late FooterClientHomeModel footerClientHomeModel;

  @override
  void initState(BuildContext context) {
    footerClientHomeModel = createModel(context, () => FooterClientHomeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    footerClientHomeModel.dispose();
  }
}
