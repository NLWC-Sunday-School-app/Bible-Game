import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';


class OptionButton extends StatelessWidget {
  const OptionButton({super.key, required this.text, required this.index, required this.onTap, this.isCorrect, required this.isSelected, required this.correctAnswer, required this.hasAnswered});

  final String text;
  final String correctAnswer;
  final int index;
  final bool? isCorrect;
  final bool isSelected;
  final VoidCallback onTap;
  final bool hasAnswered;

  @override
  Widget build(BuildContext context) {
    List<String> labels = ['A', 'B', 'C', 'D'];
    Color backgroundColor = Colors.white;
    Color textColor = Color(0xFF22210D);

    if (hasAnswered) {
       if(text == correctAnswer){
         backgroundColor = Color(0xFFA0E00A);
       }else if(isCorrect == false){
         backgroundColor = Color(0xFFB30C0C);
         textColor = Colors.white;
       }else{
         backgroundColor = Colors.white;
       }
    }
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Container(
          margin: EdgeInsets.only(bottom: 10.h),
          width: double.infinity,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(8.r)),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle),
                child: Text(
                  labels[index],
                  style: TextStyle(fontSize: 12.sp,  fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}