import 'package:demo_retrofit_api/Models/post/post_data.dart';
import 'package:demo_retrofit_api/Models/postPlaceholder/post_placeholder.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'post.g.dart';

@RestApi()
abstract class BlogDetailPersonalService {
  factory BlogDetailPersonalService(Dio dio, {required String baseUrl}) {
    dio.options = BaseOptions(contentType: 'application/json',
        /* If needed headers */
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vc2QtYXBpLnBpeGVsY2VudC5jb20vdjIvbG9naW4iLCJpYXQiOjE2NTI2MjA0OTYsImV4cCI6MTY2ODE3MjQ5NiwibmJmIjoxNjUyNjIwNDk2LCJqdGkiOiIzbHBDbmRETERFQ005TDN4Iiwic3ViIjoyMjksInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.kHB1kxnSpdLaBuMflq0jblVk9e3QYxCBO1hlWnYu73M',
          'X-ApiKey': 'ZGslzIzEyMw==',
          'Content-Type': 'application/json'
        });

    return _BlogDetailPersonalService(dio, baseUrl: baseUrl);
  }

  @GET("/posts")
  Future<PostData> getPost(@Query('type') String type);

  @GET('/posts')
  Future<List<PostPlaceHolder>> getPostPlaceholder();
}
