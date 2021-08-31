import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../order_page/order_page.dart';
import '../payment_methods_page/payments_method_page.dart';
import '../../../cubits/auth/auth_cubit.dart';
import '../../../shared/shared.dart';
import '../setting_page/setting_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).signOut(context);
            },
            icon: Icon(
              Icons.search_rounded,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'My profile',
                style: titleStyle,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile/user-profile.jpeg'),
                    radius: 35,
                  ),
                  const Padding(padding: const EdgeInsets.only(left: 10)),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state is SuccessGetAuth
                                ? state.user.name
                                : 'Matilda Brown',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Padding(padding: const EdgeInsets.only(top: 4)),
                          Text(
                            'matilda.brown@gmail.com',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'My orders',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Already have 12 orders',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right_rounded,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderPage()));
              },
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'Shipping addresses',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '3 address',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right_rounded,
              ),
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'Payment methods',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'visa **23',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right_rounded,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentMethodsPage()));
              },
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'Promocodes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'You have special promocodes',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right_rounded,
              ),
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Notification, password',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right_rounded,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'Logout',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              onTap: () {
                BlocProvider.of<AuthCubit>(context).signOut(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
