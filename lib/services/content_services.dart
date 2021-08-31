import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/models.dart';
import '../shared/shared.dart';

class ContentServices {
  static Future<ApiReturnValue<List<ProductModelNew>>>
      getAllDummyProduct() async {
    final Uri url = Uri.parse(baseUrl + 'p241_ecommercemid_api_4.php');

    try {
      http.Response response = await http.post(url, body: {
        'whattodo': 'sys_landing',
        'k1': 'bi.com',
        'k2': 'bi.com',
        'k3': 'bi.com',
        'k4': 'bi.com',
        'k5': 'bi.com',
      });

      if (response.statusCode != 200) {
        throw FailedGetAllProduct();
      }
      final data = jsonDecode(response.body)['rs'] as List;

      return ApiReturnValue(
          data: data.map((e) => ProductModelNew.fromJSON(e)).toList());
    } catch (e) {
      throw FailedGetAllProduct();
    }
  }

  static Future<ApiReturnValue<List<ProductModelNew>>> getAllDummyShop() async {
    final Uri url = Uri.parse(baseUrl + 'p341_ecommercemid_api_1.php');

    try {
      http.Response response = await http.post(url, body: {
        'whattodo': 'sys_shop',
        'k1': 'bi.com',
        'k2': 'bi.com',
        'k3': 'bi.com',
        'k4': 'bi.com',
        'k5': 'bi.com',
      });

      if (response.statusCode != 200) {
        throw FailedGetAllProduct();
      }

      final data = jsonDecode(response.body)['rs'] as List;

      return ApiReturnValue(
          data: data.map((e) => ProductModelNew.fromJSON(e)).toList());
    } catch (e) {
      throw FailedGetAllProduct();
    }
  }

  static Future<ApiReturnValue<List<DetailPromoModel>>> getAllDetailPromo(
      String id) async {
    final Uri url = Uri.parse(baseUrl + 'p131_ecommerce_more_api_3.php');

    try {
      http.Response response = await http.post(
        url,
        body: {
          'whattodo': 'select_3',
          'k1': 'bi.com',
          'k2': 'bi.com',
          'k3': 'bi.com',
          'i1': id,
        },
      );

      if (response.statusCode != 200) {
        throw FailedGetAllDetailPromo();
      }

      final data = jsonDecode(response.body)['rs'] as List;

      return ApiReturnValue(
          data: data.map((e) => DetailPromoModel.fromJSON(e)).toList());
    } catch (e) {
      throw FailedGetAllDetailPromo();
    }
  }

  static Future<ApiReturnValue<ShopDetail>> getShopDetail(String id) async {
    try {
      final Uri url = Uri.parse(baseUrl + 'p341_ecommercemid_api_2.php');

      try {
        http.Response response = await http.post(
          url,
          body: {
            'whattodo': 'sys_shop_detail',
            'k1': 'bi.com',
            'k2': 'bi.com',
            'k3': 'bi.com',
            'k4': 'bi.com',
            'k5': 'bi.com',
            'i1': id,
          },
        );

        if (response.statusCode != 200) {
          throw FailedGetAllDetailPromo();
        }

        final data = jsonDecode(response.body)['rs'] as List;

        return ApiReturnValue(
          data: ShopDetail.fromJSON(data.first),
        );
      } catch (e) {
        throw FailedGetShopDetail();
      }
    } catch (e) {
      throw FailedGetShopDetail();
    }
  }
}

class FailedGetAllProduct implements Exception {}

class FailedGetAllDetailPromo implements Exception {}

class FailedGetAllDetailProduct implements Exception {}

class FailedGetAllShop implements Exception {}

class FailedGetShopDetail implements Exception {}
