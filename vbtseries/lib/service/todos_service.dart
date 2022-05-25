import '../model/todos_model.dart';
import 'package:http/http.dart' as http;

class ToDosService {
  Future<List<ToDosModel>> fetchPost() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      return toDosModelFromJson(response.body);
    } else {
      throw Exception("Hatali");
    }
  }
}