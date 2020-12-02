import 'package:intl/intl.dart';

class APIConstants {
  static const String OCTET_STREAM_ENCODING = "application/octet-stream";
  static const URL = "https://Site.com";

  static String paseUrl(String local) {
    if(local=="ckb"){
      local="ar";
    }
    return "https://site.com/${local ?? "ar"}/api";
  }

  static String webUrl(String local) {
    if(local=="ckb"){
      local="ar";
    }
    return "https://site.com/${local ?? "ar"}";
  }

  static ABOUT_US_URL(locale) => "${webUrl(locale)}/about";
  static const YOUTUBE_API_ANDROID_KEY =
      'google api toke here';
  static const YOUTUBE_API_IOS_KEY = 'AIzaSyBcC5Q7-PMO9m1h7dkA1rUEE5xqht_EoFk';
  static const FOLLOW_FACEBOOK_URL = 'https://www.facebook.com/hijozaty/';
  static const FOLLOW_INSTAGRAME_URL =
      'https://www.instagram.com/higozaty_app/';

  //static const API_BASE_URL = "http://95.216.223.177/ar/api";

//http://95.216.223.177/ar/api/
  //main page//
  static String API_UPDATE_DEVICE_ID(locale) =>
      "${paseUrl(locale)}/update_device_reg_id";

  //home page//
  static String API_CURRENT_PAGE = "current_page=";
  static String API_ROWS_PER_PAGE = "&rows_per_page=";
  static String API_ROWS = "&rows="; //rows
  static String API_ORDER = "&order="; //&order=
  static String API_TYPE_ID = "&type_id="; //&type_id=
  static String API_SPECIALIZATION_ID =
      "&specialization_id="; //specialization_id
  static String API_COUNTRY_ID = "&country_id="; //specialization_id
  static String API_PROVINCE_ID = "&province_id="; //&province_id=

  static String API_CITY_ID = "&city_id=";

  //settings page//
  static String API_HELP_REQUEST(locale) =>
      "${paseUrl(locale)}/send_help_request";

  static String API_LOGIN_URL(locale) => "${paseUrl(locale)}/login";

  static String API_REGISTER_URL(locale) => "${paseUrl(locale)}/register";

  static String API_GET_USER_INFO(locale) => "${paseUrl(locale)}/user_profile/";

  static String API_GET_IMAGE_INFO(locale) =>
      "${paseUrl(locale)}/update_profile_image";

  ///api/doctor_info/
  static String API_UPDATE_USER_INFO(locale) =>
      "${paseUrl(locale)}/update_my_profile";


//https://www.flutterBoilerplateWithbloc.com/the_promo/5deb635b4d652.jpeg
//medical_phone_book_details
}
class TypeOfSelection {
  static const int SEARCH = 1;
  static const int FILTER = 2;

  static const int FILTER_WITH_SEARCH = 3;
  static const int FILTER_WITH_ALL_SELECTIONS = 4;
  static const int FILTER_PROVINCE = 5;
  static const int FILTER_SPECIALIZATION = 6;
  static const int FILTER_SERVICE = 7;
  static const int FILTER_PRICE = 8;
  static const int FILTER_DAY_INDEX = 9;


}
class TypeOfHttpRequest {
  static const int LOG_IN = 10;
  static const int REGISTER = 11;
  static const int GET_USER_INFO = 12;
  static const int EDIT_USER_INFO = 16;
  static const int GET_ADDS = 52;
}

///////////////////////////////////////////////////////////////////////////////
class LocationWidgetCases {
  static const int ONE_MARKER_DETAILS = 49;
  static const int SHOW_DIALOG = 50;
  static const int REGISTER_LOCATIN = 51;
  static const int SHOW_LIST = 52;
  static const int FULL_SCREEN = 53;
}
////////////////////////////////////////////////////////////////////////////////
class EventTtransactionsConstants {
  static const int FROM_MAIN_SCREEN = 334;
  static const int FROM_LOGIN_SCREEN = 335;

  static const int EDIT_USER_PROFILE = 23;
  static const int FROM_FCM = 55;
  static const int FROM_PREVIOUS_SCREEN = 56;

