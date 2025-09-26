import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_map_provider.dart';

class addPage extends StatelessWidget {
  const addPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),body: Center(
      child: IconButton(onPressed: (){
        context.read<ListMapProvider>().addData({
          "name" : "Gopal Singh",
          "email" : "john.mckinley@examplepetstore.com",
        });

      }, icon: Icon(Icons.add),),
    ),
    );
  }
}
