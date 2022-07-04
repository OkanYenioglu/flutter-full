import 'package:flutter_full/202/cache/user_model.dart';
import 'package:flutter_full/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('User calculate', () {
    final users = [
      GenericUser('vb', '11', 10),
      GenericUser('vb2', '111', 10),
      GenericUser('vb2', '111', 20),
    ];
    final userManagement = UserManagament(AdminUser('oAdmin', '1', 15, 1));

    final result = userManagement.calculateMoney(users);

    final response = userManagement.showNames<String>(users);

    expect(result, 55);
  });
}
