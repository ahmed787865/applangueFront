import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/payment_method.dart';

class PaymentOptionTile extends StatelessWidget {
  final PaymentMethod paymentMethod;

   PaymentOptionTile({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
        children: [
          Image.asset(paymentMethod.icon!, fit: BoxFit.cover,),
          Expanded(
              child: Column(
                children: [
                  Text(paymentMethod.name!),
                  Text(paymentMethod.code!),
                ],
              )
          ),

        ],

      ),
    );
  }
}
