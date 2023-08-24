import 'package:flutter/material.dart';
import 'package:multiprovider/provider/favourate_screen_Provider.dart';
import 'package:provider/provider.dart';

class MyFavourateItemScreen extends StatefulWidget {
  const MyFavourateItemScreen({super.key});

  @override
  State<MyFavourateItemScreen> createState() => _MyFavourateItemScreenState();
}

class _MyFavourateItemScreenState extends State<MyFavourateItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favourateProvider = Provider.of<FavourateScreenProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title:Text("Favourate App"),

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favourateProvider.selectedItems.length,
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
