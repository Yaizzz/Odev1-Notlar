import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}){
    print("Myapp yaratılıyor");
  }

  @override
  Widget build(BuildContext context) {
    print("Myapp build");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title}){
    print("myhomepage yaratılıyor");
  }

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(){
    print("MyHomePageState yaratılıyor");
  }
  int _counter = 0;

  void _incrementCounter() {
    print("incrementCounter");
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("myhomepagestate build çağırıldı");
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(widget.title),
        actions:  [
          IconButton(
            icon: Icon(Icons.accessible_forward),
            onPressed: () {
            print("object");
            },
          ),
          Icon(Icons.add_alert),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                color: Colors.purpleAccent,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Yazi('suanki deger $_counter'),
            Sayac(
                'dısarıdaki deger $_counter',
              ilkDeger : 3,
            ),
            ElevatedButton(
              onPressed: (){
                print("increment pressed");
                _incrementCounter();
              },
              child: const Text(
                "Increment",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
            label: "Bir",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "İki",
          ),
        ],
      ),
    );
  }
}

class Yazi extends StatelessWidget {
  final String icerik;
  const Yazi(this.icerik, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(icerik);
  }
}

class Sayac extends StatefulWidget {
  final String baslik;
  final int ilkDeger;
  const Sayac(this.baslik , {Key? key, required this.ilkDeger}) : super(key: key);

  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int sayac = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sayac = widget.ilkDeger;
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          sayac++;
        });
      },
      child: Text
        ('${widget.baslik} icerideki:,$sayac'),
    );
  }
}
