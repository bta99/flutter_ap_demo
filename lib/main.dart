import 'package:demo_retrofit_api/gen/assets.gen.dart';
import 'package:demo_retrofit_api/screens/homePage/home_page.dart';
import 'package:demo_retrofit_api/screens/list/list.dart';
import 'package:demo_retrofit_api/screens/setting/setting.dart';
import 'package:demo_retrofit_api/theme/color.dart';
import 'package:demo_retrofit_api/widget/bottom_NavigationBar/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'screens/account/account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AutomaticKeepAliveClientMixin {
  late HomePageLogic logic;
  String id = "cb4e42e8-80b4-4bfb-802e-b0f73bd59690";
  @override
  void initState() {
    super.initState();
    logic = HomePageLogic(context: context);
    initNoti();
  }

  void initNoti() async {
    await OneSignal.shared.setAppId(id);
    await OneSignal.shared
        .getDeviceState()
        .then((value) => print(value!.userId));
  }

  @override
  void dispose() {
    logic.dispose();
    super.dispose();
  }

  List<Widget> page = const [
    MyHomePage(),
    AccountScreen(),
    SettingScreen(),
    ListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ChangeNotifierProvider.value(
          value: logic,
          child: Scaffold(
            appBar: AppBar(
              leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.textBlue,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Assets.icon.avatar.path),
                    ),
                  )),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Selector<HomePageLogic, String>(
                selector: (_, state) => state.title,
                builder: (_, value, __) {
                  return Text(
                    logic.title,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: AppColors.textBlue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                          fontFamily: Assets.fonts.montserratBold,
                        ),
                  );
                },
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_on_rounded,
                      color: AppColors.acne2,
                    ))
              ],
            ),
            body: Selector<HomePageLogic, Tuple2<int, PageController>>(
              selector: (_, state) => Tuple2(state.index, state.controller),
              builder: (_, value, __) {
                // return IndexedStack(
                //   index: value,
                //   children: page,
                // );
                return PageView(
                  children: page,
                  controller: value.item2,
                  onPageChanged: (index) {
                    logic.changeIndex(index);
                  },
                );
              },
            ),
            bottomNavigationBar: CustomBottomNavigation(),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