  static const int ALL_APPOINTENTS = 56;
  static const int APPOINTENT_TYPE_REVIEW = 57;
  static const int APPOINTENT_TYPE_RESERVATION = 59;
  static const int FROM_SIGNUP_SCREEN = 676;
  static const int FROM_EDIT_SCREEN = 453;

  static const int PRIVACY = 12;
  static const int ABOUT_US = 23;



}

///////////////////////////////////////////////////////////////////////////////
class SqliteConstant {
//==============================================================================
//----------------------  Specialties table ------------------------------------
//==============================================================================
  static const String TABLE_SPECIALIZATIONS = 'Specializations';
  static const String _ID = 'id';
  static const String COLUMN_SPECIALIZATIONS_NAME = 'name';
  static const String COLUMN_SPECIALIZATIONS_DESCRIPTION = 'description';
  static const String COLUMN_SPECIALIZATIONS_ICON = 'icon';
  static const String COLUMN_SPECIALIZATIONS_COLOR = 'color';

//==============================================================================
//----------------------  Cities table -----------------------------------------
//==============================================================================

  static const String TABLE_CITIES = 'Cities';
  static const String COLUMN_CITY_ID = 'city_id';
  static const String COLUMN_CITY_NAME = 'city_name';
  static const String COLUMN_LAT = 'lat';
  static const String COLUMN_LONG = 'Long';
}

///////////////////////////////////////////////////////////////////////////////
class APIOperations {
  static const String PLATFORM_ID = "platform_id";
  static const String IOS = "ios";
  static const String ANDROID = "android";

  static const String LOGIN = "login";
  static const String REGISTER = "register";
  static const String CHANGE_PASSWORD = "chgPass";
  static const String SEND_MESSAGE = "send_message";

//------query parameters And Response JSON Messages----------------------------

  static const String STATUS = "status";
  static const String INFO = "info";
  static const String ERROR_DETAILS_MESSAGE = "details";
  static const String MESSAGE_STATUS = "message_status";
  static const String FCM_FAILURE = "failure";
  static const String TRUE = "true";
  static const bool FALSE = false;
  static const String SERVER_TOKEN = "token";
  static const String SUCCESS_MESSAGE = "success_msg";
  static const String SUCCESS = "success";
  static const String ID = "id";
  static const String USER_ID = "user_id"; //user_id
  static const String USER_TYPE_ID = "user_type_id"; //user_id
  static const String DATE = "date"; //date
  static const String TIME = "time"; //time
  static const String SENDER_ID = "sender_id";
  static const String STARS = "stars";
  static const String OBSERVATION = "observation";

  static const String STATUS_ID = "status_id";
  static const String WORK_TIMES = "dates"; //dates
  static const String CHAT_AVAILABLE =
      "available_for_chat"; //available_for_chat
  static const String LATITUDE = 'lat';
  static const String LONGITUDE = 'long';
  static const String LOCATION_DETAILS = 'locationDetails';


  static const String AVERAGE = "average";

  // General
  static const String PRICE = "price"; //clinic_phone
  static const String MESSAGE_BODY = "message_body"; //message_body
  static const String IS_IMAGE = "is_image"; //message_body
  static const String DISCUSSION_ID = "discussion_id"; //discussion_id
  static const String NEW_TEXT = "new_text"; //new_text
  static const String BODY = "body"; //message_body//title
  static const String TITLE = "title"; //message_body//title
  static const String AVAILABLE_FOR_CHAT =
      "available_for_chat"; //message_body//title
  static const String REPORT_BODY = "report_body"; //report_body
  static const String USERNAME = "username";
  static const String FIRST_NAME = "first_name";
  static const String LAST_NAME = "last_name";
  static const String PHONE = "phone";
  static const String EMAIL = "email";
  static const String PASSWORD = "password";
  static const String IS_DOCTOR = "is_doctor";
  static const String IMAGE_URL = "image_url";
  static const String IMGE_URL = "img_url";
  static const String IMAGE_FILE = "image_file";
  static const String DEVICE_REG_TOKEN = "device_reg_id";
  static const String IS_SIGNED = "is_signed_in";

