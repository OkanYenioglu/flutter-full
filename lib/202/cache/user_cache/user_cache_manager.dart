import 'dart:convert';
import 'package:flutter_full/202/cache/shared_manager.dart';
import 'package:flutter_full/202/cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> items) async {
    // Compute
    final _items = items.map((element) => jsonEncode(element)).toList();
    sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final itemString = sharedManager.getStrings(SharedKeys.users);
    if (itemString?.isNotEmpty ?? false) {
      return itemString!.map((element) {
        final jsonObject = jsonDecode(element);
        if (jsonObject is Map<String, dynamic>) {
          return User.fromJson(jsonObject);
        }
        return User('', '', '');
      }).toList();
    }
    return null;
  }
}
