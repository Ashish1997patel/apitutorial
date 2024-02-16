import 'dart:convert';

import 'package:apitutorial/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class Examplethree extends StatefulWidget {
  const Examplethree({super.key});

  @override
  State<Examplethree> createState() => _ExamplethreeState();
}

class _ExamplethreeState extends State<Examplethree> {
  @override

  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi () async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }else{
      return userList;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Three'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserApi(),
                builder: (context,AsyncSnapshot<List<UserModel>>snapshot){
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }else{
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder:(context,index){
                          return Card(
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                            child:
                            Column(
                              children: [
                               ReusebleRow(title: 'Name', value:snapshot.data![index].name.toString()),
                               ReusebleRow(title: 'username', value:snapshot.data![index].username.toString()),
                               ReusebleRow(title: 'email', value:snapshot.data![index].email.toString()),
                               ReusebleRow(title: 'address',
                                   value:snapshot.data![index].address!.city.toString()

                               )
                              ],

                            ),),
                          );
                        });
                  }

                },
              ))
        ],
      ),
    );
  }
}

class ReusebleRow extends StatelessWidget {
  String title,value;
  ReusebleRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child:


      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    ),
    );
  }
}

