import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/auth/auth_cubit.dart';
import '../../../models/models.dart';
import '../../../shared/shared.dart';
import '../../../extensions/extensions.dart';
import '../../widgets/widgets.dart';
import '../login_page/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isEmailError = false, _isLoading = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberPhoneController = TextEditingController();
  TextEditingController _reffcodeController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberPhoneController.dispose();
    _reffcodeController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign up',
              style: titleStyle,
            ),
            const Padding(padding: const EdgeInsets.only(top: 50)),
            CustomTextField(
              controller: _nameController,
              hint: 'ex: Budi Syahputra',
              label: 'Name',
              onChanged: (input) {},
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            BlocListener<AuthCubit, AuthState>(
              listener: (BuildContext context, AuthState state) {
                if (state is FailedGetAuth) {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              child: const SizedBox.shrink(),
            ),
            CustomTextField(
              controller: _emailController,
              hint: 'ex: budi@gmail.com',
              label: 'Email',
              errorMessange:
                  'Please field with email format, ex: budi@gmail.com',
              onChanged: (input) {
                if (input.length > 4) {
                  if (_isEmailError && input.emailValidation) {
                    setState(() {
                      _isEmailError = false;
                    });
                  } else if (!_isEmailError && !input.emailValidation) {
                    setState(() {
                      _isEmailError = true;
                    });
                  }
                } else if (input.isEmpty && _isEmailError) {
                  setState(() {
                    _isEmailError = false;
                  });
                }
              },
              isError: _isEmailError,
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            CustomTextField(
              controller: _numberPhoneController,
              hint: 'ex: 621019142121',
              label: 'Phone number',
              type: TextInputType.phone,
              onChanged: (input) {},
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            CustomTextField(
              controller: _addressController,
              hint: 'ex: Chicago street',
              label: 'Address',
              type: TextInputType.streetAddress,
              onChanged: (input) {},
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            CustomTextField(
              controller: _reffcodeController,
              hint: 'ex: 1221F21',
              label: 'Reffcode',
              type: TextInputType.phone,
              onChanged: (input) {},
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            CustomTextField(
              controller: _passwordController,
              obscureText: true,
              label: 'Password',
              hint: 'Input your password',
              onChanged: (input) {},
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            Align(
              alignment: Alignment.topRight,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                icon: Text('Already have an account?'),
                label: Icon(
                  Icons.arrow_forward_rounded,
                  color: theme.primaryColor,
                ),
              ),
            ),
            BlocListener<AuthCubit, AuthState>(
              listener: (BuildContext context, AuthState state) {
                if (state is FailedGetAuth) {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              child: SizedBox(),
            ),
            Visibility(
              visible: _isLoading,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox.fromSize(
                  size: Size.square(30),
                  child: CircularProgressIndicator(),
                ),
              ),
              replacement: SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomFlatButton(
                  onTap: () {
                    final RegisterUserModel registerUser = RegisterUserModel(
                      name: _nameController.text,
                      hp: _numberPhoneController.text,
                      email: _emailController.text,
                      address: _addressController.text,
                      reffcode: _reffcodeController.text,
                      password: _passwordController.text,
                    );

                    BlocProvider.of<AuthCubit>(context)
                        .signUp(context, registerUser);
                    setState(() {
                      _isLoading = !_isLoading;
                    });
                  },
                  title: 'SIGN UP',
                ),
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 70)),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Or sign up with social account',
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/google.png'),
                ),
                const Padding(padding: const EdgeInsets.only(left: 30)),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/facebook.png'),
                ),
              ],
            ),
          ]..add(
              const Padding(padding: const EdgeInsets.only(top: 30)),
            ),
        ),
      ),
    );
  }
}
