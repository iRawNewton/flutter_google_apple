import 'dart:io';
import 'package:flutter/material.dart';
import 'package:goo_app_pay/payment_config.dart';
import 'package:pay/pay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String os = Platform.operatingSystem;

  var applePayButton = ApplePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
    onPaymentResult: (result) => debugPrint('$result'),
    paymentItems: const [
      PaymentItem(
        amount: '0.01',
        label: 'Item a',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        amount: '0.01',
        label: 'Item b',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        amount: '0.01',
        label: 'Item c',
        status: PaymentItemStatus.final_price,
      ),
    ],
    style: ApplePayButtonStyle.black,
    type: ApplePayButtonType.buy,
    width: double.infinity,
  );

  var googlePayButton = GooglePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
    // onPaymentResult: (result) => debugPrint('$result'),
    onPaymentResult: (result) {
      // if (result. == PaymentResultStatus.success) {}
    },
    paymentItems: const [
      PaymentItem(
        amount: '0.01',
        label: 'Item a',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        amount: '0.01',
        label: 'Item b',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        amount: '0.01',
        label: 'Item c',
        status: PaymentItemStatus.final_price,
      ),
    ],
    type: GooglePayButtonType.pay,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Platform.isIOS ? applePayButton : googlePayButton,
      ),
    );
  }
}
