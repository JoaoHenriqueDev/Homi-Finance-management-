import '../../../core/api/api_client.dart';
import '../models/group_model.dart';

class GroupService {
  static Future<List<Group>> getMyGroups() async {
    final response = await ApiClient.dio.get('/group');

    print('STATUS: ${response.statusCode}');
    print('DATA: ${response.data}');

    return (response.data as List)
        .map((e) => Group.fromJson(e))
        .toList();
  }
}