  static const String CITY_ID = "city_id";
  static const String CREATED_AT = "created_at";
  static const String LANG = "lang";
  static const String NAME = "name";
  static const String CITY = "city";
  static const String GENDER = "gender";
  static const String ADDRESS = "address";
  static const String BIRTHDAY = "birth_day";
  static const String CAREER = "career";
  static const String MSG_RECEIVER_NAME = "reciver_name";
  static const String RECEIVER_ID = "receiver_id";
  static const String MSG_SENDER_NAME = "sender_name";
  static const String MSG_CONTENT = "msg_content";
  static const String MSG_IS_IMAGE = "is_image";
  static const String MSG_PIC = "pic";
  static const String USER = "user";
  static const String APPOINTMENTS_COUNT = "appointments_count";

  static const String TYPE_IMAGE_ADS = "image";
  static const String TYPE_VIDEO_ADS = "video";
  static const String TYPE_URL_ADS = "url";

  static const String VIEWS = "views"; //clinic_phone

  static const String MSG = "msg";
}

class GeneralValues {
  ////// Appointments////////
  static const String NO_PROFILE_IMAGE = 'no_image.png';
}
class SocketValues {
  ////// get values////////
  static const String CONNECT='connect';
  static const String SUBSCRIBE='subscribe';
  static const String GET_ALL_MESSAGES='getAllMessages';
  static const String CHECK_LAST_SEEN='checkLastSeen';
  static const String USER_LAST_SEEN='userLastSeen';
  static const String ON_LAST_SEEN='last_seen';
  static const String ON_FETCH_MESSAGES='fetchMessages';
  static const String OLD_MESSAGES='oldMessages';
  static const String ON_MESSAGE_RECEIVED = 'messageReceived';
  static const String ON_TYPING = 'typing';
  static const String SENDER_ID = 'senderId';
  static const String ON_WHO_IS_ONLINE = 'whoIsOnline';
  static const String ONLINE_USERS = 'onlineUsers';
  static const String ON_MSG_DELETED = 'messageDeleted';
  static const String MSG_ID = 'message_id';
  static const String ON_ERROR = 'error';
  static const String ON_DISCONNECT = 'disconnect';
  static const String ON_ONLINE = 'onOnline';

     ////// send values////////

  static const String SEND_MESSAGE = 'sendMessage';
  static const String SEND_IMAGE = 'sendImage';
  static const String MESSAGE_SEEN = 'messageSeen';

  static const String DELET_MESSAGE = 'deleteMessage';


}

class FCMpayload {

  ////// CHAT////////
  static const int CHAT_MSG = 400;
}

class DateAndTimeFormate {
  static String formatTime(DateTime date) =>
      new DateFormat("HH:mm:ss", 'en').format(date);

  static String formatDate(DateTime date) =>
      new DateFormat("yyyy-MM-dd", "en").format(date);
}

///////////////////////////////////////////////////////////////////////////////
class APIResponse {
  static const String REGISTER = "register";
  static const String CHANGE_PASSWORD = "chgPass";
  static const String SUCCESS = "success";
  static const String FAILURE = "failure";
  static const String DUPLICATED = "duplicated";
  static const String NO_INTERNET_ERROR_MESSAGE = "no_internet";
  static const String WEAK_INTERNET_ERROR_MESSAGE = "weak_intenet";
  static const String NO_DATA_INTERNET_ERROR_MESSAGE = "no_data_from_internet";

  static Object DONE = "Done";
}

////////////////////////////////////////////////////////////////////////////////
class EventTransactionsConstants {
  static const int FROM_MAIN_SCREEN = 334;
  static const int FROM_LOGIN_SCREEN = 335;

  static const int EDIT_USER_PROFILE = 23;
  static const int FROM_FCM = 55;
  static const int FROM_PREVIOUS_SCREEN = 56;
  static const int FROM_SIGNUP_SCREEN = 676;
  static const int FROM_EDIT_SCREEN = 453;

  static const int PRIVACY = 12;
  static const int ABOUT_US = 23;
}

enum PageState {
  LoadingSharedState,
  InterScreenState,
  ChatScreenState,
  ReservationsAppointmentState,
  ReviewAppointmentState,
  AppointmentRequestedState
}

////////////////////////////////////////////////////////////////////////////////
class PageIds {
  static const int INTER_SCREEN = 1;
  static const int CHAT_SCREEN = 2;
  static const int RECEIVED_NEW_APPOINTMENT_SCREEN = 3;
  static const int REVIEW_APPOINTMENT_SCREEN = 4;
  static const int REQUEST_NEW_APPOINTMENT_SCREEN = 5;
}

