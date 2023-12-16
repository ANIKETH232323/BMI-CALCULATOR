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
  var textCon3 = TextEditingController();
  var result = "";
  var bgcolor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Container(
        color: bgcolor,
        child: Padding(
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
                  label: Text("Enter Your Height(in Feet)"),
                  prefixIcon: Icon(Icons.height_outlined),
                  border: OutlineInputBorder(),

                ),
                keyboardType: const TextInputType.numberWithOptions(),
              ),
              const SizedBox(height: 25,),
              TextField(
                controller: textCon3,
                decoration: const InputDecoration(
                  label: Text("Enter Your Height(in Inch)"),
                  prefixIcon: Icon(Icons.height_outlined),
                  border: OutlineInputBorder(),

                ),
                keyboardType: const TextInputType.numberWithOptions(),
              ),
              const SizedBox(height: 25,),

              ElevatedButton(onPressed: (){

                var weight = textCon1.text.toString();
                var height = textCon2.text.toString();
                var heightin = textCon3.text.toString();


                if(weight!="" && height!="" && heightin!=""){
                  var weight1 = int.parse(weight);
                  var height1 = int.parse(height);
                  var height2 = int.parse(heightin);

                  var totalinch = height1*12 + height2;

                  var totalcm = totalinch*2.54;

                  var totalm = totalcm/100;

                  var bmi = weight1/(totalm*totalm);

                  var msg = "";
                  if(bmi>25){
                    msg="You are Over Weight";
                    bgcolor = Colors.redAccent;
                  }

                  else if(bmi<18){
                    msg = "You are Underweight";
                    bgcolor = Colors.deepPurple;
                  }

                  else
                    {

                      msg = "You are Healthy";
                      bgcolor = Colors.green;
                    }

                  setState(() {
                    result = " $msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                  });
                }
                else{
                  setState(() {
                    result = "Please Fill the All required Boxes";
                  });
                }

              },
                  child: const Text("Calculate")
              ),
              SizedBox(height: 25,),
              Text(result,style: const TextStyle(fontSize: 16,color: Colors.indigo),textAlign: TextAlign.center,)

            ],
          ),
        ),
      ),
    );
  }
}
