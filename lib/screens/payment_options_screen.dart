import 'package:applanguefront/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../model/order.dart';
import '../model/payment_method.dart';
import '../utils/app_constants.dart';
import '../utils/config.dart';
import '../utils/preferences_manager.dart';
import '../widgets/appbar.dart';
import '../widgets/app_button.dart';

class PaymentOptionsScreen extends StatefulWidget {
  //final Order order;
  const PaymentOptionsScreen({super.key});

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  PaymentMethod? _selectedMethod;

  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(
        name: "Banki  ly", icon: "assets/images/bankily.png", code: "1234"),
    PaymentMethod(name: "Sedad", icon: "assets/images/sedad.png", code: "1234"),
    PaymentMethod(name: "BMCI", icon: "assets/images/masrvi.png", code: "1234"),
  ];

  _item({required String title, val, isUergent = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.08),
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: fullHeight(context) * 0.01,
              horizontal: fullWidth(context) * 0.05),
          decoration: BoxDecoration(
              color: isUergent
                  ? AppConstants.primaryColor
                  : const Color.fromARGB(255, 236, 233, 233),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  title.tr,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 122, 121, 121),
                    fontSize: fullWidth(context) * 0.03,
                  ),
                ),
              ),
              Text(val,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: fullWidth(context) * 0.047,
                      fontWeight: FontWeight.w600)),
              SizedBox(width: fullWidth(context) * 0.1),
            ],
          )),
    );
  }

  _paymentMode() {
    return Expanded(
      child: Column(
        children: _paymentMethods.map<Widget>((PaymentMethod method) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(
                horizontal: fullWidth(context) * 0.08,
                vertical: fullHeight(context) * 0.007),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                  color: Colors.grey,
                )),
            child: RadioListTile<PaymentMethod>(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: fullWidth(context) * 0.02),
                  Image(
                    image: AssetImage(method.icon!),
                    width: fullWidth(context) * 0.1,
                  ),
                  SizedBox(width: fullWidth(context) * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        method.name!,
                        style: TextStyle(
                            fontSize: fullWidth(context) * 0.04,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: fullHeight(context) * 0.006,
                      ),
                      Text(
                        method.code!,
                        style: TextStyle(
                            fontSize: fullWidth(context) * 0.03,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
              value: method,
              groupValue: _selectedMethod,
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: AppConstants.primaryColor,
              onChanged: (value) => setState(() => _selectedMethod = value!),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void initState() {
    WakelockPlus.enable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Payment Request"),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: fullHeight(context) * 0.02),
          Center(
            child: SizedBox(
              width: fullWidth(context) * 0.8,
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: TextStyle(
                      fontSize: fullWidth(context) * 0.042,
                      color: Colors.grey[800]),
                  children: [
                    const TextSpan(
                      text: 'Provider: ',
                    ),

                    const TextSpan(
                      text: ' has accepted your request for ',
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: fullHeight(context) * 0.022),
          Center(

          ),
          SizedBox(height: fullHeight(context) * 0.01),
          Center(
            child: RatingBarIndicator(
              //  rating: double.parse(widget.order.provider!.ranking ?? "0"),
                itemCount: 5,
                itemSize: 20,
                itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: AppConstants.primaryColor,
                    )),
          ),
          SizedBox(height: fullHeight(context) * 0.03),
         // _item(title: "Price", val: widget.order.provider!.price! + " MRU"),
          SizedBox(height: fullHeight(context) * 0.015),
          _item(
              title: "Distance", val: " Km"),
          SizedBox(height: fullHeight(context) * 0.015),
          _item(title: "Orders Count", val: "5"),
          SizedBox(height: fullHeight(context) * 0.02),
          Padding(
            padding: EdgeInsets.only(left: fullWidth(context) * 0.1),
            child: const Text("Payment - Mode"),
          ),
          SizedBox(height: fullHeight(context) * 0.01),
          _paymentMode(),
          SizedBox(height: fullHeight(context) * 0.02),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.12),
            child: AppButton(
                onPressed: _selectedMethod == null
                    ? null
                    : () => {
                          PreferencesManager.setPaymentMode(
                              _selectedMethod!.code!),
                          Get.to(() => SignUpScreen()),
                        },
                title: "Next",
                textColor: Colors.black,
                color: AppConstants.primaryColor),
          ),
          SizedBox(height: fullHeight(context) * 0.02),
        ],
      ),
    );
  }
}
