import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD Operation", style: TextStyle(color: Colors.white)),

        backgroundColor: Colors.blueAccent,
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add,color: Colors.white,),backgroundColor: const Color.fromARGB(255, 57, 7, 205),
      ),
    );
  }
}
