import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../shared/shared.dart';
import '../../../models/models.dart';
import '../../../extensions/extensions.dart';
import '../../widgets/widgets.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  _PaymentMethodsPageState createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  String _defaultPayment = '4231212331239912';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment methods',
          style: TextStyle(color: blackColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          final PaymentMethodModel card = myCreditCard[index];

          return CreditCard(
            card: card,
            onTap: () {
              setState(() {
                _defaultPayment = card.idCard;
              });
            },
            isDefault: card.idCard == _defaultPayment,
          );
        },
        itemCount: myCreditCard.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            builder: (BuildContext context) {
              return ModalAddCreditCard();
            },
          );
        },
        backgroundColor: Colors.black,
        mini: true,
        child: Icon(Icons.add),
      ),
    );
  }
}

class ModalAddCreditCard extends StatefulWidget {
  const ModalAddCreditCard({
    Key? key,
  }) : super(key: key);

  @override
  _ModalAddCreditCardState createState() => _ModalAddCreditCardState();
}

class _ModalAddCreditCardState extends State<ModalAddCreditCard> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  bool _selectToDefault = true;

  @override
  void dispose() {
    _nameController.dispose();
    _cardNumberController.dispose();
    _cvvController.dispose();
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
                    'Add new card',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Padding(padding: const EdgeInsets.only(top: 16)),
                CustomTextField(
                  controller: _nameController,
                  label: 'Name on card',
                  onChanged: (_) {},
                ),
                const Padding(padding: const EdgeInsets.only(top: 10)),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  child: TextField(
                    controller: _cardNumberController,
                    inputFormatters: [
                      MaskedTextInputFormatter(
                          mask: 'xxxx xxxx xxxx xxxx', separator: ' '),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Input card number',
                      labelText: 'Card number',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      suffix: Image.asset(
                        'assets/icons/mastercard.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Padding(padding: const EdgeInsets.only(top: 10)),
                GestureDetector(
                  onTap: () async {
                    final result = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                    if (_selectedDate != result) {
                      setState(() {
                        _selectedDate = result ?? DateTime.now();
                      });
                    }
                  },
                  child: Container(
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
                          'Expry date',
                          style: labelStyle,
                        ),
                        const Padding(padding: const EdgeInsets.only(top: 4)),
                        Text(_selectedDate.tomY),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: const EdgeInsets.only(top: 10)),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  child: TextField(
                    controller: _cvvController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Input cvv',
                      labelText: 'CVV',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Transform.translate(
                  offset: Offset(-10, 0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _selectToDefault,
                        activeColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3)),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectToDefault = value ?? false;
                          });
                        },
                      ),
                      Text('Set as default payment method'),
                    ],
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

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
