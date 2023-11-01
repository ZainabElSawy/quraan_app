// import 'package:equatable/equatable.dart';
// import 'package:quraan_app/features/home/data/models/azkar_model/zekr.dart';

// import '.dart';

// class AzkarModel extends Equatable {
//   final List<Zekr>? azkarElsabah;
//   final List<Zekr>? azkarElMasa;
//   final List<Zekr>? azkarBa3dElsalah;
//   final List<Zekr>? tasabih;
//   final List<Zekr>? azkarElnom;
//   final List<Zekr>? azkarAlastikaz;
//   final List<Zekr>? ad3iaQurania;
//   final List<Zekr>? ad3iaElanbia;

//   const AzkarModel({
//     this.azkarElsabah,
//     this.azkarElMasa,
//     this.azkarBa3dElsalah,
//     this.tasabih,
//     this.azkarElnom,
//     this.azkarAlastikaz,
//     this.ad3iaQurania,
//     this.ad3iaElanbia,
//   });

//   factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
//         azkarElsabah: (json['أذكار الصباح'])!
//             .map((e) => Zekr.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         azkarElMasa: (json['أذكار المساء'] as List<dynamic>?)
//             ?.map((e) => Zekr.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         azkarBa3dElsalah:
//             (json['أذكار بعد السلام من الصلاة المفروضة'] as List<dynamic>?)
//                 ?.map((e) => Zekr.fromJson(e as Map<String, dynamic>))
//                 .toList(),
//         tasabih: (json['تسابيح'] as List<dynamic>?)
//             ?.map((e) => Zekr.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         azkarElnom: (json['أذكار النوم'] as List<dynamic>?)
//             ?.map((e) => Zekr.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         azkarAlastikaz: (json['أذكار الاستيقاظ'] as List<dynamic>?)
//             ?.map((e) => Zekr.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         ad3iaQurania: (json['أدعية قرآنية'] as List<dynamic>?)
//             ?.map((e) => Zekr.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         ad3iaElanbia: (json['أدعية الأنبياء'] as List<dynamic>?)
//             ?.map((e) => Zekr.fromJson(e as Map<String, dynamic>))
//             .toList(),
//       );

//   Map<String, dynamic> toJson() => {
//         'أذكار الصباح': azkarElsabah?.map((e) => e.toJson()).toList(),
//         'أذكار المساء': azkarElMasa?.map((e) => e.toJson()).toList(),
//         'أذكار بعد السلام من الصلاة المفروضة':
//             azkarBa3dElsalah?.map((e) => e.toJson()).toList(),
//         'تسابيح': tasabih?.map((e) => e.toJson()).toList(),
//         'أذكار النوم': azkarElnom?.map((e) => e.toJson()).toList(),
//         'أذكار الاستيقاظ': azkarAlastikaz?.map((e) => e.toJson()).toList(),
//         'أدعية قرآنية': ad3iaQurania?.map((e) => e.toJson()).toList(),
//         'أدعية الأنبياء': ad3iaElanbia?.map((e) => e.toJson()).toList(),
//       };

//   @override
//   List<Object?> get props => [
//         azkarElsabah,
//         azkarElMasa,
//         azkarBa3dElsalah,
//         tasabih,
//         azkarElnom,
//         azkarAlastikaz,
//         ad3iaQurania,
//         ad3iaElanbia,
//       ];
// }
