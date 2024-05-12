
import 'package:applanguefront/screens/tuto_screen.dart';
import 'package:applanguefront/view/auth/login_screen.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../controller /auth/home_screen_controller.dart';
import '../model/category.dart';
import '../model/icon_info.dart';
import '../utils/app_constants.dart';
import '../widgets/custom_search_field.dart';
import '../widgets/new_design_widgets.dart';


class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: CustomAppBar(
              title: "Welcome ${controller.username}!",
              playButton: InkWell(
                onTap: () {
                  (Get.to(() =>  const TutoScreen()));
                },
                child: Container(
                  height: 40,
                  width: 40,
                  child: const Icon(CupertinoIcons.play_fill),
                ),
              ),
              notificationButton: InkWell(
                onTap: () {
                  (Get.to(() => const LoginPage()));
                },
                child: Container(
                  height: 40,
                  width: 40,
                  child: const Icon(Icons.notifications_rounded),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: CustomSearchField(
              searchController: controller.searchController,
              onChanged: (newValue) {},
            ),
          ),

          // // search line
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 22.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: TypeAheadField(
          //           suggestionsCallback: (search) => controller.popularCategories
          //               .where((category) => category.name!.toLowerCase().contains(search.toLowerCase()))
          //               .toList(),
          //           builder: (context, controller, focusNode) {
          //             return TextField(
          //                 controller: controller,
          //                 focusNode: focusNode,
          //                 autofocus: true,
          //                 decoration: const InputDecoration(
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.all(Radius.circular(16)),
          //                     gapPadding: 8
          //                   ),
          //                   labelText: 'Search',
          //                 )
          //             );
          //           },
          //           itemBuilder: (context, suggestion) {
          //             return ListTile(
          //               title: Text(suggestion.name!),
          //               subtitle: Text(suggestion.name_ar!),
          //             );
          //           },
          //           onSelected: (category) {
          //            Get.to(SearchCategories(category: category));
          //           },
          //         ),
          //       )
          //
          //     ],
          //   ),
          // ),
          const SizedBox(height: 20),

          sliderWidget(),
          const SizedBox(height: 20),

          // popular categories
          ReUseRow(
            onTapSeeAll: () => Get.to(() => const LoginPage()),
            text: 'Explore Services',
            text2: 'See all',
          ),
          // popular products
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Obx(() => _categoriesWidget()),
          ),
          const SizedBox(height: 8),
          const ReUseRow(
            text: 'Most Popular Products',
            text2: 'See all',
          ),
          const SizedBox(height: 16),
          _popularProductsCard(),
          const SizedBox(height: 200),
        ],
      ),
    ));
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
        return IconInfo(
            iconData: Icons.electrical_services, color: Colors.indigo);
      case 'Mechanic':
        return IconInfo(iconData: Icons.engineering, color: Colors.amber);
      case 'Electronic':
        return IconInfo(iconData: Icons.memory, color: Colors.cyan);
      default:
        return IconInfo(
            iconData: Icons.error, color: Colors.yellow); // Default case
    }
  }

  _categoriesWidget() {
    return controller.popularCategories.isEmpty
        ? const CircularProgressIndicator(
            color: Colors.black,
            backgroundColor: Colors.white,
          )
        : GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: controller.popularCategories.length + 1,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 1,
                childAspectRatio: 1 * 1 / 1.1),
            itemBuilder: (context, index) {
              if(index < controller.popularCategories.length) {
                Category category = controller.popularCategories[index];
                IconInfo iconInfo = getIconInfo(category.name!);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallCustomContainer(
                      onTap: () {
                        if (category.is_leaf == true) {
                          print("leaf");
                        } else {
                          Get.to(() => LoginPage(
                          ));
                        }
                      },
                      width: 60,
                      height: 60,
                      icon: Icon(iconInfo.iconData, color: iconInfo.color),
                    ),
                    Text(
                      category.name!,
                      style: TextStyle(
                          color: AppConstants.hintColor,
                          fontWeight: FontWeight.w300),
                    ),

                  ],
                );
              }
              else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallCustomContainer(
                      onTap: () {
                        Get.to(() => const LoginPage());
                      },
                      width: 60,
                      height: 60,
                      icon: const Icon(CarbonIcons.arrow_right),
                    ),
                    Text(
                      "See More",
                      style: TextStyle(
                          color: AppConstants.hintColor,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                );
              }
            },
          );
  }

  Widget sliderWidget() {
    return Obx(
      () => controller.promoImagesUrls.isEmpty
          ? const CircularProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.white,
            )
          : Column(children: [
              CarouselSlider.builder(
                itemCount: controller.promoImagesUrls.length,
                // Use the length of imageUrls
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Image.network(controller.promoImagesUrls[index],
                            fit: BoxFit.fill), // Load the image from the URL
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  onPageChanged: (index, reason) {
                    controller.sliderCurrentIndex.value = index;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.promoImagesUrls.length,
                  (index) => Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.sliderCurrentIndex.value == index
                          ? const Color(0xFFFCC83A)
                          : const Color(0xFFE4E7EB),
                    ),
                  ),
                ),
              ),
            ]),
    );
  }

  _popularProductsCard() {
    List<bool> isAddToCartList = List.generate(4, (index) => false);
    List<bool> isAddToFavList = List.generate(4, (index) => false);

    return SizedBox(
      height: 191,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemExtent: 158,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          bool isAddToCart = isAddToCartList[index];
          bool isAddToFav = isAddToFavList[index];
          return GestureDetector(
            onTap: () {
              // PersistentNavBarNavigator.pushNewScreen(
              //   context,
              //   screen: const ProductDetailView(),
              //   withNavBar: false,
              // );
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetailView(),));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26.withOpacity(.1),
                            spreadRadius: 1.5,
                            blurRadius: 8,
                          )
                        ],
                      ),
                      child: AnimatedSwitcher(
                        reverseDuration: const Duration(seconds: 2),
                        duration: const Duration(seconds: 2),
                        child: isAddToCart
                            ? AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                height: 191,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Add to favourite",
                                      style: TextStyle(
                                        fontFamily: "SF Pro Display",
                                        fontSize: 13.879596710205078,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffaaaaaa),
                                        height: 22.027963638305664 /
                                            13.879596710205078,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Divider(),
                                    const Text(
                                      "Find similar",
                                      style: TextStyle(
                                        fontFamily: "SF Pro Display",
                                        fontSize: 13.879596710205078,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffaaaaaa),
                                        height: 22.027963638305664 /
                                            13.879596710205078,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: AppConstants.mainColorLight,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Spacer(),
                                          SvgPicture.asset(AppConstants.ranch),
                                          const SizedBox(height: 15),
                                          const Text(
                                            'Add to cart',
                                            style: TextStyle(
                                              color: Color(0xFF191818),
                                              fontSize: 15,
                                              fontFamily: 'SF Pro Display',
                                              fontWeight: FontWeight.w500,
                                              height: 0.07,
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : GridTile(
                                header: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          width: 60,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                              child: Text(
                                            '10% OFF',
                                            style: AppConstants
                                                .textStyle8w500halfBlack
                                                .copyWith(color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          ))),
                                      GestureDetector(
                                        onTap: () {
                                          isAddToFavList[index] =
                                              !isAddToFavList[index];
                                        },
                                        child: Icon(
                                            isAddToFav
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                footer: Container(
                                  height: 40,
                                  color: Colors.transparent,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 8,
                                        child: Text(
                                          'Product Name',
                                          style: AppConstants
                                              .textStyle14w400Black
                                              .copyWith(color: Colors.grey),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 10,
                                        bottom: 4,
                                        child: Text('3000 mun'),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            // Set all other indices to false
                                            for (int i = 0;
                                                i < isAddToCartList.length;
                                                i++) {
                                              if (i != index) {
                                                isAddToCartList[i] = false;
                                              }
                                            }

                                            // Toggle the clicked index
                                            isAddToCartList[index] =
                                                !isAddToCartList[index];
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color:
                                                  AppConstants.mainColorLight,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15),
                                              ),
                                            ),
                                            child: const Icon(Icons.add),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                    left: 8,
                                    top: 8,
                                    bottom: 40,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      index.isEven
                                          ? AppConstants.ranch
                                          : AppConstants.ranch,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Set all other indices to false
                        for (int i = 0; i < isAddToCartList.length; i++) {
                          if (i != index) {
                            isAddToCartList[i] = false;
                          }
                        }
                        // Toggle the clicked index
                        isAddToCartList[index] = !isAddToCartList[index];
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppConstants.mainColorLight,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Icon(
                            isAddToCart ? Icons.remove_rounded : Icons.add),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
