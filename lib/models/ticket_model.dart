import 'package:json_annotation/json_annotation.dart';

part 'ticket_model.g.dart';

@JsonSerializable()
class TicketModel {
  final String ticketTitle;
  final String ticketData;
  final DateTime expirationDate;

  TicketModel(this.ticketTitle, this.ticketData, this.expirationDate);

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}
