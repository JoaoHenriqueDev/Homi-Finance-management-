import 'package:flutter/material.dart';
import '../models/group_model.dart';
import '../services/group_service.dart';

class GroupProvider extends ChangeNotifier {
  List<Group> groups = [];
  bool isLoading = false;

  Future<void> loadGroups() async {
  isLoading = true;
  notifyListeners();

  try {
    groups = await GroupService.getMyGroups();
    print('TOTAL DE GRUPOS: ${groups.length}');
  } catch (e) {
    print('ERRO: $e');
  }

  isLoading = false;
  notifyListeners();
}
}
