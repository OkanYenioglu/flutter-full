import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_full/303/generic_learn.dart';
import 'package:flutter_full/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('List best of', () {
    List<GenericUser> users = [
      GenericUser('okan1', '11', 5),
      GenericUser('okan2', '11', 10),
      GenericUser('okan3', '11', 10),
    ];

    users.add(GenericUser('name', 'id', 1));

    List<HighCard> highCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    try {
      final response = users.singleWhere(
        (element) => element.findUserName('x'),
        orElse: () {
          return GenericUser('name', 'id', 15);
        },
      );
      print(response.name);
    } catch (e) {
      print(e);
    }

    log('${users.where((element) => element.money > 5)}');

    users.addAll([GenericUser('name', 'id', 1)]);
    users.lastWhereOrNull((element) => element.id == 5);
    users.take(5);

    users.remove(GenericUser('okan1', '11', 5));
    users.removeAt(2);
    users.removeWhere((element) => element.id == 11);

    users.indexOf(GenericUser('name', 'id', 15));
    final result = users.indexWhere((element) => element.id == '11');

    if (result >= 0) {
      users[result] = GenericUser('a', 'b', 15);
    }

    //users.map((e) => e.money).where((element) => element > 5);
  });

  test('List best of with collection', () {
    List<GenericUser> users = [
      GenericUser('okan1', '11', 5),
      GenericUser('okan2', '11', 10),
      GenericUser('okan3', '11', 10),
    ];

    final response = users.singleWhereOrNull(
      (element) => element.findUserName('x'),
    );

    users.lastWhereOrNull((element) => element.id == 5);

    users.lastOrNull;
    users.forEachIndexed((index, element) {});
    users.sample(3);
    print(users.first == GenericUser('okan1', '11', 5));
    print(users.contains(GenericUser('okan1', '11', 5)));

    users.any((element) => element.money >= 5);

    print(response);
  });
}
