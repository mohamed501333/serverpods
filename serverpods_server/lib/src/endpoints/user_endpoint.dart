

import 'package:serverpod/serverpod.dart';
import 'package:serverpods_server/src/generated/user.dart';

class UserEndpoint extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {
   session.messages.addListener("1", (updates){
      sendStreamMessage(session, updates);
   });
  }
@override
  Future<void> handleStreamMessage(StreamingSession session, SerializableModel message) async {
    session.messages.postMessage("1", message);
    print(    User.fromJson(message.toJson()).name
);
  }
  
  Future<String> create(Session session ,User user) async{
// sendStreamMessage(session, message)
// HiveDB.addAndget(user.name);
    return user.name;
  }
  Future<User?> read(Session session ,int id) async{
   return await User.db.findById(session, id);
  }
   Future<List<User>> readAll(Session session ) async{
    return User.db.find(session);
  }
  Future<User> update(Session session ,User user) async{
    await User.db.updateRow(session, user);
    return user;
  }
  Future<void> delete(Session session ,int id) async{
    await User.db.deleteWhere(session, where: (user)=>user.id.equals(id));
  }

}
