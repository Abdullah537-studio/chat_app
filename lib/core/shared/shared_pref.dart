// ignore_for_file: file_names
import 'package:chat_2/core/strings/language_code_string.dart';
import 'package:chat_2/core/strings/state_theme_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../strings/keys_shared_manger.dart';

class AppSharedPreferences {
  static late SharedPreferences _sharedPreferences;

//! ------------- init shared preferences -------------------------------------
  static init(SharedPreferences sh) {
    _sharedPreferences = sh;
  }

//! --------------- cache data {set} -------------------------------------------

//? ---------------  cach token and user id
  static void cacheAuthUserInfoTest({
    required String accessToken,
    required int userId,
  }) {
    _sharedPreferences.setString(AppKeysManger.ACC_TOKEN, accessToken);
    _sharedPreferences.setInt(AppKeysManger.USER_ID, userId);
  }

//? ---------------------- cache id in chat bubble to get all messages

  static void cachIdDialogChatBubblePartner({required String id}) {
    _sharedPreferences.setString(AppKeysManger.ID_CHAT_BUBBLE_PARTNER, id);
  }

//? --------------------- cache user and partner id to chat
  static void cachAccountIdAndPartnerId(
      {required int partnerId, required int userId}) {
    _sharedPreferences.setInt(AppKeysManger.USER_WHO_ID, userId);
    _sharedPreferences.setInt(AppKeysManger.RESIPIENT_ID, partnerId);
  }

//?-----------------------cache translate language
  static void cacheLanguageCode({required String languageCode}) {
    _sharedPreferences.setString(AppKeysManger.LANGUAGE_CODE, languageCode);
  }

//?-----------------------cache theme
  static void cacheThemeStatusAsString({required String theme}) {
    _sharedPreferences.setString(AppKeysManger.THEME_STATUS, theme);
  }

//?-----------------------cache part image have cutting to send to api
  static void cachePartImageHaveCutting({required String imageCut}) {
    _sharedPreferences.setString(AppKeysManger.IMAGE_CUT, imageCut);
  }

//! ---------------------- get data {get} --------------------------------------

//?------------------------- get part image have cuttom to send to api
  static String getPartImageHaveCutting() {
    return _sharedPreferences.getString(AppKeysManger.IMAGE_CUT) ?? '';
  }

//?------------------------- get theme status <String>

  static String getThemeStatusString() {
    return _sharedPreferences.getString(AppKeysManger.THEME_STATUS) ??
        AppStateThemeString.lightTheme;
  }

//?------------------------- get language code

  static String getLanguageCode() {
    return _sharedPreferences.getString(AppKeysManger.LANGUAGE_CODE) ??
        lagnuageCodeString.english;
  }

//? ----------------------- get user id
  static int getAccountUserId() {
    return _sharedPreferences.getInt(AppKeysManger.USER_WHO_ID) ?? 0;
  }
//? ----------------------- get partner id

  static int getAccountpartnerId() {
    return _sharedPreferences.getInt(AppKeysManger.RESIPIENT_ID) ?? 0;
  }

//?------------------------- get Remember Me Value
  static void cacheRememberMeValue(bool isRememberMe) {
    _sharedPreferences.setBool(AppKeysManger.REMEMBER_ME, isRememberMe);
  }

//? ------------------------- get Token
  static String getAccToken() {
    return _sharedPreferences.getString(AppKeysManger.ACC_TOKEN) ?? '';
  }

//? -------------------------- get user id
  static int getUserId() {
    return _sharedPreferences.getInt(AppKeysManger.USER_ID) ?? 0;
  }

//? --------------------------- Get User Name
  static String getUserName() {
    return _sharedPreferences.getString(AppKeysManger.USER_NAME) ?? '';
  }

//? ---------------------------- to get all messages partner
  static String dialogChatBubblePartnerById() {
    return _sharedPreferences.getString(AppKeysManger.ID_CHAT_BUBBLE_PARTNER) ??
        "";
  }

//? ----------------------------- Get Remember Me
  static bool getRememberMeValue() {
    return _sharedPreferences.getBool(AppKeysManger.REMEMBER_ME) ?? false;
  }

  //! -------------- clear shared preferences ------------------------------------
  static clear() {
    _sharedPreferences.clear();
  }
}
