import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import '../../../shared/shared.dart';
import '../../../extensions/extensions.dart';
import '../forgot_password_page/forgot_password_page.dart';

part 'components/modal_change_password.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController _nameController = TextEditingController();
  FocusNode focusNode = FocusNode();

  bool _isNameError = false;
  bool _isSales = true;
  bool _isArival = false;
  bool _isDeliveryStatus = false;

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.red,
      title: 'Setting Page',
      child: Scaffold(
        appBar: AppBar(
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
                'Settings',
                style: titleStyle,
              ),
              const Padding(padding: const EdgeInsets.only(top: 16)),
              Text(
                'Personal information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Padding(padding: const EdgeInsets.only(top: 10)),
              CustomTextField(
                controller: _nameController,
                onChanged: (input) {
                  if (input.length > 1 && !_isNameError) {
                    setState(() {
                      _isNameError = true;
                    });
                  }
                  if (input.length > 4 && _isNameError) {
                    setState(() {
                      _isNameError = false;
                    });
                  }
                  if (input.isEmpty && _isNameError) {
                    setState(() {
                      _isNameError = false;
                    });
                  }
                },
                isError: _isNameError,
              ),
              const Padding(padding: const EdgeInsets.only(top: 16)),
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date of birth',
                      style: labelStyle,
                    ),
                    const Padding(padding: const EdgeInsets.only(top: 4)),
                    Text(DateTime(2000, 9, 3).toDmY),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                        ),
                        builder: (BuildContext context) {
                          return ModalChangePassoword();
                        },
                      );
                    },
                    child: const Text(
                      'Change',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: labelStyle,
                    ),
                    const Padding(padding: const EdgeInsets.only(top: 4)),
                    Text('********'),
                  ],
                ),
              ),
              const Padding(padding: const EdgeInsets.only(top: 16)),
              Text(
                'Notification',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Padding(padding: const EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text('Sales'),
                  Spacer(),
                  CupertinoSwitch(
                      value: _isSales,
                      onChanged: (value) {
                        setState(() {
                          _isSales = value;
                        });
                      }),
                ],
              ),
              const Padding(padding: const EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text('New arrivals'),
                  Spacer(),
                  CupertinoSwitch(
                      value: _isArival,
                      onChanged: (value) {
                        setState(() {
                          _isArival = value;
                        });
                      }),
                ],
              ),
              const Padding(padding: const EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text('Delivery status changes'),
                  Spacer(),
                  CupertinoSwitch(
                      value: _isDeliveryStatus,
                      onChanged: (value) {
                        setState(() {
                          _isDeliveryStatus = value;
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
