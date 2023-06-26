import 'package:flutter/material.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:tickeep/generated/l10n.dart';
import 'package:tickeep/views/tickets_configure.dart';

class TicketsAddFromCameraView extends StatelessWidget {
  const TicketsAddFromCameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: MobileScannerController(),
      onDetect: (capture) {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext context) => TicketsConfigure(
                  ticketData: capture.barcodes.first,
                  confirmationButtonText: S.of(context).add,
                )));
      },
    );
  }
}
