import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/auth_services.dart';
import '../../ui/pages/main_page/main_page.dart';
import '../../ui/pages/sign_up_page/sign_up_page.dart';
import '../../models/models.dart';
import '../product/product_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<String> getLastToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    try {
      return sharedPreferences.getString('lastSession') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<bool> setLastToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    try {
      return sharedPreferences.setString('lastSession', token);
    } catch (e) {
      return false;
    }
  }

  void getLastSessionUser(BuildContext context) async {
    final result = await getLastToken();
    await Future.delayed(const Duration(seconds: 3));
    if (result.isEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignUpPage()));
      emit(AuthInitial());
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
          (route) => false);
      BlocProvider.of<ProductCubit>(context).getAllProduct();
      emit(
        SuccessGetAuth(
          user: UserModel(result, 'dummyName'),
        ),
      );
    }
  }

  void signIn(BuildContext context, String email, String password) async {
    try {
      final result = await AuthServices.signIn(email, password);
      if (result.data is UserModel) {
        await setLastToken(result.data.token);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
            (route) => false);
        BlocProvider.of<ProductCubit>(context).getAllProduct();
        emit(SuccessGetAuth(user: result.data));
      } else {
        emit(FailedGetAuth());
        throw Exception();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Gagal login')));
      emit(FailedGetAuth());
      throw Exception(e);
    }
  }

  void signUp(BuildContext context, RegisterUserModel registerUser) async {
    try {
      final result = await AuthServices.signUp(registerUser);
      if (result.data is UserModel) {
        if (result.message!.contains('gunakan')) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Register Gagal, User sudah pernah terdaftar')));
          emit(FailedGetAuth());
        } else {
          await setLastToken(result.data.token);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Register Berhasil, Silahkan Periksa Email Anda')));
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
              (route) => false);
          BlocProvider.of<ProductCubit>(context).getAllProduct();
          emit(SuccessGetAuth(user: result.data));
        }
      } else {
        emit(FailedGetAuth());
        throw Exception();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Register Gagal, User sudah pernah terdaftar')));
      emit(FailedGetAuth());
      throw Exception(e);
    }
  }

  void signOut(BuildContext context) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.remove('lastSession');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignUpPage()),
        (route) => false);
    emit(AuthInitial());
  }

  void forgot(BuildContext context, String email) async {
    try {
      final response = await AuthServices.forgotPassword(email);

      if (response.data.contains('tidak')) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Recovery Gagal, Email tidak terdaftar')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Recovery Berhasil, Silahkan Periksa Email Anda')));
        Navigator.pop(context);
      }

      emit(AuthInitial());
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Upss! error..')));
      emit(FailedForgotPassword());
      throw Exception(e);
    }
  }
}
