import 'package:json_annotation/json_annotation.dart';

part 'cell_counting.g.dart';

@JsonSerializable()
class CellCounting {
  CellCounting(
    this.RBC,
    this.WBC,
    this.Platelets,
    this.image_url,
  );

  int? RBC;
  int? WBC;
  int? Platelets;
  String? image_url;

  factory CellCounting.fromJson(Map<String, dynamic> json) =>
      _$CellCountingFromJson(json);

  Map<String, dynamic> toJson() => _$CellCountingToJson(this);
}
