import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:tickeep/generated/l10n.dart';
import 'package:tickeep/models/ticket_model.dart';
import 'package:tickeep/services/local_storage.dart';

class TicketsConfigure extends StatefulWidget {
  const TicketsConfigure(
      {super.key,
      required this.ticketData,
      required this.confirmationButtonText});

  final Barcode ticketData;
  final String confirmationButtonText;

  @override
  State<TicketsConfigure> createState() => _TicketsConfigureState();
}

class _TicketsConfigureState extends State<TicketsConfigure> {
  final TextEditingController _ticketNameTextController =
      TextEditingController();
  final TextEditingController _expirationDateTextController =
      TextEditingController();
  DateTime? expirationDate;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: _ticketNameTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).errorValueRequired;
                  }
                  return null;
                },
                maxLength: 32,
                decoration: InputDecoration(
                  labelText: S.of(context).title,
                  border: const OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: _expirationDateTextController,
                showCursor: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  ).then((value) {
                    expirationDate = value;
                    _expirationDateTextController.text =
                        DateFormat("dd/MM/yyyy").format(expirationDate!);
                  });
                },
                decoration: InputDecoration(
                  labelText:
                      "${S.of(context).expirationDate} (${S.of(context).optional})",
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final TicketModel ticket = TicketModel(
                _ticketNameTextController.text,
                widget.ticketData.rawValue!,
                expirationDate!,
              );
              writeTicketToLocalStorage(ticket)
                  .then((value) => Navigator.of(context).pop());
            }
          },
          label: Text(widget.confirmationButtonText)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
