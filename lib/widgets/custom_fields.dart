import '/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../utils/config.dart';

class CustomTextFild extends StatelessWidget {
  String hint;
  TextEditingController controller;
  bool obscureText;
  TextInputType keyboardType;
  Color color;
  bool multiline;
  CustomTextFild(
      {super.key,
      required this.hint,
      required this.controller,
      required this.color,
      this.multiline = false,
      this.obscureText = false,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          multiline ? fullHeight(context) * 0.2 : fullHeight(context) * 0.05,
      padding: EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.03),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color:
                  color == Colors.white ? Colors.black : Colors.transparent)),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: multiline ? TextInputType.multiline : keyboardType,
        maxLines: multiline ? 5 : 1,
        decoration: InputDecoration(
          hintText: hint.tr,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
        ),
      ),
    );
  }
}

class CustomSearchTextFild extends StatelessWidget {
  TextEditingController controller;

  CustomSearchTextFild({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.05),
      child: Container(
        height: fullHeight(context) * 0.04,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 226, 224, 224),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "search".tr,
              prefixIcon: const Icon(Icons.search),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFild2 extends StatelessWidget {
  String title;
  TextEditingController controller;
  bool isNote;
  bool isDate;
  bool isTime;
  CustomTextFild2({
    super.key,
    required this.title,
    required this.controller,
    this.isNote = false,
    this.isDate = false,
    this.isTime = false,
  });

  _pickDate(context) async {
    return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light().copyWith(
                  primary: AppConstants.primaryColor, // Set the primary color
                  onPrimary:
                      Colors.white, // Set the text color on the primary color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        AppConstants.primaryColor, // Set the button text color
                  ),
                )),
            child: child!,
          );
        }).then((selectedDate) {
      if (selectedDate != null) {
        controller.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      }
    });
  }

  _pickTime(context) async {
    TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        useRootNavigator: false,
        builder: (BuildContext context, Widget? child) {
          //  data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light().copyWith(
                  primary: AppConstants.primaryColor, // Set the primary color
                  onPrimary:
                      Colors.white, // Set the text color on the primary color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        AppConstants.primaryColor, // Set the button text color
                  ),
                )),
            child: child!,
          );
        });
    if (picked != null) {
      controller.text = picked.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.06),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: fullWidth(context) * 0.05,
                height: fullWidth(context) * 0.05,
                decoration: const BoxDecoration(
                    color: AppConstants.primaryColor, shape: BoxShape.circle),
              ),
              SizedBox(
                  height: isNote
                      ? fullHeight(context) * 0.18
                      : fullHeight(context) * 0.08,
                  child: const VerticalDivider(
                      thickness: 1.5, color: Colors.white))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              SizedBox(height: fullHeight(context) * 0.01),
              Container(
                width: fullWidth(context) * 0.75,
                height: isNote
                    ? fullHeight(context) * 0.15
                    : fullHeight(context) * 0.045,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTap: isDate
                        ? () => _pickDate(context)
                        : isTime
                            ? () => _pickTime(context)
                            : null,
                    controller: controller,
                    readOnly: isDate || isTime,
                    maxLines: isNote ? 5 : 1,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomPhoneField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Color color;

  CustomPhoneField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.color,
    required TextInputType keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
            color: color == Colors.white ? Colors.black : Colors.transparent),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        maxLength: 8,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          hintText: hint.tr,
          counterText: "",
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          errorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value != null &&
              value.isNotEmpty &&
              (value[0] != '2' && value[0] != '3' && value[0] != '4')) {
            return 'Please enter a valid phone number';
          }
          if (value != null && value.length == 8) {
            int? phoneValue = int.tryParse(value);
            if (phoneValue == null ||
                phoneValue < 20000000 ||
                phoneValue > 49999999) {
              return 'Please enter a valid phone number between 20000000 and 49999999';
            }
          }
          return null;
        },
      ),
    );
  }
}
