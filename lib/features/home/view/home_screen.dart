import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:the_bible_game/features/home/widget/game_card.dart';
import 'package:the_bible_game/features/home/widget/game_score_info.dart';
import 'package:the_bible_game/features/home/widget/global_challenge_countdown.dart';
import 'package:the_bible_game/features/home/widget/home_ads_slider.dart';
import 'package:the_bible_game/features/home/widget/sign_in_profile.dart';
import 'package:the_bible_game/shared/constants/app_routes.dart';
import 'package:the_bible_game/shared/constants/colors.dart';
import 'package:the_bible_game/shared/constants/image_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF548CD7),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ProductImageRoutes.homeScreenBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                image: DecorationImage(
                  image: AssetImage(ProductImageRoutes.patternBg),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentColor,
                    offset: Offset(0, 8),
                    blurRadius: 0,
                    spreadRadius: -2,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: screenHeight - (200.h + 10.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SignInProfile(),
                              GameScoreInfo(),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GlobalChallengeCountDown(),
                          SizedBox(
                            height: 10.h,
                          ),
                          GameCard(
                            bgColor: AppColors.primaryColor,
                            gameType: 'Quick Game',
                            gameText: 'Play on your own terms!',
                            gameImage: ProductImageRoutes.crossBible,
                            gameImageWidth: 100.w,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.quickGameHomeScreen);
                            },
                          ),
                          GameCard(
                            bgColor: AppColors.wiwGameCard,
                            gameType: 'Who is Who',
                            gameText: 'Learn Bible names & stories!',
                            gameImage: ProductImageRoutes.wiwMask,
                            gameImageWidth: 90.w,
                            onTap: () {
                               Navigator.pushNamed(context, AppRoutes.whoIsWhoHomeScreen);
                            },
                          ),
                          GameCard(
                            bgColor: AppColors.pilgrimProgressGameCard,
                            gameType: 'Pilgrim Progress',
                            gameText: 'Journey through the Bible!',
                            gameImage: ProductImageRoutes.mountain,
                            gameImageWidth: 75.w,
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.pilgrimProgressHomeScreen);
                            },
                          ),
                          GameCard(
                            bgColor: AppColors.fourScripturesGameCard,
                            gameType: '4 Scriptures, 1 Word',
                            gameText: 'Journey through the Bible!',
                            gameImage: ProductImageRoutes.scroll,
                            gameImageWidth: 80.w,
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.fourScriptureQuestionScreen);
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'BG Billboard',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1,
                                fontSize: 22.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                         HomeAdsSlider()
                        ],
                      ),
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
