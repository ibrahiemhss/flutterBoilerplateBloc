import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_event_state.dart';


 class HomeState extends BlocState {
  final bool isLoadedSearch;
  final bool isLoaded;
  final bool isLoadingSearch;
  final bool isLoading;
  final bool hasFailed;
  final bool isIntenet_connected;

  HomeState({
    this.isIntenet_connected,
    this.hasFailed: false,
    this.isLoadingSearch: false,
    this.isLoading: false,
    this.isLoadedSearch: false,
    this.isLoaded: false,

  });

  factory HomeState.noAction() {
    return HomeState( isIntenet_connected: false,);
  }

  factory HomeState.noInternet(bool haseInternet) {
    return HomeState(isIntenet_connected: haseInternet,);
  }
  factory HomeState.loadingSearch() {
    return HomeState(
      isLoading: false,
      isLoadingSearch: true,
      isIntenet_connected: true,
    );
  }
  factory HomeState.loaded() {
    return HomeState(
      isLoading: false,
      isLoaded: true,
      isIntenet_connected: true,
    );
  }
  factory HomeState.loading() {
    return HomeState(
      isLoading: true,
      isIntenet_connected: true,
    );
  }


  factory HomeState.failure() {
    return HomeState(
      isLoadedSearch: false,
      hasFailed: true,
    );
  }
}
