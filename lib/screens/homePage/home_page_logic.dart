part of 'home_page.dart';

class HomePageLogic with ChangeNotifier {
  late BuildContext context;
  int index = 0;
  String title = 'Trang chủ';
  late PageController controller;
  HomePageLogic({required this.context}) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      getPost();
    });
    initController();
  }

  List<Post> data = [];
  BlogDetailPersonalService ser =
      BlogDetailPersonalService(Dio(), baseUrl: ConfigApi.baseUrl2);
  bool active = false;
  List<PostPlaceHolder> data2 = [];

  void initController() {
    controller = PageController(initialPage: 0);
    notifyListeners();
  }

  void getPost() async {
    // try {
    //   PostData res = await ser.getPost('cosmetics');
    //   data = res.data.data;
    //   notifyListeners();
    //   print(data.length);
    // } catch (e) {
    //   debugPrint(e.toString());
    //   print('faild');
    // }
    try {
      data2 = await ser.getPostPlaceholder();
      notifyListeners();
      print(data2.length);
    } catch (e) {
      debugPrint(e.toString());
      print('faild');
    }
  }

  void changeIndexBottom(index) {
    controller.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }

  void changeIndex(value) async {
    //change index screen
    index = value;
    index == 0
        ? title = "Trang chủ"
        : index == 1
            ? title = "Tài khoản"
            : index == 2
                ? title = "Cài đặt"
                : title = "Danh sách";
    notifyListeners();
    controller.jumpToPage(index);
    // if (index == 0 && active == false) {
    //   callBack();
    // }
  }

  void callBack() {
    //get post
    getPost();
    active = true;
    notifyListeners();
  }
}
