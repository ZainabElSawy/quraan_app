import 'package:equatable/equatable.dart';

class Timings extends Equatable {
  final String? fajr;
  final String? sunrise;
  final String? dhuhr;
  final String? asr;
  final String? sunset;
  final String? maghrib;
  final String? isha;
  final String? imsak;
  final String? midnight;
  final String? firstthird;
  final String? lastthird;

  const Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json['Fajr'] as String?,
        sunrise: json['Sunrise'] as String?,
        dhuhr: json['Dhuhr'] as String?,
        asr: json['Asr'] as String?,
        sunset: json['Sunset'] as String?,
        maghrib: json['Maghrib'] as String?,
        isha: json['Isha'] as String?,
        imsak: json['Imsak'] as String?,
        midnight: json['Midnight'] as String?,
        firstthird: json['Firstthird'] as String?,
        lastthird: json['Lastthird'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Fajr': fajr,
        'Sunrise': sunrise,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Sunset': sunset,
        'Maghrib': maghrib,
        'Isha': isha,
        'Imsak': imsak,
        'Midnight': midnight,
        'Firstthird': firstthird,
        'Lastthird': lastthird,
      };

  @override
  List<Object?> get props {
    return [
      fajr,
      sunrise,
      dhuhr,
      asr,
      sunset,
      maghrib,
      isha,
      imsak,
      midnight,
      firstthird,
      lastthird,
    ];
  }
}
