import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ExmapleFour extends StatefulWidget {
  const ExmapleFour({super.key});

  @override
  State<ExmapleFour> createState() => _ExmapleFourState();
}
class _ExmapleFourState extends State<ExmapleFour> {

  // WIthout Model

  var data;
  Future<void> getUserApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode==200){
      data = jsonDecode(response.body.toString());
    }
    else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text('Example Four'),
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(
            future: getUserApi(),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Text('Loading');
              }else{
                return ListView.builder(
                  itemCount: data.length,
                    itemBuilder: (context,index){
                  return Card(
                    child: Column(
                      children: [
                        ReusebleRow(title: 'Name',value:data[index]['name'].toString() , ),
                        ReusebleRow(title: 'Username',value:data[index]['username'].toString() ,),
                        ReusebleRow(title: 'Address',value:data[index]['address']['street'].toString() ,),
                        ReusebleRow(title: 'Lat',value:data[index]['address']['geo']['lat'].toString() ,),
                        ReusebleRow(title: 'Lat',value:data[index]['address']['geo']['lng'].toString() ,),

                      ],
                    ),
                  );
                });
              }
            },

          ),)
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
