import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  //############################################################################
  //############################################################################
  //############################################################################
  // - - - - - - - - - - - - - -//GENERAL PART// - - - - - - - - - - - - - - - -
  //############################################################################
  //############################################################################
  //############################################################################

  String get locale {
    return Intl.message('en', name: 'locale');
  }

  String get app_name_txt {
    return Intl.message('Hijozaty', name: 'app_name_txt');
  }

  String get app_txt {
    return Intl.message('app', name: 'app_txt');
  }

  String get back_txt {
    return Intl.message('Back', name: 'back_txt');
  }

  String get home_txt {
    return Intl.message('Home', name: 'home_txt');
  }

  String get search_txt {
    return Intl.message('Search', name: 'search_txt');
  }
  String get name_txt {
    return Intl.message('Name', name: 'name_txt');
  }

  String get no_internet_txt {
    return Intl.message('NO INTERNET CONNECTION', name: 'no_internet_txt');
  }

  String get warning_be_conncted_internet_txt {
    return Intl.message(
        'Please make sure your device is connected to the Internet',
        name: 'warning_be_conncted_internet_txt');
  }

  String get try_again_txt {
    return Intl.message('Try again', name: 'try_again_txt');
  }

  String get confirm_txt {
    return Intl.message('Confirm', name: 'confirm_txt');
  }
  String get ignore_txt {
    return Intl.message('Ignore', name: 'ignore_txt');
  }
  String get follow_us_on_txt {
    return Intl.message('Follow us on', name: 'follow_us_on_txt');
  }
  String get facebook_txt {
    return Intl.message('FACEBOOK', name: 'facebook_txt');
  }
  String get instagram_txt {
    return Intl.message('INSTAGRAM', name: 'instagram_txt');
  }

  String get address_end_two_points_txt {
    return Intl.message('Address :', name: 'address_end_two_points_txt');
  }

  String get address_txt {
    return Intl.message('Address', name: 'address_txt');
  }

  String get phone_end_two_points_txt {
    return Intl.message('Phone :', name: 'phone_end_two_points_txt');
  }

  String get city_txt {
    return Intl.message('City', name: 'city_txt');
  }
  String get city_end_two_points_txt {
    return Intl.message('City :', name: 'city_end_two_points_txt');
  }
  String get phone_txt {
    return Intl.message('Phone', name: 'phone_txt');
  }

  String get chat_txt {
    return Intl.message('Chat', name: 'chat_txt');
  }
  String get chats_txt {
    return Intl.message('Chats',
        name: 'chats_txt');
  }
  String get warning_login_or_register_txt {
    return Intl.message('Please Log in or Register',
        name: 'warning_login_or_register_txt');
  }

  String get one_period_txt {
    return Intl.message('One period', name: 'one_period_txt');
  }

  String get delete_txt {
    return Intl.message("Delete", name: 'delete_txt');
  }

  String get details_txt {
    return Intl.message('Details', name: 'details_txt');
  }

  String get close_txt {
    return Intl.message('Close', name: 'close_txt');
  }

  String get number_txt {
    return Intl.message('Number', name: 'number_txt');
  }

  String get click_load_image_again_txt {
    return Intl.message('Click to load\nimage again',
        name: 'click_load_image_again_txt');
  }

  String get refresh_txt {
    return Intl.message('Refresh', name: 'refresh_txt');
  }

  String get date_txt {
    return Intl.message('Date', name: 'date_txt');
  }

  String get save_edits_txt {
    return Intl.message("Save edits", name: 'save_edits_txt');
  }

  //----------------------------------------------------------------------------
  //------------------------verify phone screen---------------------------------
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  String get code_is_being_sent_loading_txt {
    return Intl.message('Code is being sent loading..',
        name: 'code_is_being_sent_loading_txt');
  }

  String get hint_phone_txt {
    return Intl.message('Type the phone number here in English',
        name: 'hint_phone_txt');
  }
  String get dr_hint_phone_txt {
    return Intl.message('The personal phone number is not shown to users',
        name: 'dr_hint_phone_txt');
  }
  String get add_appointment_txt {
    return Intl.message('Add appointment', name: 'add_appointment_txt');
  }

  String get unexpected_error_occurred_try_again_txt {
    return Intl.message('An unexpected error occurred, please try again',
        name: 'unexpected_error_occurred_try_again_txt');
  }

  //----------------------------------------------------------------------------
  //------------------------inter screen---------------------------------
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  String get new_registration_txt {
    return Intl.message('New registration', name: 'new_registration_txt');
  }

  String get log_in_txt {
    return Intl.message('Login', name: 'log_in_txt');
  }

  String get skip_txt {
    return Intl.message('Skip', name: 'skip_txt');
  }

  String get add_phone_txt {
    return Intl.message(
        'Please choose the country code below. In the input field, just enter the phone number and without the country code',
        name: 'add_phone_txt');
  }

  //----------------------------------------------------------------------------
  //------------------------inter registration dialog---------------------------
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  String get register_as_patient_txt {
    return Intl.message('Register as a patient',
        name: 'register_as_patient_txt');
  }

  String get register_as_doctor_txt {
    return Intl.message('Register as a doctor', name: 'register_as_doctor_txt');
  }

  String get register_as_pharmacist_txt {
    return Intl.message('Register as a pharmacist',
        name: 'register_as_pharmacist_txt');
  }

  String get register_as_medical_assistant_txt {
    return Intl.message('Register as a medical assistant',
        name: 'register_as_medical_assistant_txt');
  }

  //----------------------------------------------------------------------------
  //-----------------------------//Http Gun//-----------------------------------
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------

  String get warning_no_data_txt {
    return Intl.message("No data, please try again later",
        name: 'warning_no_data_txt');
  }

  String get warning_problem_loading_data_txt {
    return Intl.message("There is a problem loading the data,please try later",
        name: 'warning_problem_loading_data_txt');
  }

  String get warning_weak_internet_txt {
    return Intl.message("Your internet connection appears very weak",
        name: 'warning_weak_internet_txt');
  }

  //----------------------------------------------------------------------------
  //------------------------general registration--------------------------------
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  String get continuation_txt {
    return Intl.message("Continuation..", name: 'continuation_txt');
  }

  String get continue_in_registration_txt {
    return Intl.message("Continue in registration",
        name: 'continue_in_registration_txt');
  }

  String get warning_location_not_found_txt {
    return Intl.message(
        "The address was not recognized. Please add the address manually",
        name: 'warning_location_not_found_txt');
  }

  String get modifying_working_info_txt {
    return Intl.message("Modifying working info",
        name: 'modifying_working_info_txt');
  }

  String get working_info_txt {
    return Intl.message("Working info", name: 'working_info_txt');
  }

  String get saving_txt {
    return Intl.message("Saving...", name: 'saving_txt');
  }

  String get submission_in_progress_txt {
    return Intl.message("Submission In Progress...",
        name: 'submission_in_progress_txt');
  }

  String get professional_practice_number_txt {
    return Intl.message("Professional practice certificate number",
        name: 'professional_practice_number_txt');
  }

  String get certificate_authority_txt {
    return Intl.message("Certificate Authority",
        name: 'certificate_authority_txt');
  }

  String get graduation_date_txt {
    return Intl.message("Graduation Date", name: 'graduation_date_txt');
  }

  String get certificate_issued_at_txt {
    return Intl.message("The date the certificate was issued",
        name: 'certificate_issued_at_txt');
  }

  String get continue_txt {
    return Intl.message("Continue", name: 'continue_txt');
  }

  String get warning_add_name_txt {
    return Intl.message("Please make sure to enter your full name",
        name: 'warning_add_name_txt');
  }

  String get warning_enter_address_txt {
    return Intl.message("Please make sure to enter the address",
        name: 'warning_enter_address_txt');
  }

  String get choose_your_city_txt {
    return Intl.message("Please choose your city",
        name: 'choose_your_city_txt');
  }

  String get please_enter_password_txt {
    return Intl.message("Please enter the password",
        name: 'please_enter_password_txt');
  }

  String get warning_short_password_txt {
    return Intl.message("Please enter a password for at least 6 characters",
        name: 'warning_short_password_txt');
  }

  String get warning_ensure_enter_correct_password_txt {
    return Intl.message(
        "Please ensure that the password is rewritten correctly",
        name: 'warning_ensure_enter_correct_password_txt');
  }

  String get provinces_txt {
    return Intl.message("Provinces", name: 'provinces_txt');
  }
  String get province_txt {
    return Intl.message("Province", name: 'province_txt');
  }
  String get male_txt {
    return Intl.message("Male", name: 'male_txt');
  }

  String get female_txt {
    return Intl.message("Female", name: 'female_txt');
  }

  String get undefined_txt {
    return Intl.message("Undefined", name: 'undefined_txt');
  }

  String get select_gender_txt {
    return Intl.message("Select gender", name: 'select_gender_txt');
  }

  String get please_choose_city {
    return Intl.message("Please choose a city", name: 'please_choose_city');
  }

  String get please_enter_the_phone_city {
    return Intl.message("Please enter the phone",
        name: 'please_enter_the_phone_city');
  }

  //Please choose a city
  String get img_added_txt {
    return Intl.message('Image Added', name: 'img_added_txt');
  }

  String get sign_up_txt {
    return Intl.message('Sign Up', name: 'sign_up_txt');
  }

  String get enter_clinic_address_txt {
    return Intl.message("Enter the clinic's address",
        name: 'enter_clinic_address_txt');
  }

  String get practical_experiences_txt {
    return Intl.message("Practical experiences and certifications",
        name: 'practical_experiences_txt');
  }

  String get select_specialization_txt {
    return Intl.message("Select specialization",
        name: 'select_specialization_txt');
  }

  String get medical_checking_price_in_iraq_dinar_txt {
    return Intl.message("Medical checking price(in Iraqi dinar)",
        name: 'medical_checking_price_in_iraq_dinar_txt');
  }


  String get clinic_name_txt {
    return Intl.message("Clinic name", name: 'clinic_name_txt');
  }

  String get ask_activate_chat_txt {
    return Intl.message("Do you want to activate the chat?",
        name: 'ask_activate_chat_txt');
  }

  String get clinic_phone_txt {
    return Intl.message("Clinic phone", name: 'clinic_phone_txt');
  }

  String get add_medical_specialization_txt {
    return Intl.message("Please add medical specialization",
        name: 'add_medical_specialization_txt');
  }

  String get add_the_name_of_the_clinic_txt {
    return Intl.message("Please add the name of the clinic",
        name: 'add_the_name_of_the_clinic_txt');
  }

  String get add_the_price_txt {
    return Intl.message("Please add the price", name: 'add_the_price_txt');
  }

  String get add_clinic_phone_number_txt {
    return Intl.message("Please add the clinic's phone number",
        name: 'add_clinic_phone_number_txt');
  }

  String get add_clinic_address_txt {
    return Intl.message("Please add the clinic's address",
        name: 'add_clinic_address_txt');
  }

  String get experience_years_txt {
    return Intl.message('Experience Years', name: 'experience_years_txt');
  }

  String get sign_in_btn {
    return Intl.message('Sign in', name: 'sign_in_btn');
  }

  String get verify_txt {
    return Intl.message('Verify', name: 'verify_txt');
  }

  String get verification_in_progress_txt {
    return Intl.message('Verification in progress',
        name: 'verification_in_progress_txt');
  }

  String get empty_phone_txt {
    return Intl.message('Phone number (+x xxx-xxx-xxxx)',
        name: 'empty_phone_txt');
  }

  String get enter_phone_txt {
    return Intl.message('please enter Phone number in english',
        name: 'enter_phone_txt');
  }

  String get email_txt {
    return Intl.message('Email', name: 'email_txt');
  }

  String get password_txt {
    return Intl.message('Password', name: 'password_txt');
  }

  String get add_img_btn {
    return Intl.message('ADD YOUR IMAGE', name: 'add_img_btn');
  }

  String get will_send_verifi_etxt {
    return Intl.message('The verification code will be sent in a few moments',
        name: 'will_send_verifi_etxt');
  }

  String get enter_code_etxt {
    return Intl.message('Enter Code in english just', name: 'enter_code_etxt');
  }

  String get resend_code_etxt {
    return Intl.message('Resend code', name: 'resend_code_etxt');
  }

  String get not_sent_code_etxt {
    return Intl.message('If the code does not arrive, please',
        name: 'not_sent_code_etxt');
  }

  String get contact_us_etxt {
    return Intl.message('Contact us', name: 'contact_us_etxt');
  }
  String get contact_etxt {
    return Intl.message('Contact', name: 'contact_etxt');
  }
  String get enter_name_etxt {
    return Intl.message('Enter the Triple Name', name: 'enter_name_etxt');
  }

  String get check_phone_msg_code_etxt {
    return Intl.message('Please check your phone for the verification code.',
        name: 'check_phone_msg_code_etxt');
  }
  String get re_enter_pass_etxt {
    return Intl.message('Re-enter password', name: 're_enter_pass_etxt');
  }

  String get warning_re_enter_pass_txt {
    return Intl.message('Please make sure to re-write your password correctly',
        name: 'warning_re_enter_pass_txt');
  }

  String get warning_enter_phone_txt {
    return Intl.message('Please make sure to add phone number',
        name: 'warning_enter_phone_txt');
  }

  String get warning_add_correct_phone_txt {
    return Intl.message('Please make sure to add correct phone number',
        name: 'warning_add_correct_phone_txt');
  }

  String get click_select_city_txt {
    return Intl.message('Click to select the city',
        name: 'click_select_city_txt');
  }

  String get enter_residence_address_txt {
    return Intl.message('Enter your residence address',
        name: 'enter_residence_address_txt');
  }

  String get enter_email_txt {
    return Intl.message('Enter your Email', name: 'enter_email_txt');
  }

  String get certificate_number_txt {
    return Intl.message("Certificate number", name: 'certificate_number_txt');
  }

  String get warning_add_certificate_professional_authority_txt {
    return Intl.message("Please add a professional certificate authority",
        name: 'warning_add_certificate_professional_authority_txt');
  }

  String get warning_add_certificate_number_txt {
    return Intl.message("Please add certificate number",
        name: 'warning_add_certificate_number_txt');
  }

  String get warning_add_graduation_date_txt {
    return Intl.message("Please add graduation Date",
        name: 'warning_add_graduation_date_txt');
  }

  String get i_agree_txt {
    return Intl.message("I agree", name: 'agree_txt');
  }

  String get privacy_policy_txt {
    return Intl.message("Privacy policy", name: 'privacy_policy_txt');
  }

  String get warning_accept_privacy_txt {
    return Intl.message(
        "It is not possible to register without agreeing to the Privacy Policy",
        name: 'warning_accept_privacy_txt');
  }

  String get enter_pharmacy_address_txt {
    return Intl.message("Enter the pharmacy address",
        name: 'enter_pharmacy_address_txt');
  }

  String get pharmacy_name_txt {
    return Intl.message("Pharmacy name", name: 'pharmacy_name_txt');
  }

  String get pharmacy_address_txt {
    return Intl.message("Pharmacy address", name: 'pharmacy_address_txt');
  }

  String get pharmacy_phone_txt {
    return Intl.message("Pharmacy phone", name: 'pharmacy_phone_txt');
  }

  String get warning_add_the_pharmacy_address_txt {
    return Intl.message("Please add the pharmacy address",
        name: 'warning_add_the_pharmacy_address_txt');
  }

  String get warning_add_the_pharmacy_name_txt {
    return Intl.message("Please add Pharmacy name",
        name: 'add_the_pharmacy_name_txt');
  }
  String get no_new_appointments_yet_txt {
    return Intl.message("There are no new appointments yet",
        name: 'no_new_appointments_yet_txt');
  }

  //----------------------------------------------------------------------------
  //------------------------Step2 Registeration widget--------------------------
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  String get true_txt {
    return Intl.message("True", name: 'true_txt');
  }

  String get working_period_txt {
    return Intl.message("Working period", name: 'working_period_txt');
  }

  String get first_period_txt {
    return Intl.message("First period", name: 'first_period_txt');
  }

  String get second_period_txt {
    return Intl.message("Second period", name: 'second_period_txt');
  }

  String get other_period_txt {
    return Intl.message("Other period", name: 'other_period_txt');
  }

  String get warning_changed_work_times_txt {
    return Intl.message(
        "Are you sure you have changed work times as you want ??!!",
        name: 'warning_changed_work_times_txt');
  }

  String get workdays_txt {
    return Intl.message("Workdays", name: 'workdays_txt');
  }

  String get warning_adjust_working_times_txt {
    return Intl.message(
        "Please make sure adjust the working times as you suitable for you accurately",
        name: 'warning_adjust_working_times_txt');
  }

  String get default_warning_adjust_working_times_txt {
    return Intl.message(
        "By default, the working hours are set as follows, please amend them as suitable for you",
        name: 'default_warning_adjust_working_times_txt');
  }

  String get restore_day_txt {
    return Intl.message("Restore this day", name: 'restore_day_txt');
  }

  String get delete_day_txt {
    return Intl.message("Delete this day", name: 'delete_day_txt');
  }

  String get restore_period_txt {
    return Intl.message("Restore this period", name: 'restore_period_txt');
  }

  String get start_work_txt {
    return Intl.message("Start of work", name: 'start_work_txt');
  }

  String get end_work_txt {
    return Intl.message("End of work", name: 'end_work_txt');
  }

  String get edit_txt {
    return Intl.message("Edit", name: 'edit_txt');
  }

  String get done_txt {
    return Intl.message("Done", name: 'done_txt');
  }

  String get start_time_txt {
    return Intl.message("Start time", name: 'start_time_txt');
  }

  String get end_time_txt {
    return Intl.message("End time", name: 'end_time_txt');
  }

  String get hour_txt {
    return Intl.message("Hour", name: 'hour_txt');
  }

  String get minute_txt {
    return Intl.message("Minute", name: 'minute_txt');
  }

  String get morning_txt {
    return Intl.message("Morning", name: 'morning_txt');
  }

  String get evening_txt {
    return Intl.message("Evening", name: 'evening_txt');
  }

  String get edit_work_times_txt {
    return Intl.message("Edit work times", name: 'edit_work_times_txt');
  }

  String get work_times_txt {
    return Intl.message("Work times", name: 'work_times_txt');
  }

  String get warning_on_add_new_work_times_txt {
    return Intl.message(
        "Please make sure that you have made appropriate changes to your working times, or click Back",
        name: 'warning_on_add_new_work_times_txt');
  }

  String get add_second_period_txt {
    return Intl.message("Add second period", name: 'add_second_period_txt');
  }

  String get cancel_second_period_txt {
    return Intl.message("Cancel second period",
        name: 'cancel_second_period_txt');
  }

  String get warning_edit_birthdate_less20_txt {
    return Intl.message('The birthdate cannot be modified for less than twenty years',
        name: 'warning_edit_birthdate_less20_txt');
  }

  //----------------------------------------------------------------------------
  //------------------------week days-------------------------------------------
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  String get saturday_txt {
    return Intl.message("Saturday", name: 'saturday_txt');
  }

  String get sunday_txt {
    return Intl.message("Sunday", name: 'sunday_txt');
  }

  String get monday_txt {
    return Intl.message("Monday", name: 'monday_txt');
  }

  String get tuesday_txt {
    return Intl.message("Tuesday", name: 'tuesday_txt');
  }

  String get wednesday_txt {
    return Intl.message("Wednesday", name: 'wednesday_txt');
  }

  String get thursday_txt {
    return Intl.message("Thursday", name: 'thursday_txt');
  }

  String get friday_txt {
    return Intl.message("Friday", name: 'friday_txt');
  }

  //----------------------------------------------------------------------------
  //------------------------Log In ---------------------------------------------
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  String get enter_username_etxt {
    return Intl.message('Please enter your phone', name: 'enter_username_etxt');
  }

  String get log_in_btn {
    return Intl.message('Log in', name: 'log_in_btn');
  }

  String get new_account_btn {
    return Intl.message('New Account', name: 'new_account_btn');
  }

  String get forgot_pass_txt {
    return Intl.message('Forgot your password', name: 'forgot_pass_txt');
  }

  String get snack_bar_enter_username_txt {
    return Intl.message('Please enter your phone',
        name: 'snack_bar_enter_username_txt');
  }

  String get snack_bar_enter_pass_txt {
    return Intl.message('Please enter your password',
        name: 'snack_bar_enter_pass_txt');
  }

  String get enter_pass_etxt {
    return Intl.message('Enter password', name: 'enter_pass_etxt');
  }

  //----------------------------------------------------------------------------
  //------------------------main page-------------------------------------------
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------

  String get my_times_txt {
    return Intl.message('My Times', name: 'my_times_txt');
  }

  String get consulting_txt {
    return Intl.message('Consulting', name: 'consulting_txt');
  }

  String get international_services_txt {
    return Intl.message('International services',
        name: 'international_services_txt');
  }

  String get my_account_txt {
    return Intl.message('My Account', name: 'my_account_txt');
  }

  String get more_txt {
    return Intl.message('More', name: 'more_txt');
  }

  String get msg_from_txt {
    return Intl.message('Message From', name: 'msg_from_txt');
  }

  String get warning_add_reply_txt {
    return Intl.message('Please add reply .. ??!!',
        name: 'warning_add_reply_txt');
  }

  //----------------------------------------------------------------------------
  //----------------------------//Dialogs widgets//-----------------------------
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  //***********************//close app  Dialog//**************************

  String get confirm_closing_Hijozty_txt {
    return Intl.message('Confirm closing Hijozty',
        name: 'confirm_closing_Hijozty_txt');
  }

  String get warinig_confirm_closing_Hijozty_txt {
    return Intl.message('Are you sure you want to close Hijozty',
        name: 'warinig_confirm_closing_Hijozty_txt');
  }

  //***********************//add appointment Dialog//**************************
  String get add_phone_or_patient_name_txt {
    return Intl.message("Add a phone or patient's name",
        name: 'add_phone_or_patient_name_txt');
  }

  String get confirm_appointment_txt {
    return Intl.message("Confirm appointment", name: 'confirm_appointment_txt');
  }

  //************************//Add Question Dialog//*****************************
  String get publish_txt {
    return Intl.message("Publish", name: 'publish_txt');
  }

  String get please_enter_topic_title_txt {
    return Intl.message("Please enter the topic title",
        name: 'please_enter_topic_title_txt');
  }

  String get please_enter_topic_content_txt {
    return Intl.message("Please enter the topic content",
        name: 'please_enter_topic_content_txt');
  }

  String get warning_topic_content_length_txt {
    return Intl.message("The content of the topic should be at least 10 words",
        name: 'warning_topic_content_length_txt');
  }

  String get provide_advice_txt {
    return Intl.message("Provide advice", name: 'provide_advice_txt');
  }

  String get ask_for_advice_txt {
    return Intl.message("Ask for advice", name: 'ask_for_advice_txt');
  }

  String get write_topic_detail_txt {
    return Intl.message("Write topic detail", name: 'write_topic_detail_txt');
  }

  String get consultation_detail_txt {
    return Intl.message("Consultation details",
        name: 'consultation_detail_txt');
  }

