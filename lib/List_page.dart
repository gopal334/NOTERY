import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Add_page.dart';
import 'list_map_provider.dart';

class ListPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
    body: Consumer<ListMapProvider>(

      builder: (ctx, _, __){
        var allData = ctx.watch<ListMapProvider>().getData();
        return allData.isNotEmpty ? ListView.builder(
          itemCount: allData.length,itemBuilder: (context, index){
          return ListTile(
            title: Text(allData[index]['name']),
            subtitle: Text(allData[index]['email']),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    context.read<ListMapProvider>().deleteData(index);


                  }, icon: Icon(Icons.delete,color: Colors.red,)),
                  IconButton(onPressed: (){
                    context.read<ListMapProvider>().updateData(index,{
                      "name" : "Gopal Singh",
                      "email" : "john.mckinley@examplepetstore.com",
                    }
                    );
                  }, icon: Icon(Icons.edit)),

                ],

              )
            ),

          );
        },
        ): Center(child: Text('No Data'),);
      },
    ),
      floatingActionButton: FloatingActionButton(
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => addPage()));
    },
    child: Icon(Icons.add),
    ),
    );
  }
}
