import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/cubits.dart';

import '../../../shared/shared.dart';
import '../../../extensions/extensions.dart';
import '../../widgets/widgets.dart';
import '../forgot_password_page/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isEmailError = false, _isLoading = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: titleStyle,
            ),
            const Padding(padding: const EdgeInsets.only(top: 50)),
            CustomTextField(
              controller: _emailController,
              hint: 'ex: budi@gmail.com',
              label: 'Email',
              type: TextInputType.emailAddress,
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
              controller: _passwordController,
              obscureText: true,
              label: 'Password',
              hint: 'Input your password',
              onChanged: (input) {},
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPassword(),
                    ),
                  );
                },
                icon: Text('Forgot your password?'),
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
              child: const SizedBox.shrink(),
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
                  title: 'Login',
                  onTap: () {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    BlocProvider.of<AuthCubit>(context)
                        .signIn(context, email, password);
                    setState(() {
                      _isLoading = true;
                    });
                  },
                ),
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 70)),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Or login with social account',
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
