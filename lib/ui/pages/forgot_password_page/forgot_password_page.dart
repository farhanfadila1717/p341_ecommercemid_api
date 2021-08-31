import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/auth/auth_cubit.dart';

import '../../../shared/shared.dart';
import '../../../extensions/extensions.dart';
import '../../widgets/widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isEmailError = false, _isLoading = false;

  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot password',
              style: titleStyle,
            ),
            const Padding(padding: const EdgeInsets.only(top: 50)),
            Text(
                'Please, enter your email address. You will receive a link to create a new password via email'),
            const Padding(padding: const EdgeInsets.only(top: 10)),
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
            const Padding(padding: const EdgeInsets.only(top: 16)),
            BlocListener<AuthCubit, AuthState>(
              listener: (BuildContext context, AuthState state) {
                setState(() {
                  _isLoading = false;
                });
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
                width: double.infinity,
                height: 50,
                child: CustomFlatButton(
                  onTap: () {
                    setState(() {
                      _isLoading = true;
                    });
                    BlocProvider.of<AuthCubit>(context)
                        .forgot(context, _emailController.text);
                  },
                  title: 'SEND',
                ),
              ),
            ),
          ]..add(
              const Padding(padding: const EdgeInsets.only(top: 30)),
            ),
        ),
      ),
    );
  }
}
