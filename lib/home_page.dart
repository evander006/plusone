import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/gifs/ball.gif', scale: 0.5),
              ElevatedButton(
                onPressed: () async {
                  debugPrint("before fetchdata call");
                  var str = await fetchData(100000);
                  debugPrint("Result1: $str");
                },
                child: const Text("Async await"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final receivepod = ReceivePort();
                  Isolate.spawn(
                    complexTask2,
                    receivepod.sendPort,
                  ); //create a new instance;
                  receivepod.listen((message) {
                    debugPrint("Total $message");
                  });
                },
                child: const Text("Isolates with port"),
              ),
              ElevatedButton(onPressed: ()async {
                var json =await compute(fetchData, 10000);
                debugPrint("Length: ${json.length}");
              }, child: const Text("Isolates compute")),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> fetchData(int iter) async {
    debugPrint("BEfore delay");
    await Future.delayed(Duration(seconds: 3));
    final jsonData = jsonEncode(
      List.generate(1000000, (i) => {"id": i, "value": "value of $i"}),
    );
  
    debugPrint("Encoded json");
    jsonDecode(jsonData);
    debugPrint("Decoded json");
    return jsonData;
  }
}

void complexTask2(SendPort sendPort) {
  var total = 0.0;
  for (var i = 0; i < 1000000000; i++) {
    total += 1;
  }
  //КОГДА ВЫЧИСЛЕНИЯ ЗАВЕРШАЮТСЯ
  sendPort.send(total);
}