//************************//Reply Question Dialog//*****************************
  String get reply_txt {
    return Intl.message("Reply", name: 'reply_txt');
  }

//************************//cancel appointment Dialog//**************************
  String get warning_cancel_appointment_txt {
    return Intl.message("Do you really want to cancel this appointment?",
        name: 'warning_cancel_appointment_txt');
  }

  String get confirm_cancel_txt {
    return Intl.message("Confirm cancel", name: 'confirm_cancel_txt');
  }

//************************//Change language Dialog//****************************
  String get arabic_txt {
    return Intl.message("Arabic", name: 'arabic_txt');
  }

  String get italy_txt {
    return Intl.message("Italy", name: 'italy_txt');
  }
  String get english_txt {
    return Intl.message("English", name: 'english_txt');
  }
  String get kurdish_txt {
    return Intl.message("Kurdish", name: 'kurdish_txt');
  }
  String get russian_txt {
    return Intl.message("Russian", name: 'russian_txt');
  }
//************************//Delete Account Dialog//*****************************
  String get confirm_delete_txt {
    return Intl.message("Confirm delete", name: 'confirm_delete_txt');
  }

  String get warning_delete_content_txt {
    return Intl.message("Are you sure you want to delete this content?",
        name: 'warning_delete_content_txt');
  }

  String get go_settings_txt {
    return Intl.message("Go to settings", name: 'go_settings_txt');
  }

  //************************//Support Dialog//*****************************
  String get direct_contact_txt {
    return Intl.message("Direct contact", name: 'direct_contact_txt');
  }

  String get app_not_found_txt {
    return Intl.message("app not found", name: 'app_not_found_txt');
  }

  //************************//New Date Dialog//*****************************
  String get swipe_to_choose_date_txt {
    return Intl.message("Swipe to choose date",
        name: 'swipe_to_choose_date_txt');
  }

  String get time_ago_txt {
    return Intl.message("Time ago", name: 'time_ago_txt');
  }

  String get you_have_chosen_txt {
    return Intl.message("You have chosen", name: 'you_have_chosen_txt');
  }

  String get date_ago_txt {
    return Intl.message("Date ago", name: 'date_ago_txt');
  }

  String get recheck_txt {
    return Intl.message("Recheck", name: 'recheck_txt');
  }

  String get title_click_edit_rescheduling_txt {
    return Intl.message("To confirm the rescheduling, click Edit",
        name: 'title_click_edit_rescheduling_txt');
  }

  String get warning_not_possible_change_appointment_earlier_txt {
    return Intl.message(
        "Not possible to change the appointment to an earlier time",
        name: 'warning_not_possible_change_appointment_earlier_txt');
  }

  String get choose_appropriate_period_by_clicking_on_the_period_txt {
    return Intl.message(
        "Choose the appropriate period for you by clicking on the period",
        name: 'choose_appropriate_period_by_clicking_on_the_period_txt');
  }

  //************************//show image Dialog//*******************************
  String get click_on_image_to_zoom_txt {
    return Intl.message(" Click on image to zoom",
        name: 'click_on_image_to_zoom_txt');
  }

  //************************//update appointment dialog//***********************
  String get undo_txt {
    return Intl.message("Undo", name: 'undo_txt');
  }

  //************************//warninr period dialog//***************************
  String get warning_arrangement_error_time_txt {
    return Intl.message(
        "Arrangement error Make sure all times\nare changed correctly then press Done",
        name: 'warning_arrangement_error_txt');
  }

  String get confirm_registration_txt {
    return Intl.message("Confirm registration",
        name: 'confirm_registration_txt');
  }

  String get warning_arrangement_error_periods_txt {
    return Intl.message(
        "An error in the arrangement between the morning period and evening period",
        name: 'warning_arrangement_error_periods_txt');
  }

  String get correct_arrangement_txt {
    return Intl.message("Correct arrangement", name: 'correct_arrangement_txt');
  }

  String get the_end_of_the_first_period_txt {
    return Intl.message("The end of the first period",
        name: 'the_end_of_the_first_period_txt');
  }

  String get the_beginning_of_the_second_period_txt {
    return Intl.message("The beginning of the second period",
        name: 'the_end_of_the_first_period_txt');
  }

  String get period_work_n_line_txt {
    return Intl.message("Period\nwork", name: 'period_work_n_line_txt');
  }

  String get first_period_n_line_txt {
    return Intl.message("First\nperiod", name: 'first_period_n_line_txt');
  }

  String get second_period_n_line_txt {
    return Intl.message("Second\nperiod", name: 'second_period_n_line_txt');
  }

  String get wrong_arrangement_n_line_txt {
    return Intl.message("Wrong\narrangement",
        name: 'wrong_arrangement_n_line_txt');
  }

  //----------------------------------------------------------------------------
  //-----------------------//all profiles page//--------------------------------
  //----------------------------------------------------------------------------
  String get personal_account_txt {
    return Intl.message('Personal account', name: "personal_account_txt");
  }

  String get full_name_txt {
    return Intl.message('Full name', name: "full_name_txt");
  }

  String get full_name_end_two_points_txt {
    return Intl.message('Full name :', name: "full_name_end_two_points_txt");
  }
  String get name_end_two_points_txt {
    return Intl.message('Name :', name: "name_end_two_points_txt");
  }
  String get birthdate_end_two_points_txt {
    return Intl.message('Birthdate :', name: "birthdate_end_two_points_txt");
  }

  String get birthdate_txt {
    return Intl.message('Birthdate', name: "birthdate_txt");
  }

  String get gender_end_two_points_txt {
    return Intl.message('Gender :', name: "gender_end_two_points_txt");
  }

  String get email_end_two_points_txt {
    return Intl.message('Email :', name: 'email_end_two_points_txt');
  }

  String get career_txt {
    return Intl.message('Career', name: 'career_txt');
  }

  String get career_end_two_points_txt {
    return Intl.message('Career :', name: 'career_end_two_points_txt');
  }

  String get save_image_txt {
    return Intl.message('Save Image', name: 'save_image_txt');
  }

  String get edit_personal_info_txt {
    return Intl.message('Edit personal info', name: 'edit_personal_info_txt');
  }

  String get delete_account_txt {
    return Intl.message('Delete account', name: 'delete_account_txt');
  }

  String get save_txt {
    return Intl.message("Save", name: 'save_txt');
  }
  String get personal_info_txt {
    return Intl.message("Personal info", name: 'personal_info_txt');
  }

  //----------------------------------------------------------------------------
  //----------------------------//adds widgets//--------------------------------
  //----------------------------------------------------------------------------
  String get note_request_publication_ad_txt {
    return Intl.message("Contact us request publication an ad",
        name: 'note_request_publication_ad_txt');
  }

  String get more_info_txt {
    return Intl.message("More info", name: 'more_info_txt');
  }

  String get advertising_txt {
    return Intl.message("Advertising", name: 'advertising_txt');
  }

  String get report_txt {
    return Intl.message("Report", name: 'report_txt');
  }

  String get like_txt {
    return Intl.message("Like", name: 'like_txt');
  }

  String get dislike_txt {
    return Intl.message("Dislike", name: 'dislike_txt');
  }

  //----------------------------------------------------------------------------
  //-----------------------------//chat screen//--------------------------------
  //----------------------------------------------------------------------------
  String get messages_txt {
    return Intl.message("Messages", name: 'messages_txt');
  }

  String get no_messages_txt {
    return Intl.message("No messages", name: 'no_messages_txt');
  }

  String get other_user_txt {
    return Intl.message("Other user", name: 'other_user_txt');
  }

  String get a_long_time_txt {
    return Intl.message("A long time", name: 'a_long_time_txt');
  }

  String get click_to_see_more_details_txt {
    return Intl.message("Click to see more details",
        name: 'click_to_see_more_details_txt');
  }

  String get sending_txt {
    return Intl.message("Sending.....", name: 'sending_txt');
  }

  String get send_txt {
    return Intl.message("Send", name: 'send_txt');
  }

  String get deleted_message_txt {
    return Intl.message("This message has been deleted",
        name: 'deleted_message_txt');
  }

  String get connection_error_txt {
    return Intl.message("Connection error", name: 'connection_error_txt');
  }

  String get writing_now_txt {
    return Intl.message("Writing now .....", name: 'writing_now_txt');
  }

  String get last_seen_txt {
    return Intl.message("Last seen", name: 'last_seen_txt');
  }

  String get active_since_txt {
    return Intl.message("Active since", name: 'active_since_txt');
  }

  String get enter_the_message_txt {
    return Intl.message("Enter the message .... ",
        name: 'enter_the_message_txt');
  }

  String get warning_delete_message_txt {
    return Intl.message("If you want to delete this message, click Delete",
        name: 'warning_delete_message_txt');
  }

  //----------------------------------------------------------------------------
  //-----------------------------//Discussion screen//--------------------------
  //----------------------------------------------------------------------------
  String get medical_advice_txt {
    return Intl.message("Medical Advice", name: 'medical_advice_txt');
  }

  String get add_topic_txt {
    return Intl.message("Add a topic", name: 'add_topic_txt');
  }

  //----------------------------------------------------------------------------
  //-----------------------------//Settings page//------------------------------
  //----------------------------------------------------------------------------
  String get settings_txt {
    return Intl.message('Settings', name: 'settings_txt');
  }

  String get language_txt {
    return Intl.message('Language', name: 'language_txt');
  }

  String get sign_out_txt {
    return Intl.message('Sign out', name: 'sign_out_txt');
  }

  String get share_txt {
    return Intl.message('Share', name: 'share_txt');
  }

  String get rate_txt {
    return Intl.message('Rate', name: 'rate_txt');
  }

  String get check_for_updates_txt {
    return Intl.message('Check for updates', name: 'check_for_updates_txt');
  }

  String get give_your_opinion_txt {
    return Intl.message('Do you want to give your opinion on',
        name: 'give_your_opinion_txt');
  }

  String get support_center_txt {
    return Intl.message('Support Center', name: 'support_center_txt');
  }

  String get about_us_txt {
    return Intl.message('About Us', name: 'about_us_txt');
  }

  //----------------------------------------------------------------------------
  //---------------------//Dr List appointment Item//---------------------------
  //----------------------------------------------------------------------------
  String get cancel_txt {
    return Intl.message('CANCEL', name: 'cancel_txt');
  }

  String get canceled_txt {
    return Intl.message('Canceled', name: 'canceled_txt');
  }

  String get status_txt {
    return Intl.message('Status', name: 'status_txt');
  }

  String get status_end_two_point_txt {
    return Intl.message('Status :', name: 'status_end_two_point_txt%');
  }

  String get main_complaint_txt {
    return Intl.message('Main complaint', name: 'main_complaint_txt');
  }

  String get main_complaint_end_two_point_txt {
    return Intl.message('Main complaint :',
        name: 'main_complaint_end_two_point_txt');
  }

  String get reservation_number_end_two_point_txt {
    return Intl.message('Reservation number :',
        name: 'reservation_number_end_two_point_txt');
  }

  String get reservation_period_end_two_point_txt {
    return Intl.message('Reservation period :',
        name: 'reservation_period_end_two_point_txt');
  }

  String get warning_add_from_doctor_txt {
    return Intl.message(
        'This appointment was added by the doctor inside the clinic',
        name: 'warning_add_from_doctor_txt');
  }

  String get no_notes_txt {
    return Intl.message('No notes', name: 'no_notes_txt');
  }

  //----------------------------------------------------------------------------
  //-------------------------//List countries Item//----------------------------
  //----------------------------------------------------------------------------
  String get no_data_found_txt {
    return Intl.message('No data found', name: 'no_data_found_txt');
  }

  String get clinics_txt {
    return Intl.message('Clinics', name: 'clinics_txt');
  }

  String get medical_tourism_txt {
    return Intl.message('Medical tourism', name: 'medical_tourism_txt');
  }

  //----------------------------------------------------------------------------
  //---------------------//List iraq provinces item//---------------------------
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  String get all_cities_txt {
    return Intl.message('All cities', name: 'all_cities_txt');
  }

  //############################################################################
  //############################################################################
  //############################################################################
  // - - - - - - - - - - - - - -//USER PART// - - - - - - - - - - - - - - - - -
  //############################################################################
  //############################################################################
  //############################################################################

  //----------------------------------------------------------------------------
  //------------------------HomePagePage----------------------------------------
  //----------------------------------------------------------------------------
  String get doctor_txt {
    return Intl.message('Doctor', name: 'doctor_txt');
  }

  String get patient_txt {
    return Intl.message('Patient', name: 'patient_txt');
  }

  String get pharmacist_txt {
    return Intl.message('Pharmacist', name: 'pharmacist_txt');
  }

  String get medical_assistant_txt {
    return Intl.message('Medical assistant', name: 'medical_assistant_txt');
  }

  String get all_txt {
    return Intl.message('All', name: 'all_txt');
  }

  String get medical_services_txt {
    return Intl.message('Medical services', name: 'medical_services_txt');
  }
  String get IQD_txt {
    return Intl.message('IQD', name: 'IQD_txt');
  }

  String get three_th_IQD_txt {
    return Intl.message('3000 IQD', name: 'three_th_IQD_txt');
  }

  String get five_th_IQD_txt {
    return Intl.message('5000 IQD', name: 'five_th_IQD_txt');
  }

  String get ten_th_IQD_txt {
    return Intl.message('10000 IQD', name: 'ten_th_IQD_txt');
  }

  String get fifteen_th_IQD_txt {
    return Intl.message('15000 IQD', name: 'fifteen_th_IQD_txt');
  }

  String get twenty_th_IQD_txt {
    return Intl.message('20000 IQD', name: 'twenty_th_IQD_txt');
  }

  String get twenty_five_th_IQD_txt {
    return Intl.message('25000 IQD', name: 'twenty_five_th_IQD_txt');
  }

  String get thirty_th_IQD_txt {
    return Intl.message('30000 IQD', name: 'thirty_th_IQD_txt');
  }

  String get thirty_five_th_IQD_txt {
    return Intl.message('35000 IQD', name: 'thirty_five_th_IQD_txt');
  }

  String get forty_th_IQD_txt {
    return Intl.message('40000 IQD', name: 'forty_th_IQD_txt');
  }

  String get forty_five_th_IQD_txt {
    return Intl.message('45000 IQD', name: 'forty_five_th_IQD_txt');
  }

  String get fifty_th_IQD_txt {
    return Intl.message('50000 IQD', name: 'fifty_th_IQD_txt');
  }

  String get sixty_th_IQD_txt {
    return Intl.message('60000 IQD', name: 'sixty_th_IQD_txt');
  }

  String get seventy_th_IQD_txt {
    return Intl.message('70000 IQD', name: 'seventy_th_IQD_txt');
  }

  String get eighty_th_IQD_txt {
    return Intl.message('80000 IQD', name: 'eighty_th_IQD_txt');
  }

  String get ninety_th_IQD_txt {
    return Intl.message('90000 IQD', name: 'ninety_th_IQD_txt');
  }

  String get hundred_th_IQD_txt {
    return Intl.message('100000 IQD', name: 'hundred_th_IQD_txt');
  }

  String get specialties_txt {
    return Intl.message('Specializations', name: 'specialties_txt');
  }

  String get best_doctors_txt {
    return Intl.message('Top rating', name: 'best_doctors_txt');
  }

  String get no_result_txt {
    return Intl.message('No results found', name: 'no_result_txt');
  }

  //- - - ->Doctor details
  String get navigate_note_toast {
    return Intl.message('You can not navigate in previous weeks',
        name: 'navigate_note_toast');
  }

  String get not_available_txt {
    return Intl.message('Not available', name: 'not_available_txt');
  }

  String get dr_reviews_txt {
    return Intl.message('Review', name: 'dr_reviews_txt');
  }

  String get dr_details_txt {
    return Intl.message('Details', name: 'dr_details_txt');
  }

  String get about_doctor_txt {
    return Intl.message('About doctor', name: 'about_doctor_txt');
  }

  String get about_pharmacist_txt {
    return Intl.message('About pharmacist', name: 'about_pharmacist_txt');
  }

  String get about_medical_assistant_txt {
    return Intl.message('About medical assistant',
        name: 'about_medical_assistant_txt');
  }

  String get offer_txt {
    return Intl.message('Offers', name: 'offer_txt');
  }

  String get work_for_txt {
    return Intl.message('works for', name: 'work_for_txt');
  }

  String get specialty_txt {
    return Intl.message('Specialty', name: 'specialty_txt');
  }

  String get clinic_address_txt {
    return Intl.message('Clinic Address', name: 'clinic_address_txt');
  }

  String get phones_txt {
    return Intl.message('Phone', name: 'phones_txt');
  }

  String get working_days_txt {
    return Intl.message('Working days', name: 'working_days_txt');
  }

  String get yes_txt {
    return Intl.message('Yes', name: 'yes_txt');
  }

  String get no_txt {
    return Intl.message('No', name: 'no_txt');
  }

  String get custom_search_txt {
    return Intl.message('Custom search', name: 'custom_search_txt');
  }

  String get search_result_txt {
    return Intl.message('Search result', name: 'search_result_txt');
  }

  String get appointments_txt {
    return Intl.message('Appointments', name: 'appointments_txt');
  }

  String get swipe_to_load_txt {
    return Intl.message('Swipe to load more', name: 'swipe_to_load_txt');
  }

  String get the_days_txt {
    return Intl.message('The days', name: 'the_days_txt');
  }

  String get the_prices_txt {
    return Intl.message('The prices', name: 'the_prices_txt');
  }

  String get loading_failed_txt {
    return Intl.message('Loading failed', name: 'loading_failed_txt');
  }

  String get loading_txt {
    return Intl.message('Loading...', name: 'loading_txt');
  }

  String get no_more_data_txt {
    return Intl.message('There no more data', name: 'no_more_data_txt');
  }

  String get select_province_city_txt {
    return Intl.message('Select the province or city',
        name: 'select_province_city_txt');
  }

  String get select_type_service_txt {
    return Intl.message('Select the type of medical service',
        name: 'select_type_service_txt');
  }

  String get select_price_txt {
    return Intl.message('Select price', name: 'select_price_txt');
  }

  String get select_working_day_txt {
    return Intl.message('Select working day', name: 'select_working_day_txt');
  }

  String get show_on_map_txt {
    return Intl.message('Show on the map', name: 'show_on_map_txt');
  }
  String get my_location_txt {
    return Intl.message('My location', name: 'my_location_txt');
  }
  String get workplace_txt {
    return Intl.message('Workplace', name: 'workplace_txt');
  }

  String get warning_allow_get_image_txt {
    return Intl.message('warning_allow_get_image_txt', name: 'To be able to send pictures please allow the application to use the image library, go to the settings below so that you can do that');
  }
  String get warning_allow_locate_txt {
    return Intl.message("Hijozaty requires access to your location  To facilitate access to application services on the map to enable the addition of home and work addresses and to determine the closest services provided", name: 'warning_allow_locate_txt');
  }
  //----------------------------------------------------------------------------
  //-----------------------//appointment screen//-------------------------------
  //----------------------------------------------------------------------------
  String get my_appointments_txt {
    return Intl.message('My Appointments', name: 'my_appointments_txt');
  }

  String get there_are_no_appointments_txt {
    return Intl.message('There are no appointments',
        name: 'there_are_no_appointments_txt');
  }

