
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_event_state.dart';

abstract class DecisionEvent extends BlocEvent {
  final String action;
  final String locale;
  final String token;
  final bool loading;

  DecisionEvent({
    this.locale: 'ar',
    this.token: '',
    this.action: '',
    this.loading:true,
  });
}

class DecisionEventLoad extends DecisionEvent {
  DecisionEventLoad({
    String locale,
  }) : super(
    locale: locale,

  );
}
class DecisionEventChangeLoanuage extends DecisionEvent {
  DecisionEventChangeLoanuage({
    String locale,
  }) : super(
    locale: locale,
  );
}

class DecisionEventLogin extends DecisionEvent {
  DecisionEventLogin({
    String action,
  }) : super(
    action: action,
        );
}

class AuthenticationEventLogout extends DecisionEvent {}
