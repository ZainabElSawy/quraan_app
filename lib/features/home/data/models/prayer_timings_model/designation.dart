import 'package:equatable/equatable.dart';

class Designation extends Equatable {
  final String? abbreviated;
  final String? expanded;

  const Designation({this.abbreviated, this.expanded});

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        abbreviated: json['abbreviated'] as String?,
        expanded: json['expanded'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'abbreviated': abbreviated,
        'expanded': expanded,
      };

  @override
  List<Object?> get props => [abbreviated, expanded];
}
