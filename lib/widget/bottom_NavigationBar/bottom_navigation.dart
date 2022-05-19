import 'package:demo_retrofit_api/gen/assets.gen.dart';
import 'package:demo_retrofit_api/screens/homePage/home_page.dart';
import 'package:demo_retrofit_api/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  late HomePageLogic homePageLogic;

  @override
  void initState() {
    super.initState();
    homePageLogic = context.read<HomePageLogic>();
  }

  @override
  void dispose() {
    homePageLogic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageLogic, int>(
      selector: (_, state) => state.index,
      builder: (_, value, __) {
        return Container(
          height: 60,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 173, 171, 171), blurRadius: 5)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  homePageLogic.changeIndex(0);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary),
                        color: value == 0
                            ? AppColors.primary
                            : AppColors.transparent,
                      ),
                      child: Icon(
                        Icons.multitrack_audio_outlined,
                        color: value == 0 ? AppColors.white : AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Trang chủ',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: AppColors.primary,
                            fontFamily: Assets.fonts.montserratBold,
                            fontWeight: value == 0 ? FontWeight.bold : null,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  homePageLogic.changeIndex(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary),
                        color: value == 1
                            ? AppColors.primary
                            : AppColors.transparent,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: value == 1 ? AppColors.white : AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Tài khoản',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: AppColors.primary,
                            fontFamily: Assets.fonts.montserratBold,
                            fontWeight: value == 1 ? FontWeight.bold : null,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  homePageLogic.changeIndex(2);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary),
                        color: value == 2
                            ? AppColors.primary
                            : AppColors.transparent,
                      ),
                      child: Icon(
                        Icons.settings_outlined,
                        color: value == 2 ? AppColors.white : AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Cài đặt',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: AppColors.primary,
                            fontFamily: Assets.fonts.montserratBold,
                            fontWeight: value == 2 ? FontWeight.bold : null,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  homePageLogic.changeIndex(3);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary),
                        color: value == 3
                            ? AppColors.primary
                            : AppColors.transparent,
                      ),
                      child: Icon(
                        Icons.library_books_rounded,
                        color: value == 3 ? AppColors.white : AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Danh sách',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: AppColors.primary,
                            fontFamily: Assets.fonts.montserratBold,
                            fontWeight: value == 3 ? FontWeight.bold : null,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
