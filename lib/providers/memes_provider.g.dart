// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMemesHash() => r'e70d4ca627924b371e955b7fdd864e12d008a1c6';

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

/// See also [getMemes].
@ProviderFor(getMemes)
const getMemesProvider = GetMemesFamily();

/// See also [getMemes].
class GetMemesFamily extends Family<AsyncValue<List<MemeModel>>> {
  /// See also [getMemes].
  const GetMemesFamily();

  /// See also [getMemes].
  GetMemesProvider call({
    String? subreddit,
    int? count,
  }) {
    return GetMemesProvider(
      subreddit: subreddit,
      count: count,
    );
  }

  @override
  GetMemesProvider getProviderOverride(
    covariant GetMemesProvider provider,
  ) {
    return call(
      subreddit: provider.subreddit,
      count: provider.count,
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
  String? get name => r'getMemesProvider';
}

/// See also [getMemes].
class GetMemesProvider extends AutoDisposeFutureProvider<List<MemeModel>> {
  /// See also [getMemes].
  GetMemesProvider({
    String? subreddit,
    int? count,
  }) : this._internal(
          (ref) => getMemes(
            ref as GetMemesRef,
            subreddit: subreddit,
            count: count,
          ),
          from: getMemesProvider,
          name: r'getMemesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMemesHash,
          dependencies: GetMemesFamily._dependencies,
          allTransitiveDependencies: GetMemesFamily._allTransitiveDependencies,
          subreddit: subreddit,
          count: count,
        );

  GetMemesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subreddit,
    required this.count,
  }) : super.internal();

  final String? subreddit;
  final int? count;

  @override
  Override overrideWith(
    FutureOr<List<MemeModel>> Function(GetMemesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMemesProvider._internal(
        (ref) => create(ref as GetMemesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subreddit: subreddit,
        count: count,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MemeModel>> createElement() {
    return _GetMemesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMemesProvider &&
        other.subreddit == subreddit &&
        other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subreddit.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMemesRef on AutoDisposeFutureProviderRef<List<MemeModel>> {
  /// The parameter `subreddit` of this provider.
  String? get subreddit;

  /// The parameter `count` of this provider.
  int? get count;
}

class _GetMemesProviderElement
    extends AutoDisposeFutureProviderElement<List<MemeModel>> with GetMemesRef {
  _GetMemesProviderElement(super.provider);

  @override
  String? get subreddit => (origin as GetMemesProvider).subreddit;
  @override
  int? get count => (origin as GetMemesProvider).count;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