//------------------------------------------------------------------------------
//-----------------------//Filter list item widget//----------------------------
//------------------------------------------------------------------------------
  String get dr_end_with_two_points_txt {
    return Intl.message('DR :', name: 'dr_end_with_two_points_txt');
  }

  String get specialty_end_with_two_points_txt {
    return Intl.message('Specialty :',
        name: 'specialty_end_with_two_points_txt');
  }

  String get clinic_address_end_with_two_points_txt {
    return Intl.message('Clinic Address :',
        name: 'clinic_address_end_with_two_points_txt');
  }

  String get check_up_price_end_with_two_points_txt {
    return Intl.message('Check up price :',
        name: 'check_up_price_end_with_two_points_txt');
  }

  String get pharmacy_name_end_with_two_points_txt {
    return Intl.message('Pharmacy name :',
        name: 'pharmacy_name_end_with_two_points_txt');
  }

  String get pharmacy_address_end_with_two_points_txt {
    return Intl.message('Pharmacy address :',
        name: 'pharmacy_address_end_with_two_points_txt');
  }

  String get clinic_name_end_with_two_points_txt {
    return Intl.message('Clinic name :',
        name: 'clinic_name_end_with_two_points_txt');
  }

  String get experience_years_end_with_two_points_txt {
    return Intl.message('Experience Years :',
        name: 'experience_years_end_with_two_points_txt');
  }

