import 'package:json_annotation/json_annotation.dart';

part 'ticket_model.g.dart';

@JsonSerializable()
class TicketModel {
  final String ticketId;
  final DateTime eventDate;
  final DateTime expirationDate;

  TicketModel(this.ticketId, this.eventDate, this.expirationDate);

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);
}
