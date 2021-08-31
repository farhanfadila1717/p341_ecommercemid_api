import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/models.dart';
import '../shared/shared.dart';

class SubmitServices {
  static Future<ApiReturnValue<String>> submitProduct(
      String size, String note, String quantity, String id) async {
    final Uri url = Uri.parse(baseUrl + 'p131_ecommerce_more_api_21.php');
    http.Client client = http.Client();
    try {
      http.Response response = await client.post(url, body: {
        'whattodo': 'insert_21',
        'k1': 'bi.com',
        'k2': 'bi.com',
        'k3': 'bi.com',
        'i1': id,
        'i2': size,
        'i3': quantity,
        'i4': note,
      });

      print(response.statusCode);

      if (response.statusCode != 200) {
        throw FailedSubmitProduct();
      }

      final data = jsonDecode(response.body)['rs'] as List;

      return ApiReturnValue(
        data: data.first['pesan'],
      );
    } catch (e) {
      throw FailedSubmitProduct();
    } finally {
      client.close();
    }
  }

  static Future<ApiReturnValue<String>> submitPromo(
      String note, String quantity, String id) async {
    final Uri url = Uri.parse(baseUrl + 'p131_ecommerce_more_api_31.php');
    http.Client client = http.Client();
    try {
      http.Response response = await client.post(url, body: {
        'whattodo': 'insert_31',
        'k1': 'bi.com',
        'k2': 'bi.com',
        'k3': 'bi.com',
        'i1': id,
        'i2': '-',
        'i3': quantity,
        'i4': note,
      });

      print(response.statusCode);

      if (response.statusCode != 200) {
        throw FailedSubmitProduct();
      }

      final data = jsonDecode(response.body)['rs'] as List;

      return ApiReturnValue(
        data: data.first['pesan'],
      );
    } catch (e) {
      throw FailedSubmitProduct();
    } finally {
      client.close();
    }
  }

  static Future<String> addToCard({
    required String id,
    String quantity = '1',
    String description = 'desc',
  }) async {
    final Uri url = Uri.parse(baseUrl + 'p341_ecommercemid_api_21.php');

    try {
      http.Response response = await http.post(url, body: {
        'whattodo': 'sys_shop_detail_addtocart',
        'k1': 'bi.com',
        'k2': 'bi.com',
        'k3': 'bi.com',
        'k4': 'bi.com',
        'k5': 'bi.com',
        'i1': id,
        'i2': quantity,
        'i3': description,
      });

      if (response.statusCode != 200) {
        throw FailedAddToCart();
      }

      final data = jsonDecode(response.body)['rs'] as List;

      return data.first['pesan'];
    } catch (e) {
      throw FailedAddToCart();
    }
  }

  static Future<String> addToFavorite({
    required String id,
    String liked = '0',
  }) async {
    final Uri url = Uri.parse(baseUrl + 'p341_ecommercemid_api_22.php');

    try {
      http.Response response = await http.post(url, body: {
        'whattodo': 'sys_shop_detail_favorite',
        'k1': 'bi.com',
        'k2': 'bi.com',
        'k3': 'bi.com',
        'k4': 'bi.com',
        'k5': 'bi.com',
        'i1': id,
        'i2': liked,
      });

      if (response.statusCode != 200) {
        throw FailedAddToCart();
      }

      final data = jsonDecode(response.body)['rs'] as List;

      return data.first['isfavorite'];
    } catch (e) {
      throw FailedAddToCart();
    }
  }
}

class FailedSubmitProduct implements Exception {}

class FailedAddToCart implements Exception {}