//------------------------------------------------------------------------------
//-----------------------//main doctor details screen//-------------------------
//------------------------------------------------------------------------------

  String get check_up_price_txt {
    return Intl.message('Check up price', name: 'check_up_price_txt');
  }

  String get warning_able_to_chat_txt {
    return Intl.message('Please register to be able to chat',
        name: 'warning_able_to_chat_txt');
  }

  String get show_workplace_on_map_txt {
    return Intl.message('Show workplace on the map',
        name: 'show_workplace_on_map_txt');
  }

  String get no_offers_now_txt {
    return Intl.message('There are no offers now', name: 'no_offers_now_txt');
  }

  //----------------------------------------------------------------------------
  //-----------------------//Confirm Booking Screen//---------------------------
  //----------------------------------------------------------------------------
  String get appointment_request_txt {
    return Intl.message('Appointment request', name: 'appointment_request_txt');
  }

  String get waring_book_more_than_once_txt {
    return Intl.message('You cannot book more than once in the same period',
        name: 'waring_book_more_than_once_txt');
  }

  String get doctor_end_with_two_points_txt {
    return Intl.message('Doctor :', name: 'doctor_end_with_two_points_txt');
  }

  String get working_period_end_two_points_txt {
    return Intl.message('Working period :',
        name: 'working_period_end_two_points_txt');
  }

  String get working_times_end_two_points_txt {
    return Intl.message('Working times :',
        name: 'working_times_end_two_points_txt');
  }

  String get from_txt {
    return Intl.message('From', name: "from_txt");
  }

  String get to_txt {
    return Intl.message('To', name: "to_txt");
  }

  String get all_appointments_end_with_two_points_txt {
    return Intl.message('All appointments :',
        name: 'all_appointments_end_with_two_points_txt');
  }

  String get no_appointments_txt {
    return Intl.message('There are no appointments',
        name: 'no_appointments_txt');
  }

  String get appointments_in_this_day_txt {
    return Intl.message('Appointments in this day',
        name: 'appointments_in_this_day_txt');
  }

  String get guest_txt {
    return Intl.message('Guest', name: "guest_txt");
  }

  String get not_found_txt {
    return Intl.message('Not found', name: "not_found_txt");
  }

  String get reserved_sequence_txt {
    return Intl.message('Reserved sequence', name: "reserved_sequence_txt");
  }

  String get waiting_for_approval_txt {
    return Intl.message('Waiting\nfor approval',
        name: "waiting_for_approval_txt");
  }

  String get waiting_for_entry_txt {
    return Intl.message('Waiting\nfor entry', name: "waiting_for_entry_txt");
  }

  String get under_checking_txt {
    return Intl.message('Under\nChecking', name: "under_checking_txt");
  }

  String get test_completed_txt {
    return Intl.message('Test\nCompleted', name: "test_completed_txt");
  }

  String get canceled_test_txt {
    return Intl.message('Canceled\Test', name: "canceled_test_txt");
  }

  String get waiting_txt {
    return Intl.message('Waiting', name: "waiting_txt");
  }

  String get evening_shift_txt {
    return Intl.message('Evening shift', name: "evening_shift_txt");
  }

  String get morning_shift_txt {
    return Intl.message('Morning Shift', name: "morning_shift_txt");
  }

  //----------------------------------------------------------------------------
  //-----------------------//button sheet widget//------------------------------
  //----------------------------------------------------------------------------
  String get warning_choose_day_user_txt {
    return Intl.message(
        'Choose a reservation day.\nGreen means a working day.\nGray means a day off.',
        name: "warning_choose_day_user_txt");
  }

  String get warning_register_reservation_txt {
    return Intl.message('Please register to be able to get a reservation',
        name: "warning_register_reservation_txt");
  }

  String get finished_working_time_txt {
    return Intl.message('Finished working time',
        name: "finished_working_time_txt");
  }

  String get click_to_book_txt {
    return Intl.message('Click here to book', name: "click_to_book_txt");
  }

  String get finished_period_txt {
    return Intl.message('Finished period', name: "finished_period_txt");
  }

  String get finished_txt {
    return Intl.message('Finished', name: "finished_txt");
  }

  String get beginning_week_txt {
    return Intl.message('Beginning week', name: "beginning_week_txt");
  }

  //----------------------------------------------------------------------------
  //-----------------------//international services page//----------------------
  //----------------------------------------------------------------------------
  String get will_activated_soon_txt {
    return Intl.message('Will be activated soon',
        name: "will_activated_soon_txt");
  }
  String get hospitals_txt {
    return Intl.message('Hospitals',
        name: "hospitals_txt");
  }

  //----------------------------------------------------------------------------
  //---------------------//List user appointments item//------------------------
  //----------------------------------------------------------------------------
  String get new_request_appointment_note_txt {
    return Intl.message(
        ''
        ' _ You are now waiting for approval of the reservation request by the doctor. \n'
        ' _ In some urgent cases, the doctor may cancel your reservation request or change the date of your reservation and you will be notified at that time. \n'
        ' - If you want to cancel the reservation request, please press me on The icon for canceling a reservation below or contacting the doctor and asking him to cancel the reservation:'
        '',
        name: 'new_request_appointment_note_txt');
  }

  String get scheduled_appointment_note_txt {
    return Intl.message(
        ''
        ' - Your reservation has been confirmed by the doctor, you are now waiting for your turn to enter the doctor to perform the test (examination) .. \n'
        'Please pay attention to the notifications of your sequence, which the doctor will send you so that you do not delay in attending the clinic. \n'
        ' _ If you are late, your reservation will be canceled automatically. \n'
        ' - If you wish to cancel the reservation, please contact the doctor by clicking on the icon below:'
        '',
        name: 'scheduled_appointment_note_txt');
  }

  String get inprogress_appointment_note_txt {
    return Intl.message(
        ' _Doctor is waiting for you now.\n'
        ' _Please come or your appointment will be missed.',
        name: 'inprogress_appointment_note_txt');
  }

  String get done_appointment_note_txt {
    return Intl.message(
        ' _The doctor has been completed your medical test. \n'
        ' _You are now leaving the clinic ..\n'
        ' _flutterBoilerplateWithbloc team wishes to you a speedy recovery, Allah willing.',
        name: 'done_appointment_note_txt');
  }

  String get canceled_appointment_note_txt {
    return Intl.message(
        ' We regret to inform you about this, this reservation has been canceled',
        name: 'canceled_appointment_note_txt');
  }

  String get appointments_count_txt {
    return Intl.message('Appointments count', name: "appointments_count_txt");
  }

  String get no_number_canceled_reservation_txt {
    return Intl.message('There is no number. canceled reservation',
        name: "no_number_canceled_reservation_txt");
  }

  String get reservation_period_txt {
    return Intl.message('Reservation period', name: "reservation_period_txt");
  }

  String get rate_this_appointment_txt {
    return Intl.message('Rate this appointment',
        name: "rate_this_appointment_txt");
  }

  String get evaluation_txt {
    return Intl.message('Evaluation', name: "evaluation_txt");
  }

  String get press_on_star_to_set_rating_txt {
    return Intl.message('Press on star to set your rating',
        name: "press_on_star_to_set_rating_txt");
  }

  String get we_are_very_glad_to_hear_that_txt {
    return Intl.message('We are very glad to hear that :)',
        name: "press_on_star_to_set_rating_txt");
  }

  String get we_are_sad_to_hear_that_txt {
    return Intl.message('We are sad to hear :(',
        name: "we_are_sad_to_hear_that_txt");
  }

  String get notes_txt {
    return Intl.message('Notes', name: 'notes_txt');
  }

  String get cancel_this_appointment_txt {
    return Intl.message('Cancel this appointment',
        name: 'cancel_this_appointment_txt');
  }

  String get chat_was_canceled_by_the_doctor_txt {
    return Intl.message('Chat was canceled\nby the doctor',
        name: 'chat_was_canceled_by_the_doctor_txt');
  }

  String get allowed_to_evaluate_the_appointment_once_txt {
    return Intl.message('Allowed to evaluate the appointment once',
        name: 'allowed_to_evaluate_the_appointment_once_txt');
  }
  String get evaluation_successful_done_txt {
    return Intl.message('Evaluation successful done',
        name: 'evaluation_successful_done_txt');
  }

  //############################################################################
  //############################################################################
  //############################################################################
  // - - - - - - - - - - - - - -//DOCTOR PART// - - - - - - - - - - - - - - - -
  //############################################################################
  //############################################################################
  //############################################################################
  String get new_appointments_txt {
    return Intl.message('New Appointments',
        name: 'new_appointments_txt');
  }
  String get reviews_txt {
    return Intl.message('Reviews',
        name: 'reviews_txt');
  }
  String get medical_advices_txt {
    return Intl.message('Medical Advices',
        name: 'medical_advices_txt');
  }
  String get doctor_info_txt {
    return Intl.message('Doctor info',
        name: 'doctor_info_txt');
  }
  String get experiences_txt {
    return Intl.message('Experiences',
        name: 'experiences_txt');
  }
  String get enable_chat_txt {
    return Intl.message('Enable chat',
        name: 'enable_chat_txt');
  }
  String get on_txt {
    return Intl.message('On',
        name: 'on_txt');
  }
  String get off_txt {
    return Intl.message('Off',
        name: 'off_txt');
  }
  String get click_to_cycle_between_weeks_txt {
    return Intl.message('Click to cycle between weeks',
        name: 'click_to_cycle_between_weeks_txt');
  }
  String get holiday_txt {
    return Intl.message('Holiday',
        name: 'holiday_txt');
  }
  String get this_holiday_txt {
    return Intl.message('this holiday',
        name: 'this_holiday_txt');
  }
  String get appointment_number_txt {
    return Intl.message('Appointment number',
        name: 'appointment_number_txt');
  }
  String get see_more_txt {
    return Intl.message('See more',
        name: 'see_more_txt');
  }
  String get set_new_time_txt {
    return Intl.message('Set a new time',
        name: 'set_new_time_txt');
  }
  String get no_notes_found_txt {
    return Intl.message('No notes found',
        name: 'no_notes_found_txt');
  }

  String get warning_accept_appointment_txt {
    return Intl.message('Do you want to accept this appointment?',
        name: 'warning_accept_appointment_txt');
  }
  String get has_been_approved_txt {
    return Intl.message('Has been approved',
        name: 'has_been_approved_txt');
  }
  String get reschedule_txt {
    return Intl.message('Reschedule',
        name: 'reschedule_txt');
  }
  String get reschedule_this_appointment_txt {
    return Intl.message('Reschedule this appointment',
        name: 'reschedule_this_appointment_txt');
  }
  String get  warning_transfer_appointment_to_review_txt {
    return Intl.message('Do you want to transfer this appointment to the review?',
        name: 'do_you_want_to_transfer_appointment_to_review_txt');
  }
  String get under_revision_txt {
    return Intl.message('Under revision',
        name: 'under_revision_txt');
  }
  String get change_as_completed_txt {
    return Intl.message('Change as completed',
        name: 'under_revision_txt');
  }
  String get warning_appointment_set_as_completed_txt {
    return Intl.message('This appointment has been set as completed',
        name: 'warning_appointment_set_as_completed_txt');
  }
  String get completed_txt {
    return Intl.message('Completed',
        name: 'comleted_txt');
  }
  String get warning_set_appointment_to_be_completed_txt {
    return Intl.message('Do you want to set this appointment as to be completed?',
        name: 'warning_set_appointment_to_be_completed_txt');
  }
  String get warning_delete_appointment_txt {
    return Intl.message('Do you want to permanently delete this appointment (the appointment cannot be returned if it was deleted)?',
        name: 'warning_delete_appointment_txt');
  }
  String get there_are_no_later_appointments_txt {
    return Intl.message('There are no later appointments',
        name: 'there_are_no_later_appointments_txt');
  }
  String get warning_reschedule_appointment_txt {
    return Intl.message('Do you want to reschedule this appointment?',
        name: 'warning_reschedule_appointment_txt');
  }
  String get appointment_has_been_moved_to_the_Reviews_txt {
    return Intl.message('The appointment has been moved to the Reviews section',
        name: 'appointment_has_been_moved_to_the_Reviews_txt');
  }
  String get warning_transfer_appointment_to_the_review_txt {
    return Intl.message('Do you want to transfer the appointment to the review?',
        name: 'warning_transfer_appointment_to_the_review_txt');
  }
  String get discard_txt {
    return Intl.message('Discard',
        name: 'discard_txt');
  }

  String get accepted_txt {
    return Intl.message('Accepted',
        name: 'accepted_txt');
  }
  String get accept_txt {
    return Intl.message('Accept',
        name: 'accept_txt');
  }

  //----------------------------------------------------------------------------
  //---------------------//List phonebook item//------------------------
  //----------------------------------------------------------------------------
  String get views_txt {
    return Intl.message('Views',
        name: 'views_txt');
  }
  String get select_country_txt {
    return Intl.message('Select country',
        name: 'select_country_txt');
  }

  String get all_countries_txt {
    return Intl.message('All countries',
        name: 'all_countries_txt');
  }
  String get clinics_phonebook_txt {
    return Intl.message('Clinics Phonebook',
        name: 'clinics_phonebook_txt');
  }
  String get search_in_clinics_phonebooks_txt {
    return Intl.message("Search in clinics phonebook",
        name: 'search_in_clinics_phonebooks_txt');
  }
  String get doctor_details_txt {
    return Intl.message('Doctor details',
        name: 'doctor_details_txt');
  }
  String get description_txt {
    return Intl.message('Description',
        name: 'description_txt');
  }
  String get additional_specialization_txt {
    return Intl.message('Additional specialization',
        name: 'additional_specialization_txt');
  }
  String get qualifications_txt {
    return Intl.message('Qualifications',
        name: 'qualifications_txt');
  }
  String get mobile_txt {
    return Intl.message('Mobile',
        name: 'mobile_txt');
  }

  //############################################################################
  //############################################################################
  //############################################################################
  // - - - - - - - - - - - - - -//PHARMACIST PART// - - - - - - - - - - - - - - - -
  //############################################################################
  //############################################################################
  //############################################################################
  String get pharmacist_info_txt {
    return Intl.message('Pharmacist info', name: 'pharmacist_info_txt');
  }
  String get pharmacist_details_txt {
    return Intl.message('Pharmacist details', name: 'pharmacist_details_txt');
  }
  //############################################################################
  //############################################################################
  //############################################################################
  // - - - - - - - - - - - - - -//PHARMACIST PART// - - - - - - - - - - - - - - - -
  //############################################################################
  //############################################################################
  //############################################################################
  String get medical_assistant_info_txt {
    return Intl.message('Medical assistant info', name: 'medical_assistant_info_txt');
  }
  String get medical_assistant_details_txt {
    return Intl.message('Medical assistant details', name: 'medical_assistant_details_txt');
  }


  String get demo_txt {
    return Intl.message('demo',
        name: 'demo_txt');
  }
  String get sent_chat_msg_txt {
    return Intl.message('An alert has been sent that there a new message',
        name: 'sent_chat_msg_txt');
  }

}

//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<_DefaultCupertinoLocalizations>(
          _DefaultCupertinoLocalizations(locale));

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends DefaultCupertinoLocalizations {
  final Locale locale;

  _DefaultCupertinoLocalizations(this.locale);
}
