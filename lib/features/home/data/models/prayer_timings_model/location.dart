import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double? latitude;
  final double? longitude;

  const Location({this.latitude, this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };

  @override
  List<Object?> get props => [latitude, longitude];
}
