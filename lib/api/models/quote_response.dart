import 'package:json_annotation/json_annotation.dart';
import 'package:quote_of_the_day/api/models/quote_contents.dart';
import 'package:quote_of_the_day/api/models/quote_result.dart';

@JsonSerializable()

part 'quote_response.g.dart';

@JsonSerializable()
class QuoteResponse {

  QuoteResult success;
  QuoteContents contents;

  QuoteResponse({this.success, this.contents});

  factory QuoteResponse.fromJson(Map<String, dynamic> json) => _$QuoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteResponseToJson(this);

}