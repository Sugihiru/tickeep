import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tickeep/generated/l10n.dart';
import 'package:tickeep/models/ticket_model.dart';
import 'package:tickeep/providers/tickets_provider.dart';
import 'package:tickeep/views/ticket_display_view.dart';
import 'package:tickeep/views/tickets_add_from_camera_view.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
      ),
      body: const TicketsListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (_) => const TicketsAddFromCameraView()),
          )
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class TicketsListView extends ConsumerWidget {
  const TicketsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTicketsWatch = ref.watch(getUserTicketsProvider);

    return Padding(
      padding: const EdgeInsets.all(30),
      child: userTicketsWatch.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text(error.toString()),
          data: (tickets) {
            return GridView.count(crossAxisCount: 2, children: [
              for (var ticket in tickets.values)
                TicketsListElement(ticket: ticket)
            ]);
          }),
    );
  }
}

class TicketsListElement extends StatelessWidget {
  const TicketsListElement({super.key, required this.ticket});

  final TicketModel ticket;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Center(
          child: Text(
            ticket.ticketTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext context) => TicketDisplayView(
                  ticket: ticket,
                )));
      },
      onLongPress: () {},
    );
  }
}
