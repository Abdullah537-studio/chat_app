import 'package:chat_2/generate/app_localizations/app_localizations.dart';
import 'package:flutter/src/widgets/framework.dart';

translating(BuildContext context, String word) {
  return AppLocalization.of(context)!.translate(word);
}

class AppKeyTranslateManger {
  static String female = "female_drop_down";
  static String male = "male_drop_down";

  static String welcome = "welcome_mes";
  static String home = "Home_mes";
  static String message = "Message_mes";
  static String findpartner = "FindPartner_mes";
  static String suggset = "Suggestion_partner_mes";
  static String login = "login_mes";
  static String singup = "signin_mes";
  static String serverExc = "serverException_mes";
  static String offlineExc = "offlineException_mes";
  static String errorInfo = "errorInformationSignInLogIn_mes";
  static String tryAgain = "tryAgainLater_mes";
  static String agreeSystem = "agreeSystemUsSignin";
  static String noMessageTop = "noMessageTop_mes";
  static String noMessagebottom = "noMessagebottom_mes";
  static String rememberMe = "remember_Me";
  static String partnerAge = "partner_age";
  static String maxPartnerAge = "bettween_age_max";
  static String minPartnerAge = "and_age_min";
  static String country = "country_mes";
  static String city = "city_mes";
  static String gender = "gender_mes";
  static String age = "age_mes";
  static String name = "name_mes";
  static String phone = "phone_mes";
  static String password = "password_mes";
  static String email = "email_mes";
  static String reenterPassword = "re_enter_password_mes";
  static String please_wait = "please_wait";
  static String accept_Qu = "accept_Qu";
  static String accept_system = "accept_system";
  static String login_to_containue = "login_to_containue";
  static String already_have_account = "already_have_account";
  static String not_have_an_account = "dont_have_an_account";
  static String date_form_search = "date_form_search";
  static String search = "search";
  static String write_a_message = "write_a_message";
//!-------------dialog
  static String please_login_to_continue_1_dialog =
      "please_login_to_continue_1_dialog";
  static String please_login_to_continue_2_dialog =
      "please_login_to_continue_2_dialog";
  static String done_dialog = "done_dialog";
//!-------------setting
  static String setting_mes = "setting_mes";
//!-------------validate
  static String field_empty_validate = "field_empty_validate";
  static String email_not_currect = "email_not_currect";
  static String passwod_not_word_currect = "passwod_not_currect";
  static String passwod_not_length_currect = "passwod_not_currect";
  static String reenter_password_not_currrect = "reenter_password_not_currrect";
  static String phone_number_not_currect = "phone_number_not_currect";
  static String min_age_not_currect = "min_age_not_currect";
  static String max_age_not_currect = "max_age_not_currect";
  static String validate_only_number = "validate_only_number";
  static String age_under_12_above_100_not_currect =
      "age_under_12_above_100_not_currect";
//!----------setting
  static String change_languange_setting = "change_languange_setting";
  static String change_theme_setting = "change_theme_setting";
  static String log_out = "log_out";
}
