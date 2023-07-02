// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      json['ticketTitle'] as String,
      json['ticketData'] as String,
      DateTime.parse(json['expirationDate'] as String),
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'ticketTitle': instance.ticketTitle,
      'ticketData': instance.ticketData,
      'expirationDate': instance.expirationDate.toIso8601String(),
    };
