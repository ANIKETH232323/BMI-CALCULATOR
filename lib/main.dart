import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var textCon1 = TextEditingController();
  var textCon2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            TextField(
              controller: textCon1,
              decoration: const InputDecoration(
                label: Text("Enter Your weight(in KGS)"),
                prefixIcon: Icon(Icons.monitor_weight_outlined),
                border: OutlineInputBorder()
              ),
              keyboardType: const TextInputType.numberWithOptions(),
            ),
            const SizedBox(height: 25,),
            TextField(
              controller: textCon2,
              decoration: const InputDecoration(
                label: Text("Enter Your Height(in Feet"),
                prefixIcon: Icon(Icons.height_outlined),
                border: OutlineInputBorder(),

              ),
              keyboardType: const TextInputType.numberWithOptions(),
            ),
            const SizedBox(height: 25,),
            TextField(
              controller: textCon2,
              decoration: const InputDecoration(
                label: Text("Enter Your Height(in Inch"),
                prefixIcon: Icon(Icons.height_outlined),
                border: OutlineInputBorder(),

              ),
              keyboardType: const TextInputType.numberWithOptions(),
            ),

          ],
        ),
      ),
    );
  }
}
