import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tickeep/generated/l10n.dart';
import 'package:tickeep/providers/tickets_provider.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).appName),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Current"),
                Tab(text: "Expired"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TicketsListView(),
              TicketsListView(),
            ],
          ),
        ));
  }
}

class TicketsListView extends ConsumerWidget {
  const TicketsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTicketsWatch = ref.watch(getUserTicketsProvider());

    return userTicketsWatch.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text(error.toString()),
        data: (tickets) {
          return Text(tickets.length.toString());
        });
  }
}
