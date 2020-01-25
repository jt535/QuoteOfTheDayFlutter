// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteResponse _$QuoteResponseFromJson(Map<String, dynamic> json) {
  return QuoteResponse(
    success: json['success'] == null
        ? null
        : QuoteResult.fromJson(json['success'] as Map<String, dynamic>),
    contents: json['contents'] == null
        ? null
        : QuoteContents.fromJson(json['contents'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuoteResponseToJson(QuoteResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'contents': instance.contents,
    };
