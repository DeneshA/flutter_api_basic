
import 'package:flutter/material.dart';
import 'package:flutter_api_project/model/user.dart';
import 'package:flutter_api_project/services/user_api.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  // when ever the wiget get render the initState get call() during the load
  @override
  void initState(){
super.initState();
fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('REST API Call')),
        backgroundColor: Colors.grey.shade300,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            final email = user.email;

            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.phone),
              trailing: Text(user.location.city),
            );
          }),

      // ),
    );
  }

Future<void> fetchUser() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
}
}
//https://www.youtube.com/watch?v=-48PDXzVefI&list=PLXbYsh3rUPSzuLcZsIkpDmftSQbFmUq9x&index=2&ab_channel=NitishKumarSingh
