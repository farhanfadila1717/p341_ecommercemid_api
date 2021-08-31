import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/auth/auth_cubit.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthCubit>(context)..getLastSessionUser(context);
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ECOMMERCE v1',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                wordSpacing: 1.2,
              ),
            ),
            const Padding(padding: const EdgeInsets.only(top: 60)),
            SizedBox.fromSize(
              size: Size.square(30),
              child: CircularProgressIndicator(),
            ),
            const Padding(padding: const EdgeInsets.only(top: 10)),
            Text('Loading..'),
          ],
        ),
      ),
    );
  }
}
