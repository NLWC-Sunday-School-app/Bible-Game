import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_bible_game/features/home/widget/modals/create_profile_modal.dart';
import 'package:the_bible_game/features/home/widget/modals/login_modal.dart';
import 'package:the_bible_game/shared/constants/image_routes.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:the_bible_game/shared/widgets/blue_button.dart';

import '../../../../shared/features/settings/bloc/settings_bloc.dart';

void showAuthModal(BuildContext context) {
  final soundManager = context.read<SettingsBloc>().soundManager;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        backgroundColor: Colors.transparent,
        insetAnimationCurve: Curves.easeIn,
        insetAnimationDuration: const Duration(milliseconds: 500),
        child: SizedBox(
          height: 500.h,
          width: 500.w,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ProductImageRoutes.modalBg),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                GestureDetector(
                  onTap: (){
                    soundManager.playClickSound();
                    Navigator.pop(context);
                    },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          IconImageRoutes.closeModal,
                          width: 35.w,
                        )
                      ],
                    ),
                  ),
                ),
                StrokeText(
                  text: 'Your Profile',
                  textStyle: TextStyle(
                    color: const Color(0xFF1768B9),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  strokeColor: Colors.white,
                  strokeWidth: 5,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Log in to your profile to save \n& continue your game play.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mikado',
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                BlueButton(
                  width: 250.w,
                  buttonText: 'Login',
                  buttonIsLoading: false,
                  onTap: () {
                    soundManager.playClickSound();
                    Navigator.pop(context);
                    showLoginModal(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlueButton(
                  width: 250.w,
                  buttonText: 'Create Profile',
                  buttonIsLoading: false,
                  onTap: () {
                    soundManager.playClickSound();
                    Navigator.pop(context);
                    showCreateProfileModal(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                soundManager.playClickSound();
                                context.read<SettingsBloc>().add(ToggleSound());
                              },
                              child: Image.asset(
                                state.isSoundOn
                                    ? IconImageRoutes.soundOn
                                    : IconImageRoutes.soundOff,
                                width: 50.w,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  soundManager.playClickSound();
                                  context.read<SettingsBloc>().add(ToggleMusic());
                                },
                                child: Image.asset(
                                  state.isMusicOn
                                      ? IconImageRoutes.musicOn
                                      : IconImageRoutes.musicOff,
                                  width: 50.w,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  soundManager.playClickSound();
                                  context
                                      .read<SettingsBloc>()
                                      .add(ToggleNotification());
                                },
                                child: Image.asset(
                                  state.isNotificationOn
                                      ? IconImageRoutes.notificationOn
                                      : IconImageRoutes.notificationOff,
                                  width: 50.w,
                                )),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}