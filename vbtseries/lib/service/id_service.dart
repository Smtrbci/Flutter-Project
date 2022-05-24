import '../model/id_model.dart';
import 'package:http/http.dart' as http;

class IdService {
  Future<IdModel?> getIds(String? id) async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/3"));

    if (response.statusCode == 200) {
      return idModelFromJson(response.body);
    } else {
      throw Exception("Hatali");
    }
  }
}