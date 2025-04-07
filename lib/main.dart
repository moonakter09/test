import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;
  String result = "";
  
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator",style: TextStyle(color: Colors.black),),
          elevation: 0.0,
          backgroundColor: const Color(0xfffafafa),
          
          
          actions: [
            IconButton(
              onPressed: () {},
               icon: const Icon(
                Icons.settings,
                color: Colors.black,
               ),
               )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.blue, 0),
                    radioButton("Woman", Colors.pink, 1),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                  ),
                  const Text("Your height in Cm:",
                  style: TextStyle(
                    fontSize: 18.0,

                  ),
                  ),
                  const SizedBox(
                    height: 8.0,

                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Your height in Cm",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,

                      ),
                    ),
                  ),

                  const SizedBox(height: 20.0,
                  
                  ),

                  const Text("Your weight in kg:",
                  style: TextStyle(
                    fontSize: 18.0,

                  ),
                  ),
                  const SizedBox(
                    height: 8.0,

                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Your weight in kg",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,

                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),

                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: TextButton(
                      onPressed: () {
                        double height = double.parse(heightController.value.text);
                        double weight = double.parse(weightController.value.text);
                        calculateBmi(height, weight);


                      },
                      style:  TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      
                      child: const Text(
                        "calculate",
                        style: TextStyle(
                          color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      result,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      
                      ),
                  ),
                  const SizedBox(height: 50.0,),
                  SizedBox(
                    width: double.infinity,
                    child: const Text(
                      "Your BMI is",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                      
                      ),
                  ),


                  
              ],
            ),
            ),
        ),
      ),
    );
  }

  void calculateBmi(double height,double weight){
    double finalresult = weight / (height * height / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }


  void changeIndex(int index){
    setState(() {
      currentindex = index;
    });

  }

  Widget radioButton(String value,Color color,int index){
    return Expanded(
      child:Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child:TextButton(
          style: TextButton.styleFrom(
          backgroundColor:currentindex == index ? color: Colors.grey[200],
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          ),

          onPressed: (){
            changeIndex(index);
          },
          child:Text(value,style: TextStyle(
            color: currentindex == index ? Colors.white : color,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ) ,
      );
  }
}