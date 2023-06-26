import 'package:flutter/material.dart';

import 'package:crypto/crypto.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:tickeep/generated/l10n.dart';
import 'package:tickeep/services/local_storage.dart';

class TicketsConfigure extends StatelessWidget {
  TicketsConfigure(
      {super.key,
      required this.ticketData,
      required this.confirmationButtonText});

  final Barcode ticketData;
  final String confirmationButtonText;
  final TextEditingController _ticketNameTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _ticketNameTextController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: () {
                writeTicketToLocalStorage(
                        sha256
                            .convert(List<int>.from(ticketData.rawBytes!))
                            .toString(),
                        ticketData.rawValue!)
                    .then((value) => Navigator.of(context).pop());
              },
              child: Text(confirmationButtonText))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
