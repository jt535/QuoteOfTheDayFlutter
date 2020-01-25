import 'package:json_annotation/json_annotation.dart';
import 'package:quote_of_the_day/api/models/quote.dart';

part 'quote_contents.g.dart';

@JsonSerializable()
class QuoteContents {

  String copyright;
  List<Quote> quotes;

  QuoteContents({this.copyright, this.quotes});

  factory QuoteContents.fromJson(Map<String, dynamic> json) => _$QuoteContentsFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteContentsToJson(this);

}