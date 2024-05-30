/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.name,
    required this.userID,
  });

  factory User({
    int? id,
    required String name,
    required int userID,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      userID: jsonSerialization['userID'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int userID;

  User copyWith({
    int? id,
    String? name,
    int? userID,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'userID': userID,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String name,
    required int userID,
  }) : super._(
          id: id,
          name: name,
          userID: userID,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? name,
    int? userID,
  }) {
    return User(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      userID: userID ?? this.userID,
    );
  }
}
