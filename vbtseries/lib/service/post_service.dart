import 'package:http/http.dart' as http;
import '../model/post_model.dart';

class PostService {
  Future<List<PostModel>> fetchPost() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts?userId=1"));

    if (response.statusCode == 200) {
      return postModelFromJson(response.body);
    } else {
      throw Exception("Hatali");
    }
  }
}