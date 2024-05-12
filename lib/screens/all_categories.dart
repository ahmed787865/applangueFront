import 'dart:convert';

import 'package:applanguefront/model/category.dart';
import 'package:applanguefront/model/icon_info.dart';
import 'package:applanguefront/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_constants.dart';
import '../utils/network.dart';
import '../utils/preferences_manager.dart';
import '../utils/variables.dart';
import '../widgets/new_design_widgets.dart';
import 'auth/login_screen.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              CustomAppBar(
                title: ' listes categories ',
                leadingIcon: SmallCustomContainer(
                    onTap: () => Get.to(LoginScreen()),
                    width: 33,
                    height: 33,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                      color: AppConstants.hintColor,
                    )),
              ),
              const SizedBox(height: 30),
              _categoriesWidget()
            ],
          ),
        ),
      ),
    );
  }

  _categoriesWidget() {
    return FutureBuilder<List<Category>>(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("No data available."),
          );
        }

        List<Category> categories = snapshot.data!;

        return GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: categories.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 15,
              childAspectRatio: 1 * 1 / 1.1),
          itemBuilder: (context, index) {
            Category category = categories[index];
            IconInfo iconInfo = getIconInfo(category.name!);

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallCustomContainer(
                  onTap: () {
                    if (category.is_leaf == true) {
                      print("leaf");
                    } else {
                      Get.to(() => SignUpScreen(
                          ));
                    }
                  },
                  width: 60,
                  height: 60,
                  icon: Icon(iconInfo.iconData,
                      color: iconInfo.color), // Use the Icon widget here
                ),
                Text(
                  category.name!,
                  style: TextStyle(
                      color: AppConstants.hintColor,
                      fontWeight: FontWeight.w300),
                )
              ],
            );
          },
        );
      },
    );
  }

  Future<List<Category>> fetchCategories() async {
    try {
      var response = await Network().getDataAsGuest(Variables.CATEGORIES);
      print("statusCode: " + response.statusCode.toString());
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new Category.fromJson(data)).toList();
      } else if (response.statusCode == 401) {
        PreferencesManager.clear();
        Get.off(LoginScreen());
        return Future.error("error".tr);
      } else
        return Future.error("error".tr);
    } catch (e) {
      print("my error: " + e.toString());
      return Future.error("error".tr);
    }
  }

IconInfo getIconInfo(String iconName) {
    switch (iconName) {
        case 'Education':
            return IconInfo(iconData: Icons.school, color: Colors.blue);
        case 'Health':
            return IconInfo(iconData: Icons.local_hospital, color: Colors.red);
        case 'Delivery':
            return IconInfo(iconData: Icons.delivery_dining, color: Colors.purple);
        case 'Masonry':
            return IconInfo(iconData: Icons.foundation, color: Colors.brown);
        case 'Plomber':
            return IconInfo(iconData: Icons.plumbing, color: Colors.teal);
        case 'Painting':
            return IconInfo(iconData: Icons.format_paint, color: Colors.pink);
        case 'Repairing':
            return IconInfo(iconData: Icons.build, color: Colors.grey);
        case 'Cleaning':
            return IconInfo(iconData: Icons.cleaning_services, color: Colors.lime);
        case 'Electricity':
            return IconInfo(iconData: Icons.electrical_services, color: Colors.indigo);
        case 'Mechanic':
            return IconInfo(iconData: Icons.engineering, color: Colors.amber);
        case 'Electronic':
            return IconInfo(iconData: Icons.memory, color: Colors.cyan);
        default:
            return IconInfo(iconData: Icons.error, color: Colors.black); // Default case
    }
}

}
