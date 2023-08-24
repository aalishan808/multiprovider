import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});
ValueNotifier<int> count = ValueNotifier<int>(0);
 ValueNotifier<bool> hide = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stless as stful"),

      ),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          ValueListenableBuilder(
              valueListenable: hide,
              builder: (context,value,child){
                return
                  TextFormField(
                    obscureText: hide.value,
                    decoration: InputDecoration(
                      hintText: 'password',
                      suffix:InkWell(
                          onTap: (){
                            hide.value=!value;
                          },
                          child: Icon(hide.value?Icons.visibility_outlined:Icons.visibility_off_outlined))
                    ),

                  );
              }),

          Center(child: ValueListenableBuilder(
            builder: (context,value,child){
              return Text(value.toString(),style: TextStyle(
                fontSize: 50
              ),);
            }, valueListenable: count,
          ),
          ),
        ],),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
