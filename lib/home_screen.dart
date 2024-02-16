import 'dart:convert';

import 'package:apitutorial/Models/Postmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});

  @override
  State<HomeScreem> createState() => _HomeScreemState();
}
class _HomeScreemState extends State<HomeScreem> {

  List<Postmodel> postList = [];

  Future<List<Postmodel>> getPostapi () async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      postList.clear();
      for(Map i in data){
        postList.add(Postmodel.fromJson(i));
      }
      return postList;
}else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api'),
      ),
      body: Column(
        children: [
          Expanded(
            child:FutureBuilder(
              future: getPostapi(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Text('Loading');
                }else{
                  return ListView.builder(itemCount: postList.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Title\n'+postList[index].title.toString()),
                            Text('Description\n'+postList[index].title.toString()),
                          ],
                        ),

                      ),
                    );
                  },);
                }

              },
            ) ,)
        ],
      ),



    );
  }
}
