// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      json['ticketId'] as String,
      DateTime.parse(json['eventDate'] as String),
      DateTime.parse(json['expirationDate'] as String),
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'ticketId': instance.ticketId,
      'eventDate': instance.eventDate.toIso8601String(),
      'expirationDate': instance.expirationDate.toIso8601String(),
    };
