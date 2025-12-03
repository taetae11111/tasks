// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(todoRepository)
const todoRepositoryProvider = TodoRepositoryProvider._();

final class TodoRepositoryProvider
    extends
        $FunctionalProvider<IToDoRepository, IToDoRepository, IToDoRepository>
    with $Provider<IToDoRepository> {
  const TodoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoRepositoryHash();

  @$internal
  @override
  $ProviderElement<IToDoRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IToDoRepository create(Ref ref) {
    return todoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IToDoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IToDoRepository>(value),
    );
  }
}

String _$todoRepositoryHash() => r'b5be649b222bd4c2dcd30d6bd3e2f93758b3e0ce';
