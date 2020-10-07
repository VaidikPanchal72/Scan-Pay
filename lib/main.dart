import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner',
      theme: ThemeData(
          primaryColor: Colors.purple[900]
      ),
      home: MyHomePage(title: 'Barcode Scanner'),
        debugShowCheckedModeBanner: false
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _scannedRes,_value = "";

  Future _scanBarcode() async
  {
    _scannedRes = await FlutterBarcodeScanner.scanBarcode
      ("#ff6666", "Cancel", true, ScanMode.BARCODE);

    setState(() {
      _value=_scannedRes;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scanned Value:',
            ),
            Text(
              _value,
              style: TextStyle(fontSize: 24,fontFamily: 'Arial'),
              //style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanBarcode,
        tooltip: 'Increment',
        backgroundColor: Colors.lightBlue[900],
        child: Icon(Icons.scanner),
        //child: Icon(Icons.settings_overscan),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}