import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:tickeep/generated/l10n.dart';
import 'package:tickeep/models/ticket_model.dart';

class TicketDisplayView extends StatelessWidget {
  const TicketDisplayView({super.key, required this.ticket});

  final TicketModel ticket;

  Future<void> showDeleteTicketDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(S.of(context).delete),
            content: Text(S.of(context).deleteTicketConfirm),
            actions: <Widget>[
              TextButton(
                child: Text(S.of(context).cancel),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  S.of(context).delete,
                  style: const TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  // Delete
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ticket.ticketTitle), actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          tooltip: S.of(context).editTicket,
          onPressed: () {
            // edit
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          tooltip: S.of(context).deleteTicket,
          onPressed: () => showDeleteTicketDialog(context),
        ),
      ]),
      body: Center(
        child: QrImageView(
          data: ticket.ticketData,
          size: 200,
        ),
      ),
    );
  }
}
