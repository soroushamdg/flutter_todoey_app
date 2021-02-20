import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_provider.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksNotifierProvider(),
      child: MaterialApp(
        home: App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<TasksNotifierProvider>(context).loaddatabase(),
        builder: (context, snapshot) => (snapshot.hasData)
            ? Scaffold(body: TasksScreen())
            : Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                    child: Hero(
                  tag: 'topicon',
                  child: CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                )),
              ));
  }
}
// Image.asset(
//                   'assets/launcher_icon.png',
//                   height: 300.0,
//                   width: 300.0,
//                 )
