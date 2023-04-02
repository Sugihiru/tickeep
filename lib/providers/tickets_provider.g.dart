// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserTicketsHash() => r'aa398366c94d725e364680237c1dd89f4d2b4333';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetUserTicketsRef = AutoDisposeStreamProviderRef<List<TicketModel>>;

/// See also [getUserTickets].
@ProviderFor(getUserTickets)
const getUserTicketsProvider = GetUserTicketsFamily();

/// See also [getUserTickets].
class GetUserTicketsFamily extends Family<AsyncValue<List<TicketModel>>> {
  /// See also [getUserTickets].
  const GetUserTicketsFamily();

  /// See also [getUserTickets].
  GetUserTicketsProvider call({
    bool expired = false,
  }) {
    return GetUserTicketsProvider(
      expired: expired,
    );
  }

  @override
  GetUserTicketsProvider getProviderOverride(
    covariant GetUserTicketsProvider provider,
  ) {
    return call(
      expired: provider.expired,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserTicketsProvider';
}

/// See also [getUserTickets].
class GetUserTicketsProvider
    extends AutoDisposeStreamProvider<List<TicketModel>> {
  /// See also [getUserTickets].
  GetUserTicketsProvider({
    this.expired = false,
  }) : super.internal(
          (ref) => getUserTickets(
            ref,
            expired: expired,
          ),
          from: getUserTicketsProvider,
          name: r'getUserTicketsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserTicketsHash,
          dependencies: GetUserTicketsFamily._dependencies,
          allTransitiveDependencies:
              GetUserTicketsFamily._allTransitiveDependencies,
        );

  final bool expired;

  @override
  bool operator ==(Object other) {
    return other is GetUserTicketsProvider && other.expired == expired;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, expired.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
