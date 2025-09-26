import 'package:flutter/material.dart';
import 'package:learningstatemanagement/counter_provider.dart';
import 'package:provider/provider.dart';

import 'List_page.dart';
import 'add_notepage.dart';
import 'list_map_provider.dart';
import 'note_provider.dart';

void main() {

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ListMapProvider()),
        ChangeNotifierProvider(create: (context) => NotesProvider()),

      ],

      child: MyApp(
        
      ),

  )
  );
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
      ),
      home:  NotesPage(),
      );



  }
}

class homepage extends StatelessWidget {

 int _count =0;

  @override
  Widget build(BuildContext context) {
    print("Build function calling");
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (ctx, _, __){
            print("Consumer Function call");
            return Text(
             // Provider.of<CounterProvider>(ctx).getCount().toString(),
              '${ctx.watch<CounterProvider>().getCount()}',
              style: TextStyle(fontSize: 50),
            );
          }
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: (){
              //  Provider.of<CounterProvider>(context, listen: false).incrementCont();
              context.read<CounterProvider>().decrementCount();
            },
            child: Icon(Icons.remove),

          ),
          FloatingActionButton(
              onPressed: (){
          //  Provider.of<CounterProvider>(context, listen: false).incrementCont();
                context.read<CounterProvider>().incrementCont();
          },
            child: Icon(Icons.add),

          ),
        ],
      ),

    );
  }
}

