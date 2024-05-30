import 'package:serverpods_client/serverpods_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://192.168.1.18:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Serverpod Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
    late final StreamingConnectionHandler connectionHandler;

  String? _resultMessage;
  String? _errorMessage;

  final _textEditingController = TextEditingController();

@override
  void initState() {
// connectionHandler=StreamingConnectionHandler(client: client, listener:(_)=> setState(() {
//   print("setsrtae");
// }))  ;
// connectionHandler.connect();


  super.initState();
  }
  void _callHello() async {   

    try {
      // await client.st
       await client.example.hello(_textEditingController.text);
      // final result = await client.user.create(User(name: _textEditingController.text, userID: 12));
      setState(() {
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
    }
  }  
  @override
  Widget build(BuildContext context) {
    // client.user.stream.listen((data){
    //   print(data.toJson());
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: _callHello,
                child: const Text('Send to Server'),
              ),
            ),
            _ResultDisplay(
              resultMessage: _resultMessage,
              errorMessage: _errorMessage,
            ),
          ],
        ),
      ),
    );
  }
}

// _ResultDisplays shows the result of the call. Either the returned result from
// the `example.hello` endpoint method or an error message.
class _ResultDisplay extends StatelessWidget {
  final String? resultMessage;
  final String? errorMessage;

  const _ResultDisplay({
    this.resultMessage,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    String text;
    Color backgroundColor;
    if (errorMessage != null) {
      backgroundColor = Colors.red[300]!;
      text = errorMessage!;
    } else if (resultMessage != null) {
      backgroundColor = Colors.green[300]!;
      text = resultMessage!;
    } else {
      backgroundColor = Colors.grey[300]!;
      text = 'No server response yet.';
    }

    return Container(
      height: 100,
      color: backgroundColor,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
