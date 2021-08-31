class PaymentMethodModel {
  final String idCard;
  final String name;
  final DateTime experied;
  final Bank bank;

  const PaymentMethodModel(this.idCard, this.name, this.experied, this.bank);
}

enum Bank { visa, mastercard }

final List<PaymentMethodModel> myCreditCard = [
  PaymentMethodModel(
      '4231-2123-3123-9912', 'Jenifer', DateTime(2022, 12, 29), Bank.mastercard),
  PaymentMethodModel(
      '4231-2123-3123-1236', 'Jhon', DateTime(2023, 12, 23), Bank.visa),
];
