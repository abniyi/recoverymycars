import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'footer_man_home_model.dart';
export 'footer_man_home_model.dart';

class FooterManHomeWidget extends StatefulWidget {
  const FooterManHomeWidget({super.key});

  @override
  State<FooterManHomeWidget> createState() => _FooterManHomeWidgetState();
}

class _FooterManHomeWidgetState extends State<FooterManHomeWidget> {
  late FooterManHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FooterManHomeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('Search_main');
            },
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.home_rounded,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 40.0,
                  ),
                  Text(
                    'Home',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(const SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.manage_search_outlined,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 40.0,
              ),
              Text(
                'Search',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(const SizedBox(height: 10.0)),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.file_copy_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 40.0,
              ),
              Text(
                'My Offers',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(const SizedBox(height: 10.0)),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.circle_notifications_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 40.0,
              ),
              Text(
                'Notification',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(const SizedBox(height: 10.0)),
          ),
        ),
      ],
    );
  }
}
