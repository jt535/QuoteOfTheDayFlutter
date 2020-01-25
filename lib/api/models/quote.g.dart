// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return Quote(
    quote: json['quote'] as String,
    length: json['length'] as String,
    author: json['author'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    category: json['category'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    permalink: json['permalink'] as String,
    title: json['title'] as String,
    background: json['background'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'quote': instance.quote,
      'length': instance.length,
      'author': instance.author,
      'tags': instance.tags,
      'category': instance.category,
      'date': instance.date?.toIso8601String(),
      'permalink': instance.permalink,
      'title': instance.title,
      'background': instance.background,
      'id': instance.id,
    };
