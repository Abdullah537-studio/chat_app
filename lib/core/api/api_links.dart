//!--------- Api GET
class ApiGet {
  static const String cityUrl = "api/services/app/City/GetAllCities";
  static const String countryUrl = "api/services/app/Country/GetAllCountries";
  static const String findPartnerUrl =
      "api/services/app/CityPartner/GetAllCityPartners";
  static const String imagePartnerUrl =
      "api/services/app/UserInformation/DownloadImage/";
  static const String getAllchatListDialog =
      "api/services/app/Chat/GetAllChatList";
  static const String getAllChatByIdPartner =
      "api/services/app/Chat/GetDialogByChatId";
}
//

//!---------API Post
class ApiPost {
  //!---------Api Url For Auth
  static const String loginUrl = "api/TokenAuth/Authenticate";
  static const String singinUrl = "api/services/app/Account/Register";
  static const String chatpartnerbubble = "api/services/app/Chat/PostChat";
}

//!--------- Api PUT
class ApiPut {}

//!--------- Api DELETE
class ApiDelete {}
