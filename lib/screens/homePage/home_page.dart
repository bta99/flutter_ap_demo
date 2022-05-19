import 'package:demo_retrofit_api/Models/post/post.dart';
import 'package:demo_retrofit_api/Models/post/post_data.dart';
import 'package:demo_retrofit_api/Models/postPlaceholder/post_placeholder.dart';
import 'package:demo_retrofit_api/Service/api/post/post.dart';
import 'package:demo_retrofit_api/helper/configApi.dart';
import 'package:demo_retrofit_api/widget/custom_loading/custom_loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
part 'home_page_logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // late HomePageLogic homepageLogic;
  // late AnimationController animationController;

  // @override
  // void initState() {
  //   super.initState();
  //   homepageLogic = context.read<HomePageLogic>();
  //   animationController =
  //       AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   homepageLogic.dispose();
  //   animationController.dispose();
  // }

  double width = 100;
  double height = 100;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // return ScreensItem(
    //   index: 0,
    //   item: Scaffold(
    //     body: Selector<HomePageLogic, List<Post>>(
    //       selector: (_, state) => state.data,
    //       builder: (_, value, __) {
    //         return value.isEmpty
    //             ? CustomLoading(controller: animationController)
    //             : ListView(
    //                 children: List.generate(value.length, (index) {
    //                   return Container(
    //                     width: double.infinity,
    //                     height: 50,
    //                     decoration: BoxDecoration(
    //                         image: DecorationImage(
    //                             image: NetworkImage(value[index].thumbnail))),
    //                     margin:
    //                         EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    //                   );
    //                 }),
    //               );
    //       },
    //     ),
    //   ),
    // );
    return Scaffold(
      body: Selector<HomePageLogic, List<PostPlaceHolder>>(
        selector: (_, state) => state.data2,
        builder: (_, value, __) {
          return value.isEmpty
              ? CustomLoading()
              : ListView(
                  children: List.generate(value.length, (index) {
                    return Text(value[index].title);
                  }),
                );
        },
      ),
    );
  }
}

class ScreensItem extends StatelessWidget {
  const ScreensItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final Widget? item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageLogic, int>(
      selector: (_, state) => state.index,
      builder: (_, value, __) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (_, animation) {
            //slide
            // return SlideTransition(
            //   position: animation.drive(
            //     Tween(begin: const Offset(1, 0), end: const Offset(0, 0)),
            //   ),
            //   child: _,
            // );
            return ScaleTransition(
              scale: animation,
              child: _,
            );
          },
          switchInCurve: Curves.decelerate,
          child: value == index
              ? Scaffold(
                  body: item,
                )
              : SizedBox(),
        );
      },
    );
  }
}
