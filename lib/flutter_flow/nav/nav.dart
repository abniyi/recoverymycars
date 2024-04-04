import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => const SearchMainWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => const SearchMainWidget(),
        ),
        FFRoute(
          name: 'Search_main',
          path: '/searchMain',
          builder: (context, params) => const SearchMainWidget(),
        ),
        FFRoute(
          name: 'Search_pro',
          path: '/searchPro',
          builder: (context, params) => const SearchProWidget(),
        ),
        FFRoute(
          name: 'Offer_pickup',
          path: '/offerPickup',
          builder: (context, params) => const OfferPickupWidget(),
        ),
        FFRoute(
          name: 'Offer_dropoff',
          path: '/offerDropoff',
          builder: (context, params) => const OfferDropoffWidget(),
        ),
        FFRoute(
          name: 'Offer_vehicle_1',
          path: '/offerVehicle1',
          builder: (context, params) => const OfferVehicle1Widget(),
        ),
        FFRoute(
          name: 'Offer_vehicle_2',
          path: '/offerVehicle2',
          builder: (context, params) => const OfferVehicle2Widget(),
        ),
        FFRoute(
          name: 'Offer_vehicle_3',
          path: '/offerVehicle3',
          builder: (context, params) => const OfferVehicle3Widget(),
        ),
        FFRoute(
          name: 'Network_1',
          path: '/network1',
          builder: (context, params) => const Network1Widget(),
        ),
        FFRoute(
          name: 'Network_tryinvite',
          path: '/networkTryinvite',
          builder: (context, params) => const NetworkTryinviteWidget(),
        ),
        FFRoute(
          name: 'Network_detail',
          path: '/networkDetail',
          builder: (context, params) => const NetworkDetailWidget(),
        ),
        FFRoute(
          name: 'Setting_QR',
          path: '/settingQR',
          builder: (context, params) => const SettingQRWidget(),
        ),
        FFRoute(
          name: 'Setting_Main',
          path: '/settingMain',
          builder: (context, params) => const SettingMainWidget(),
        ),
        FFRoute(
          name: 'Setting_Edit_profile',
          path: '/settingEditProfile',
          builder: (context, params) => const SettingEditProfileWidget(),
        ),
        FFRoute(
          name: 'Entry_page',
          path: '/entryPage',
          builder: (context, params) => const EntryPageWidget(),
        ),
        FFRoute(
          name: 'Recoveryman_dashboard',
          path: '/recoverymanDashboard',
          builder: (context, params) => const RecoverymanDashboardWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'SignUp',
          path: '/signUp',
          builder: (context, params) => const SignUpWidget(),
        ),
        FFRoute(
          name: 'select_location',
          path: '/selectLocation',
          builder: (context, params) => const SelectLocationWidget(),
        ),
        FFRoute(
          name: 'select_vehicle_details',
          path: '/selectVehicleDetails',
          builder: (context, params) => const SelectVehicleDetailsWidget(),
        ),
        FFRoute(
          name: 'select_client_details',
          path: '/selectClientDetails',
          builder: (context, params) => const SelectClientDetailsWidget(),
        ),
        FFRoute(
          name: 'pickup_date',
          path: '/pickupDate',
          builder: (context, params) => const PickupDateWidget(),
        ),
        FFRoute(
          name: 'MyJobs',
          path: '/myJobs',
          builder: (context, params) => const MyJobsWidget(),
        ),
        FFRoute(
          name: 'Job_Details',
          path: '/jobDetails',
          builder: (context, params) => const JobDetailsWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
