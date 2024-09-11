class UserLocation {
  final LocationStreet street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationCoordinates coordinates;
  final LocationTimezone timezone;

  UserLocation({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });
}

class LocationCoordinates {
  final String latitude;
  final String longitude;
  LocationCoordinates({required this.latitude, required this.longitude});
}

class LocationTimezone {
  final String offset;
  final String description;

  LocationTimezone({required this.offset, required this.description});
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({required this.name, required this.number});
}
