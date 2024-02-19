import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(RootAppWidget());

class CountData1 extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}

class CountData2 extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}

class RootAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountData1()),
          ChangeNotifierProvider(create: (_) => CountData2()),
        ],
        child: HomeWidget(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tekitou'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DisplayCountData1(),
          SizedBox(
            width: 10,
          ),
          DisplayCountData2(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PracNavigator()))
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DisplayCountData1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("count is ${context.watch<CountData1>().count}"),
        SizedBox(height: 8),
        ElevatedButton(
            onPressed: () => context.read<CountData2>().increment(),
            child: Icon(Icons.plus_one)),
        ElevatedButton(
            onPressed: () => context.read<CountData1>().decrement(),
            child: Icon(Icons.exposure_minus_1)),
      ],
    );
  }
}

class DisplayCountData2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("count is ${context.watch<CountData2>().count}"),
        SizedBox(height: 8),
        ElevatedButton(
            onPressed: () => context.read<CountData1>().increment(),
            child: Icon(Icons.plus_one)),
        ElevatedButton(
            onPressed: () => context.read<CountData2>().decrement(),
            child: Icon(Icons.exposure_minus_1)),
      ],
    );
  }
}

class PracNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('遷移先を表示中'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
