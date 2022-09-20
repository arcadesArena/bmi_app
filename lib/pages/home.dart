import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _outputBMI = "";
  String _outputCAT = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(35.0,0,35.0,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Category $_outputCAT",style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            Text("BMI $_outputBMI",style: const TextStyle(fontSize: 70.0,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.monitor_weight_outlined,color: Colors.blue),
                labelText: "Weight (kg)",
                border: UnderlineInputBorder(borderRadius: BorderRadius.circular(5.0),),
                fillColor: Colors.blue[100],
                filled: true,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 25,),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.height),
                labelText: "Height (cm)",
                border: UnderlineInputBorder(borderRadius: BorderRadius.circular(5.0),),
                fillColor: Colors.blue[100],
                filled: true,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 25,),
            ElevatedButton(
                onPressed: (){
                  double ht = double.parse(_heightController.text)/100;
                  double wt = double.parse(_weightController.text);
                  double bmi = (wt/(ht*ht));
                  _outputBMI = bmi.toStringAsFixed(2);
                  if(bmi<18.5){
                    _outputCAT="Underweight";
                  }
                  else if(18.5<=bmi && bmi<=24.9){
                    _outputCAT="Normal";
                  }
                  else if(25.0<=bmi && bmi<=29.9){
                    _outputCAT="Overweight";
                  }
                  else if(30.0<=bmi && bmi<=34.9){
                    _outputCAT="Obese class I";
                  }
                  else if(35.0<=bmi && bmi<=39.9){
                    _outputCAT="Obese class II";
                  }
                  else if(40.0<=bmi){
                    _outputCAT="Obese class III";
                  }
                  setState(() {});
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Calculate",style: TextStyle(fontSize: 25),),
                ),
            )
          ],
        ),
      )
    );
  }
}
