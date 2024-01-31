// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell_counting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CellCounting _$CellCountingFromJson(Map<String, dynamic> json) => CellCounting(
      json['RBC'] as int?,
      json['WBC'] as int?,
      json['Platelets'] as int?,
      json['image_url'] as String?,
    );

Map<String, dynamic> _$CellCountingToJson(CellCounting instance) =>
    <String, dynamic>{
      'RBC': instance.RBC,
      'WBC': instance.WBC,
      'Platelets': instance.Platelets,
      'image_url': instance.image_url,
    };
