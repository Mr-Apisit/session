
import 'package:hive_flutter/hive_flutter.dart';

import '../models/local_model.dart';
import '../models/network_model.dart';

abstract class LocalRemote {
  Future<List<Pokemon>> getLocalData();
  Future<void> addLocalData(LocalModel data);
  Future<void> deleteLocalData(int id);
}

class LocalRemoteImpl extends LocalRemote {
  @override
  Future<List<Pokemon>> getLocalData() async {
    List<Pokemon> data = [];
    try {
      Box box = await Hive.openBox('local_store');
      // box.clear();

      for (final i in box.keys) {
        final value = await box.get(i);
        final item = Pokemon.fromJson(value);
        data.add(item);
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> addLocalData(LocalModel data) async {
    try {
      Box box = await Hive.openBox('local_store');
      await box.put(data.id, data.value);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> deleteLocalData(int id) async {
    try {
      Box box = await Hive.openBox('local_store');
      await box.delete(id);
    } catch (e) {
      throw e.toString();
    }
  }
}
