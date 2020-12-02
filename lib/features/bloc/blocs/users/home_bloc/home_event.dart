import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_event_state.dart';
import 'package:flutter/cupertino.dart';

 class HomeEvent extends BlocEvent {
   final String locale;
   final int type_id;
   final int selectedType;
   final int current_page;
   final int rows_per_page;
  final int slectedSpId;
  final int selctedProvinceId;
  final int selectedCityId;
  final int dayIndex;
  final String selectedPrice;
  final String searchValue;

  HomeEvent(
      {this.selectedType,
        this.locale,
        this.type_id,
        this.current_page,
        this.rows_per_page,
      this.slectedSpId,
      this.selctedProvinceId,
      this.selectedCityId,
      this.dayIndex,
      this.selectedPrice,
      this.searchValue});
}

class HomeLoadSearchEvent extends HomeEvent {
  HomeLoadSearchEvent(
      {
        @required int selectedType,
        @required int current_page,
        @required int total,
        @required int rows_per_page,
        @required String locale,
      @required int type_id,
      @required int slectedSpId,
      @required int selctedProvinceId,
      @required int selectedCityId,
      @required int dayIndex,
      @required String selectedPrice,
      @required String searchValue})
      : super(
      selectedType: selectedType,
      current_page: current_page,
      rows_per_page: rows_per_page,
            locale: locale,
            type_id: type_id,
            slectedSpId: slectedSpId,
            selctedProvinceId: selctedProvinceId,
            selectedCityId: selectedCityId,
            dayIndex: dayIndex,
            selectedPrice: selectedPrice,
            searchValue: searchValue);
}

class HomeCheckInternetEvent extends HomeEvent {}
