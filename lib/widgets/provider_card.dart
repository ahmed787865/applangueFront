import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';

import '../model/provider.dart';
import '../utils/app_constants.dart';

class ProviderCard extends StatelessWidget {
  final Provider provider;
  final VoidCallback onTap;
  final VoidCallback notifyCallback;

  const ProviderCard({super.key, required this.provider, required this.onTap, required this.notifyCallback});

    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                    height: 100,
                    width: 90,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Image.network(provider.image!, fit: BoxFit.cover,)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(provider.name, style: const TextStyle(color: Colors.black, fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(CarbonIcons.star_filled, color: AppConstants.primaryColor, size: 14,),
                            const SizedBox(width: 8,),
                            Text("${provider.ranking}", style: const TextStyle(color: Colors.grey, fontSize: 12),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          children: [
                            const Icon(CarbonIcons.location, size: 14, color: AppConstants.primaryColor,),
                            const SizedBox(width: 8,),
                            Text("${provider.distance}", style: const TextStyle(color: Colors.black),),
                            const SizedBox(width: 3,),
                            const Text("Km", style: TextStyle(color: Colors.grey, fontSize: 12),),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [

                     Container(
                       padding: const EdgeInsets.all(8),
                       width: 71,
                       decoration: BoxDecoration(
                           color: AppConstants.primaryColor.withOpacity(0.4),
                           borderRadius: BorderRadius.circular(8)
                       ),
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text("${provider.price}"),
                           const SizedBox(width: 4,),
                           const Text("MRU", style: TextStyle(color: Colors.grey, fontSize: 8),),
                         ],
                       ),
                     ),
                     const SizedBox(height: 16,),
                     MaterialButton(
                         onPressed: notifyCallback,
                         elevation: 0,
                         minWidth: 71,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                         color: AppConstants.primaryColor.withBlue(120).withOpacity(0.4),
                         child: const Text("Choose", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),))
                   ],
                 )
              ],
            ),
          ),
        ),
      );
  }
}
