import 'package:flutter/material.dart';

import '../utils/app_constants.dart';
import 'new_design_widgets.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String) onChanged;

  const CustomSearchField({
    Key? key,
    required this.searchController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded( // Wrap the Container with Expanded
          child: Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 13),
            decoration: BoxDecoration(
              color: AppConstants.offWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: searchController,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.search_rounded,
                  color: AppConstants.hintColor,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: AppConstants.hintColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
