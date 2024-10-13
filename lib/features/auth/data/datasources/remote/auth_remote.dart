import 'dart:convert';

import 'package:chat_2/core/api/api_links.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/signup_request_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/response/signup_response_entity.dart';
import 'package:chat_2/features/auth/domin/entites/image_partner_model/response/image_partner_response.dart';
import 'package:flutter/material.dart';

import '../../../../../core/api/api_methods.dart';
import '../../../../../core/error/exception.dart';
import '../../../domin/entites/auth_model/requiest/login_request_entity.dart';
import '../../../domin/entites/auth_model/response/login_response_entity.dart';

abstract class AuhtRemote {
  Future<LoginResponse> login({required LoginRequest loginEntity});
  Future<SigninResponse> signin({required SigninRequest signinEntity});
  Future<ImagePartnerResponse> imagePartner();
}

class AuthRemoteImp implements AuhtRemote {
  //!--------------------------LogIn--------------------------------------------
  @override
  Future<LoginResponse> login({required LoginRequest loginEntity}) async {
    var response = await ApiMethods().post(
      url: ApiPost.loginUrl,
      body: loginRequestToJson(loginEntity),
      query: {},
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return loginResponseFromJson(response.body);
    } else {
      throw ServerException(response: response);
    }
  }
  //!--------------------------SignUp-------------------------------------------

  //? Sign In Remote:
  @override
  Future<SigninResponse> signin({required SigninRequest signinEntity}) async {
    var response = await ApiMethods().post(
      url: ApiPost.singinUrl,
      body: signinRequestToJson(signinEntity),
      query: {},
    );

    debugPrint(response.body);
    if (response.statusCode == 200) {
      return signinResponseFromJson(response.body);
    } else {
      throw ServerException(response: response);
    }
  }

  //!--------------------------image--------------------------------------------
  //? Sign In Remote Impl:
  @override
  Future<ImagePartnerResponse> imagePartner() async {
    var response = await ApiMethods().get(
      url:
          "${ApiGet.imagePartnerUrl}${AppSharedPreferences.getUserId().toString()}",
      path: {},
      query: {},
    );
    debugPrint(response.body);

    if (response.statusCode == 200) {
      //! data as base64 must decode image
      String imageBase64 = base64Encode(response.bodyBytes);
      return ImagePartnerResponse(imagePartner: imageBase64);
    } else {
      throw ServerException(response: response);
    }
  }
}
