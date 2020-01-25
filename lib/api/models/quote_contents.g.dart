// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_contents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteContents _$QuoteContentsFromJson(Map<String, dynamic> json) {
  return QuoteContents(
    copyright: json['copyright'] as String,
    quotes: (json['quotes'] as List)
        ?.map(
            (e) => e == null ? null : Quote.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuoteContentsToJson(QuoteContents instance) =>
    <String, dynamic>{
      'copyright': instance.copyright,
      'quotes': instance.quotes,
    };
