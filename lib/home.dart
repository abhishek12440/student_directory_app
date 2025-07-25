import 'package:flutter/material.dart';
import 'package:student_directory_app/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  TextEditingController namecount = TextEditingController();
  TextEditingController emailcount = TextEditingController();
  TextEditingController phonecount = TextEditingController();
  TextEditingController departmentcount = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD Operation", style: TextStyle(color: Colors.white)),

        backgroundColor: Colors.blueAccent,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Student Data"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: namecount,
                      decoration: InputDecoration(
                        label: Text("Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: emailcount,
                      decoration: InputDecoration(
                        label: Text("Email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: phonecount,
                      decoration: InputDecoration(
                        label: Text("Phone Number"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: departmentcount,
                      decoration: InputDecoration(
                        label: Text("Department"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        student(
                          context: context,
                          Name: namecount.text,
                          email: emailcount.text,
                          phone_number: phonecount.text,
                          department: departmentcount.text,
                        );
                      },
                      child: Text(
                        "Add Student",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(66, 7, 7, 7),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: const Color.fromARGB(255, 57, 7, 205),
        child: Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 203, 219, 234),
      body: StreamBuilder(
        stream: fetch_data(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final studentdata = snapshot.data!.docs;
          return ListView.builder(
            itemCount: studentdata.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(studentdata[index]['Name']),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Text(studentdata[index]['email']),
                        
                      ],
                    ),
                   
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
