import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Design App'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  //constructor, will get the title from the parent
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _myText = "Hello World";
  String? _myImage = "galaxy.jpeg";
  String _textState = "";
  String _flutterText = "My First Application";

  void _helloWorld() {
    setState(() {
      _flutterText = "Hello World";
    });
  }

  void _goodByeWorld() {
    setState(() {
      _flutterText = "Goodbye World";
    });
  }
  void _changeText() {
    setState(() {
      _myText = "Goodbye World";
    });
  }

  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _textState = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ Text(_flutterText) ],
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => _helloWorld(), child: const Text('Hello')),
                ElevatedButton(onPressed: () => _goodByeWorld(), child: const Text('Goodbye')),
              ]
            )
          ],
        ),
      ),
    );
  }
}