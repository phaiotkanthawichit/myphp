import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddItemPageState();
  }
}

class AddItemPageState extends State<AddItemPage>
 {
  TextEditingController NameController;
  String Response = "NULL";
  createItem() anync {
    const url = "https://www.57ans.com/flutterphp/index.php";
    var result = await http.get(url);
    setState(() {
      this.response = result.body;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Items"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "Name"
             ),
          ),
        ElevatedButton(
          onPressed: createItem,
           child: Text("Create"),
          ),
          Text(Thisresponse),
        ],

      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  showAddItemPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return AddItemPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: showAddItemPage,
      ),
      body: Column(
        children: <Widget>[
          Text("Hello"),
        ],
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter MyPHP",
      home: MainPage(),
    );
  }
}

void main() {
  runApp(App());
}
