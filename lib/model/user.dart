import 'package:flutter_api_project/model/user_dob.dart';
import 'package:flutter_api_project/model/user_location.dart';
import 'package:flutter_api_project/model/user_name.dart';
import 'package:flutter_api_project/model/user_picture.dart';


class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;
  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.name,
      required this.dob,
        required this.location,
        required this.picture
      });
//factory constructor will help us in the parsing the data
  factory User.fromMap(Map<String,dynamic> e ){
    final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last']);
    final date = e['dob']['date'];
    final dob = UserDob(date: DateTime.parse(date), age: e['dob']['age']);
    final coordinates = LocationCoordinates(
        latitude: e['location']['coordinates']['latitude'],
        longitude: e['location']['coordinates']['longitude']);
    final street = LocationStreet(
        name: e['location']['street']['name'],
        number: e['location']['street']['number']);
    final timezone = LocationTimezone(
        offset: e['location']['timezone']['offset'],
        description: e['location']['timezone']['description']);

    final location = UserLocation(
        street: street,
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        coordinates: coordinates,
        timezone: timezone);
final picture = UserPicture(
    large: e['picture']['large'],
    medium: e['picture']['medium'],
    thumbnail: e['picture']['thumbnail']

);
    return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name,
        dob: dob,
        location: location,
      picture: picture
    );

  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
