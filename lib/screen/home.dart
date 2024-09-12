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
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('REST API Call')),
        backgroundColor: Colors.grey.shade300,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            // final email = user.email;

            return ListTile(
              leading: ClipRRect(
                borderRadius:
                     BorderRadius.circular(10), // Circular profile picture
                child: Stack(
                  children: [
                    // Profile Picture
                    Image.network(
                      user.picture.large,
                      width: 50, // Set size of the profile image
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    // Notification Circle Icon (like a badge)

                    Positioned(
                      top: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          getIconByAgeDivision(user.dob.age)
                          ,width: 15,height: 15,fit: BoxFit.cover,),
                      )
                    ),

                  ],
                ),
              ),
              title: Text(user.fullName),
              subtitle: Text(user.phone),
              trailing: Text(user.location.city),
            );
          }),

      // ),
    );
  }
String getIconByAgeDivision(int age){
    if(age >= 18 && age<= 30){ return 'assets/images/1530390_weather_clouds_cloudy_rain_sunny_icon.ico';}
    if (age >= 31 && age <= 40){ return 'assets/images/1530385_weather_clouds_rain_storm_thunder_icon.ico';}
    if(age >= 41 && age <= 50){ return 'assets/images/1530381_weather_night_rain_storm_icon.ico';}
    if(age >= 51 && age <= 60){ return 'assets/images/1530370_weather_clouds_hail_hailstone_snow_icon.ico';}
    if(age >= 61 && age <= 80){ return 'assets/images/118961_few_weather_clouds_icon.ico';}
    else {return 'assets/images/47314_weather_icon.ico';}
}

  Future<void> fetchUser() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
//https://www.youtube.com/watch?v=-48PDXzVefI&list=PLXbYsh3rUPSzuLcZsIkpDmftSQbFmUq9x&index=2&ab_channel=NitishKumarSingh
