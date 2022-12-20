import 'package:flutter/material.dart';
import 'package:keycloak_test/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter  Keycloack Demo'),
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
  bool isLoggedIn = false;
  Future<void> _login() async {
    bool loggedIn = await AuthRepositoryKeyCloack.login("teste", "teste");
    setState(() {
      isLoggedIn = loggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: 400,
        alignment: Alignment.center,
        child: Container(
          width: 200,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: const Text(
                  'You are currently:',
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  isLoggedIn ? 'Logged in' : 'Logged out',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ElevatedButton(onPressed: isLoggedIn ? null : _login, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
