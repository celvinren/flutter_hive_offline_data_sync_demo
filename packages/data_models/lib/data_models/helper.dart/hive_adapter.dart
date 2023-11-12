import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

abstract class JsonTypeAdapter<T> extends TypeAdapter<T> {
  @override
  T read(BinaryReader reader) {
    final data = reader.read();
    final json = jsonDecode(data);
    return fromJson(json);
  }

  T fromJson(dynamic json);

  @override
  void write(BinaryWriter writer, T obj) {
    writer.write(jsonEncode(toJson(obj)));
  }

  Map<String, dynamic> toJson(T obj);
}

enum LocalBox {
  task;

  int get boxTypeId {
    switch (this) {
      case LocalBox.task:
        return 0;
    }
  }
}

class TypeSafeBox<K, T extends Equatable> {
  TypeSafeBox._(this.baseBox);

  static TypeSafeBox? _instance;

  static Future<TypeSafeBox<K, T>> init<K, T extends Equatable>({
    required String boxName,
    required TypeAdapter<T> adapter,
  }) async {
    if (_instance != null) {
      return _instance as TypeSafeBox<K, T>;
    }
    Hive.registerAdapter<T>(adapter);
    _instance = TypeSafeBox<K, T>._(await Hive.openBox<T>(boxName));
    return _instance as TypeSafeBox<K, T>;
  }

  final Box<T> baseBox;

  Iterable<T> get values => baseBox.values;

  Iterable<K> get keys => baseBox.keys.cast<K>();

  int get length => baseBox.length;

  bool get isEmpty => baseBox.isEmpty;

  bool get isNotEmpty => baseBox.isNotEmpty;

  Map<K, T> toMap() => baseBox.toMap().cast<K, T>();

  T? get(K key) => baseBox.get(key);

  T? getAt(int index) => baseBox.getAt(index);

  Future<void> put(K key, T value) {
    _previousValues[key] = BoxEvent(key, baseBox.get(key), false);
    return baseBox.put(key, value);
  }

  Future<void> putAll(Map<K, T> entries) {
    for (var entry in entries.entries) {
      _previousValues[entry.key] =
          BoxEvent(entry.key, baseBox.get(entry.key), false);
    }
    return baseBox.putAll(entries);
  }

  Future<void> delete(K key) {
    _previousValues[key] = BoxEvent(key, baseBox.get(key), true);
    return baseBox.delete(key);
  }

  Future<void> deleteAll(Iterable<K> keys) {
    for (var key in keys) {
      _previousValues[key] = BoxEvent(key, baseBox.get(key), true);
    }
    return baseBox.deleteAll(keys);
  }

  bool containsKey(K key) => baseBox.containsKey(key);

  Future<int> clear() => baseBox.clear();

  Future<void> compact() => baseBox.compact();

  // create a listen function to compare previous and new values
  final Map<K, BoxEvent> _previousValues = {};
  StreamSubscription<BoxEvent>? _listenStream;
  void listen<T>(
    void Function(T?, T?) listener, {
    void Function(Object, StackTrace)? onError,
  }) {
    _listenStream = baseBox.watch().listen(
      (event) {
        final newValue = event.value as T?;
        final previousValue = _previousValues[event.key]?.value as T?;
        if (newValue != previousValue) {
          listener(previousValue, newValue);
        }
        if (previousValue != null) {
          _previousValues.remove(event.key);
        }
      },
      onError: onError,
    );
  }

  void removeListener() {
    _listenStream?.cancel();
  }
}