////////////////////////////////////////////////////////////////////////////////
class PossibleStatuses {
  static const int DELETE = 0;
  static const int PLACED = 1;
  static const int SCHEDULED = 2;
  static const int IN_PROGRESS = 3;
  static const int DONE = 4;
  static const int CANCELED = 5;
}

////////////////////////////////////////////////////////////////////////////////
class Routes {
  static const String INTER_SCREEN = '/inter_screen';
  static const String CHAT_SCREEN = '/chat_screen';

}

////////////////////////////////////////////////////////////////////////////////
class TypeOfUsers {
  static const int USER_TYPE = 1;

}

////////////////////////////////////////////////////////////////////////////////
class LikeStatus {
  static const int LIKE = 1;
  static const int DISLIKE = 2;
  static const int REPLIES_LIKE = 4;
  static const int DISCUSSIONS_LIKE = 5;
}

////////////////////////////////////////////////////////////////////////////////
class TypeOfData {
  static const int FROM_INTERNET = 187;
  static const int FROM_SQLITE = 261;
}

///////////////////////////////////////////////////////////////////////////////
class EventInternetConstants {
  static const int NO_INTERNET_CONNECTION = 100;
  static const int WEAK_INTERNET_CONNECTION = 200;
  static const int NO_DATA_FROM_INTERNET = 300;
}

///////////////////////////////////////////////////////////////////////////////
class EventConstants {
  static const int NO_INTERNET_CONNECTION = 0;
  static const int SUCCESSFUL_GETTING_DATA = 343;

///////////////////////////////////////////////////////////////////////////////
  static const int LOGIN_USER_SUCCESSFUL = 500;
  static const int LOGIN_USER_UN_SUCCESSFUL = 501;

///////////////////////////////////////////////////////////////////////////////
  static const int USER_REGISTRATION_SUCCESSFUL = 502;
  static const int USER_REGISTRATION_UN_SUCCESSFUL = 503;
  static const int USER_ALREADY_REGISTERED = 504;

///////////////////////////////////////////////////////////////////////////////
  static const int CHANGE_PASSWORD_SUCCESSFUL = 505;
  static const int CHANGE_PASSWORD_UN_SUCCESSFUL = 506;
  static const int INVALID_OLD_PASSWORD = 507;
///////////////////////////////////////////////////////////////////////////////

}

///////////////////////////////////////////////////////////////////////////////
class EventMessageConstants {
  static const int NO_INTERNET_CONNECTION = 3;

///////////////////////////////////////////////////////////////////////////////
  static const int SEND_SUCCESSFUL = 300;
  static const int SEND_UN_SUCCESSFUL = 301;
}

///////////////////////////////////////////////////////////////////////////////
class APIResponseCode {
  static const int SC_OK = 200;
}

///////////////////////////////////////////////////////////////////////////////

class SharedPreferenceKeys {
  static const String USER_ID = "user_id";
  static const String IS_FIRST_ENTER = "IS_FIRST_ENTER";
  static const String IS_USER_LOGGED_IN = "IS_USER_LOGGED_IN";
  static const String USER = "USER";
  static const String TOTAL_PAGE_PHONES = "TOTAL_PAGE_PHONES";
  static const String TOTAL_PAGE_MAIN_DATA = "TOTAL_PAGE_MAIN_DATA";

  static const String ADVERTISEMENTS = "ADVERTISEMENTS";

  static const String IS_CHAT_OPENED = "IS_OPENED";
  static const String SERVER_TOKEN_ID = "server_token_id";
  static const String FCM_RECEIVE = "fcm_receive";
  static const String LOG_IN_STATUS = "LOG_IN_STATUS";
  static const String SWITCH_CHAT_FCM = "switch_chat_fcm";
  static const String COUNT_MSG = "count_msgs";
  static const int ON_OPENED_CHAT = 564;
  static const int ON_CLOSED_CHAT = 675;
  static const int FROM_FCM = 55;
  static const int FROM_HOME = 66;
  static const String LOCAL_LANGUAGE = "local_language";
  static const String IMG_URL = "img_url";
}
