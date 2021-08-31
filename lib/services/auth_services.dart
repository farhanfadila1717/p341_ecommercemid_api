import 'dart:convert';

import '../models/models.dart';
import '../shared/shared.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<ApiReturnValue<UserModel>> signIn(
      String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse(baseUrl + 'p241_ecommercemid_api_1.php'),
        body: {
          'whattodo': 'sys_login',
          'k1': 'bi.com',
          'k2': 'bi.com',
          'k3': 'bi.com',
          'k4': 'bi.com',
          'k5': 'bi.com',
          'i1': email,
          'i2': password,
        },
      );

      if (response.statusCode != 200) {
        throw SigninFailed();
      }

      final data = jsonDecode(response.body)['rs'] as List;

      return ApiReturnValue(data: UserModel.fromJSON(data.first));
    } catch (e) {
      throw SigninFailed();
    }
  }

  static Future<ApiReturnValue<String>> forgotPassword(String email) async {
    try {
      http.Response response = await http.post(
        Uri.parse(
            'https://www.generasiterpilih.or.id/mobapps/flutter/p241_ecommercemid_api_3.php'),
        body: {
          'whattodo': 'sys_forget',
          'k1': 'bi.com',
          'k2': 'bi.com',
          'k3': 'bi.com',
          'k4': 'bi.com',
          'k5': 'bi.com',
          'i1': email,
        },
      );

      if (response.statusCode != 200) {
        throw ForgotFailed();
      }

      final data = jsonDecode(response.body)['rs'] as List;

      return ApiReturnValue(
        data: data.first['p1'],
      );
    } catch (e) {
      throw ForgotFailed();
    }
  }

  static Future<ApiReturnValue<UserModel>> signUp(
      RegisterUserModel register) async {
    try {
      http.Response response = await http.post(
        Uri.parse(baseUrl + 'p241_ecommercemid_api_2.php'),
        body: {
          'whattodo': 'sys_register',
          'k1': 'bi.com',
          'k2': 'bi.com',
          'k3': 'bi.com',
          'k4': 'bi.com',
          'k5': 'bi.com',
          'i1': register.name,
          'i2': register.hp,
          'i3': register.email,
          'i4': register.address,
          'i5': register.reffcode,
          'i6': register.password,
        },
      );

      if (response.statusCode != 200) {
        throw SignupFailed();
      }

      final data = jsonDecode(response.body)['rs'] as List;

      print(data);

      return ApiReturnValue(
        data: UserModel('1921jbjka90129', register.name),
        message: data.first['p1'],
      );
    } catch (e) {
      throw SignupFailed();
    }
  }
}

class SigninFailed implements Exception {}

class SignupFailed implements Exception {}

class ForgotFailed implements Exception {}
