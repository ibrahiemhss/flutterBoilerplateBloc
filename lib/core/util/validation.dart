import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'localization/localizations.dart';

class Validator {

  static bool userSignUpValidation(
      {@required BuildContext context,
        @required bool checkedAcceptedValue,
      @required String name,
      @required String address,
      @required int city_id,
      @required String password,
      @required String confirmPassword}) {
    if (checkedAcceptedValue) {
      bool isConfirmedPass = false;
      if (name.isEmpty) {
        Toast.show(AppLocalizations.of(context).warning_add_name_txt, context,duration:Toast.LENGTH_LONG);
      } else if (address.isEmpty) {
        Toast.show(
            AppLocalizations.of(context).warning_enter_address_txt, context,duration:Toast.LENGTH_LONG);
        return false;
      } else if (city_id == 0) {

        Toast.show(AppLocalizations.of(context).choose_your_city_txt, context,duration:Toast.LENGTH_LONG);
        return false;
      }
      /* else if (_phoneNumberController.text.isEmpty) {
                        setState(() {
                          globalKey.currentState.showSnackBar(new SnackBar(
                              content: new Text('من فضلك ضع الهاتف')));
                        });
                      }*/

      else if (password.length < 6) {
        isConfirmedPass = true;

        Toast.show(
            AppLocalizations.of(context).warning_short_password_txt, context,duration:Toast.LENGTH_LONG);
        return false;
      } else if (password.isEmpty) {
        Toast.show(
            AppLocalizations.of(context).please_enter_password_txt, context,duration:Toast.LENGTH_LONG);
        return false;
      } else if (password != confirmPassword) {
        isConfirmedPass = true;

        Toast.show(
            AppLocalizations.of(context)
                .warning_ensure_enter_correct_password_txt,
            context,duration:Toast.LENGTH_LONG);
        return false;
      } else {
        return true;
      }
    }
  }

  static doctorSignUpValidation({
    @required BuildContext context,
    @required speciality_id,
    @required clinicName,
    @required price,
    @required clinicPhone,
    @required clinicAdress,
  }) {
    if (speciality_id == null) {
      Toast.show(
          AppLocalizations.of(context).add_medical_specialization_txt, context,duration:Toast.LENGTH_LONG);
      return false;
    } else if (clinicName.isEmpty) {
      Toast.show(
          AppLocalizations.of(context).add_the_name_of_the_clinic_txt, context,duration:Toast.LENGTH_LONG);
      return false;
    } else if (price.isEmpty) {
      Toast.show(AppLocalizations.of(context).add_the_price_txt, context,duration:Toast.LENGTH_LONG);
      return false;
    } else if (clinicPhone.isEmpty) {
      Toast.show(
          AppLocalizations.of(context).add_clinic_phone_number_txt, context,duration:Toast.LENGTH_LONG);
      return false;
    } else if (clinicAdress.isEmpty) {
      Toast.show(AppLocalizations.of(context).add_clinic_address_txt, context,duration:Toast.LENGTH_LONG);
      return false;
    } else {
      return true;
    }
  }

  static pharmacySignUpValidation({
    @required BuildContext context,
    @required phName,
    @required phAddress,
    @required certificateNumber,
    @required certificateIssuedBy,
    @required certificateIssuedAt,}
      ) {

    if (certificateNumber.isEmpty) {
      Toast.show(
          AppLocalizations.of(context).warning_add_certificate_number_txt,
          context, duration:Toast.LENGTH_LONG);
      return false;

    } else if (certificateIssuedBy.isEmpty) {

      Toast.show(

          AppLocalizations.of(context).warning_add_certificate_professional_authority_txt,
          context,
          duration:Toast.LENGTH_LONG
      );
      return false;

    } else if (phAddress.isEmpty) {

      Toast.show(
          AppLocalizations.of(context).warning_add_the_pharmacy_address_txt,
          context ,duration:Toast.LENGTH_LONG);
      return false;

    } else if (certificateIssuedAt.isEmpty) {
      Toast.show(
          AppLocalizations.of(context).warning_add_graduation_date_txt,
          context,duration:Toast.LENGTH_LONG);
      return false;
    } else if (phName.isEmpty) {
      Toast.show(
          AppLocalizations.of(context).warning_add_the_pharmacy_name_txt,
          context,duration:Toast.LENGTH_LONG);
      return false;
    } else {
      return true;
    }
  }

  static medicalAssisstantSignUpValidation({
    @required BuildContext context,
    @required officeName,
    @required officeAddress,
    @required officePhone,
    @required certificateNumber,
    @required certificateIssuedBy,
    @required certificateIssuedAt,
  }) {
    if (officeName.isEmpty) {
      Toast.show(
          AppLocalizations.of(context).add_the_name_of_the_clinic_txt, context,duration:Toast.LENGTH_LONG);
      return false;
    } else if (officeAddress.isEmpty) {
      Toast.show(AppLocalizations.of(context).add_clinic_address_txt, context,duration:Toast.LENGTH_LONG);
      return false;
    } else if (officePhone.isEmpty) {
      Toast.show(
          AppLocalizations.of(context).add_clinic_phone_number_txt, context,duration:Toast.LENGTH_LONG);
      return false;
    } else if (certificateNumber.isEmpty) {
      Toast.show(
          AppLocalizations.of(context).warning_add_certificate_number_txt,
          context,duration:Toast.LENGTH_LONG);
      return false;
    } else if (certificateIssuedBy.isEmpty) {
      Toast.show(
          AppLocalizations.of(context)
              .warning_add_certificate_professional_authority_txt,
          context,duration:Toast.LENGTH_LONG);
      return false;
    } else if (certificateNumber.isEmpty) {
      Toast.show(
          AppLocalizations.of(context).warning_add_certificate_number_txt,
          context,duration:Toast.LENGTH_LONG);
      return false;
    } else if (certificateIssuedAt.isEmpty) {
      Toast.show(AppLocalizations.of(context).warning_add_graduation_date_txt,
          context,duration:Toast.LENGTH_LONG);
      return false;
    } else {
      return true;
    }
  }
}
