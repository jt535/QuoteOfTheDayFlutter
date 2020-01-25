import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

part 'quote_result.g.dart';

@JsonSerializable()
class QuoteResult {

  final int total;

  QuoteResult({this.total});

  factory QuoteResult.fromJson(Map<String, dynamic> json) => _$QuoteResultFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteResultToJson(this);

}