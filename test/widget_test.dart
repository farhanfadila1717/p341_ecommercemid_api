import 'package:flutter_test/flutter_test.dart';
import '../lib/services/services.dart';
import '../lib/models/models.dart';

void main() {
  group('Auth test', () {
    late RegisterUserModel registerUserModel;

    setUpAll(() {
      registerUserModel = RegisterUserModel(
        name: 'Test 2021',
        hp: '089512313111',
        email: 'abogaboga123@gmail.com',
        address: 'Jakarta dsadsasdasd',
        reffcode: 'asdaafafaf',
        password: 'asasdasdasd',
      );
    });

    test('Signin', () async {
      final response =
          await AuthServices.signIn('ivan.siregar@gmail.com', 'ivan.siregar');

      print(response.data);
    });
    test('SignUp', () async {
      final response = await AuthServices.signUp(registerUserModel);

      print(response.message);
    });
    test('Forgot', () async {
      final response =
          await AuthServices.forgotPassword('ivan.siregar@gmail.com');

      print(response.data);
    });
  });

  group('Content Services Test', () {
    test('Get all product', () async {
      final result = await ContentServices.getAllDummyProduct();

      result.data.forEach((element) {
        print(element.category);
      });
    });
  });
  group('Content Services Test', () {
    test('Get all shop', () async {
      final result = await ContentServices.getAllDummyShop();

      result.data.forEach((element) {
        print(element.category);
      });
    });
  });
  group('Content Services Test', () {
    test('Get shop detail', () async {
      final result = await ContentServices.getShopDetail('2');

      print(result.data.toString());
    });
  });

  group('Submit Services Test', () {
    test('Add to cart', () async {
      final result = await SubmitServices.addToCard(id: '1');

      print(result);
    });
    test('Add to Favorite', () async {
      final result = await SubmitServices.addToFavorite(id: '1');

      print(result);
    });
  });
}
