part of '../setting_page.dart';

class ModalChangePassoword extends StatefulWidget {
  const ModalChangePassoword({
    Key? key,
  }) : super(key: key);

  @override
  _ModalChangePassowordState createState() => _ModalChangePassowordState();
}

class _ModalChangePassowordState extends State<ModalChangePassoword> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _retypePasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      child: SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: 100,
                      height: 5,
                      child: const DecoratedBox(
                          decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Password Change',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Padding(padding: const EdgeInsets.only(top: 16)),
                CustomTextField(
                  controller: _oldPasswordController,
                  label: 'Old password',
                  hint: 'Input your last password',
                  obscureText: true,
                  onChanged: (input) {},
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: Text('Forgot password?'),
                  ),
                ),
                const Padding(padding: const EdgeInsets.only(top: 10)),
                CustomTextField(
                  controller: _passwordController,
                  label: 'New password',
                  hint: 'Input your password',
                  obscureText: true,
                  onChanged: (input) {},
                ),
                const Padding(padding: const EdgeInsets.only(top: 16)),
                CustomTextField(
                  controller: _retypePasswordController,
                  label: 'Repeat password',
                  hint: 'Input your password',
                  obscureText: true,
                  errorMessange: 'Please field same password',
                  onChanged: (input) {},
                  isError: _retypePasswordController.text !=
                      _passwordController.text,
                ),
                const Padding(padding: const EdgeInsets.only(top: 20)),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: CustomFlatButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: 'SAVE PASSWORD',
                  ),
                ),
                const Padding(padding: const EdgeInsets.only(top: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
