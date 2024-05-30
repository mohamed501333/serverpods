
import 'dart:io';

import 'package:hive/hive.dart';

class HiveDB{   

  static initHive() async {
var path = Directory.current.path;
  Hive.init(path);
   await Hive.openBox('testBox');
  }

 static addAndget(String g) async {
    final b= Hive.box('testBox');
    await b.put('dave', g);

  print(b.get('dave'));
  }
 
}