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
          children: <Widget>[

            Text(_textState),
            TextField(controller: _controller),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(
                  _myText,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(onPressed: _changeText,
                  child:
                  const Text("Goodbye!"),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                    image: AssetImage(
                        "images/$_myImage"
                    )
                ),

              ],
            ),
            ListTile(
              title: const Text("Galaxy"),
              leading: Radio (
                  value: "galaxy.jpeg",
                  groupValue: _myImage,
                  onChanged: (String? value) {
                    setState(() {
                      _myImage = value;
                    });
                  }
              ),
            ),
            ListTile(
              title: const Text("iPhone"),
              leading: Radio (
                  value: "iphone.jpeg",
                  groupValue: _myImage,
                  onChanged: (String? value) {
                    setState(() {
                      _myImage = value;
                    });
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}




