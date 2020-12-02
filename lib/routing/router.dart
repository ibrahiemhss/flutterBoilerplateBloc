import 'package:flutter/cupertino.dart';

///  [RouteAwareWidget]implementing RouteAware in each
///  screen would  change
//---------------------------------------------------------------------

class RouteAwareWidget extends StatefulWidget {
  final String name;
  final Widget child;
  final RouteObserver<PageRoute> routeObserver;
  RouteAwareWidget(this.name,this.routeObserver, {@required this.child});

  @override
  State<RouteAwareWidget> createState() => RouteAwareWidgetState();
}

// Implement RouteAware in a widget's state and subscribe it to the RouteObserver.
class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    widget.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  // Called when the current route has been pushed.
  void didPush() {
    // print('didPush ${widget.name}');
  }

  @override
  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    print('didPopNext ${widget.name}');
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

///  [PreviousRouteObserver] to Observing the action of changes in launching
///  screens in case of push notifications

class PreviousRouteObserver extends NavigatorObserver {
  Route _previousRoute;

  Route get previousRoute => _previousRoute;

  String get previousRouteName => _previousRoute.settings.name;

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    _previousRoute = previousRoute;
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    _previousRoute = oldRoute;
  }
}