import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'counter.dart';
import 'myWebView.dart';

final counter = Counter();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Island岛',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Island岛 · mc.i2s.io"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                'Island二周目岛民数量',
              ),
              Observer(
                  builder: (_) => Text(
                        '${counter.value}',
                        style: Theme.of(context).textTheme.headline4,
                      )),
              FlatButton(
                child: Text("详情 ->"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewRoute();
                  }));
                },
              )
            ])),
        floatingActionButton: GestureDetector(
          onLongPressStart: (d) {
            counter.fastIncrement(true);
            // print('Long pressed');
          },
          onLongPressEnd: (d) {
            counter.fastIncrement(false);
            // print('Press cancled');
          },
          child: FloatingActionButton(
              onPressed: () {
                counter.increment();
              },
              // tooltip: '岛民+1',
              child: Icon(Icons.add)),
        ));
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyWebView(title: '二周目玩家列表', selectedUrl: 'https://mc.i2s.io'),
    );
  }
}
