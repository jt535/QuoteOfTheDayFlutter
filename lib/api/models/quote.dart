import 'package:json_annotation/json_annotation.dart';


part 'quote.g.dart';

@JsonSerializable()
class Quote {

  String quote;
  String length;
  String author;
  List<String> tags;
  String category;
  DateTime date;
  String permalink;
  String title;
  String background;
  String id;

  Quote({this.quote, this.length, this.author, this.tags, this.category,
      this.date, this.permalink, this.title, this.background, this.id});

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
