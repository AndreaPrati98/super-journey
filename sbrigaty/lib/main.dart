import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        shadowColor: Colors.amber,
      ),
      title: 'Shopping List',
      home: const MyHomePage(title: 'Shopping List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Text> _itemList = [];
  TextEditingController textInsertItemController = TextEditingController();

  void addItem() {
    setState(() {
      if (textInsertItemController.text.isEmpty) return;
      //if (_itemList.contains(textInsertItemController.text)) return;
      _itemList.add(Text(textInsertItemController.text));
      print("${_itemList.last}");
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Insert the items here"),
                  icon: Icon(Icons.insert_comment),
                  //iconColor: Colors.black,
                  hintText: "Eggs",
                  hintStyle: TextStyle(
                    color: Colors.blue,
                  )),
              controller: textInsertItemController,
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          const Text("Here are the list of the items"),
          Expanded(
            child: ListView.builder(
                itemCount: _itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: _itemList[index],
                  );
                }),
          ),
        ],
      ),

      drawer: Drawer(
        child: Column(children: const []),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
