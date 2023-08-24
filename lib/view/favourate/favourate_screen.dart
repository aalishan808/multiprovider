import 'package:flutter/material.dart';
import 'package:multiprovider/provider/favourate_screen_Provider.dart';
import 'package:multiprovider/view/favourate/my_favourates.dart';
import 'package:multiprovider/view/favourate/my_favourates.dart';
import 'package:provider/provider.dart';

class FavourateScreen extends StatefulWidget {
  const FavourateScreen({super.key});

  @override
  State<FavourateScreen> createState() => _FavourateScreenState();
}

class _FavourateScreenState extends State<FavourateScreen> {

 List<int> selectedItems =[];
  @override
  Widget build(BuildContext context) {
    final favourateProvider = Provider.of<FavourateScreenProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
          title:Text("Favourate App"),
        actions: [
          InkWell(
            onTap: ()
        {Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavourateItemScreen()));
        }, child: Icon(Icons.favorite),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context,index){
                return Consumer<FavourateScreenProvider>(builder: (context,value,child){
                  print('here');
                  return ListTile(
                    onTap: (){
                      if(value.selectedItems.contains(index)) {
                        value.removeItem(index);
                      }
                      else{
                        value.addItem(index);}
                      setState(() {
                      });
                    },
                    title: Text('Item'+index.toString()),
                    trailing: Icon(value.selectedItems.contains(index)?Icons.favorite:Icons.favorite_outline),
                  );
                });

              }),
            )
        ],
      ),
    );
  }
}
