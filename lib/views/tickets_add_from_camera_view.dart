import 'package:flutter/material.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:tickeep/generated/l10n.dart';
import 'package:tickeep/views/ticket_configure_view.dart';

class TicketsAddFromCameraView extends StatelessWidget {
  const TicketsAddFromCameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: MobileScannerController(),
      onDetect: (capture) {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext context) => TicketConfigure(
                  ticketData: capture.barcodes.first,
                  confirmationButtonText: S.of(context).add,
                )));
      },
    );
  }
}
