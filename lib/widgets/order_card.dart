import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: const Image(image: AssetImage("assets/images/logo.png")),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mohamed Eid", style: TextStyle(color: Colors.black, fontSize: 16)),
                        Text("Plumbing", style: TextStyle(color: Colors.grey, fontSize: 12),)
                      ],
                    ),

                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    children: [
                      Icon(CarbonIcons.location, size: 14, color: AppConstants.primaryColor,),
                      SizedBox(width: 8,),
                      Text("1,5", style: TextStyle(color: Colors.black),),
                      SizedBox(width: 3,),
                      Text("Km", style: TextStyle(color: Colors.grey, fontSize: 12),),
                    ],
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("DATE", style: TextStyle(color: Colors.grey, fontSize: 10),),
                          Text("Dec 24")
                        ],
                      ),
                      SizedBox(width: 8,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("TIME", style: TextStyle(color: Colors.grey, fontSize: 10),),
                          Text("09:30")
                        ],
                      ),
                      SizedBox(width: 8,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("STATUS", style: TextStyle(color: Colors.grey, fontSize: 10),),
                          Text("Accepted")
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppConstants.primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("20000"),
                        SizedBox(width: 4,),
                        Text("MRU", style: TextStyle(color: Colors.grey, fontSize: 8),),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
