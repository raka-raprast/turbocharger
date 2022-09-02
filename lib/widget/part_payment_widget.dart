import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:turbocharger/models/detail.dart';
import 'package:turbocharger/models/payment.dart';
import 'package:turbocharger/style/colors.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class PartPaymentWidget extends StatelessWidget {
  const PartPaymentWidget({Key? key, required this.payment}) : super(key: key);
  final Payment payment;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: yellow(), borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(payment.partNo!),
            Text(
              "WO ${payment.woNo}",
            ),
          ]),
          Text("Rp. ${payment.price}"),
          Text("${payment.qty}x")
        ],
      ),
    );
  }
}
