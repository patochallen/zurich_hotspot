// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initServer,
    required TResult Function() closeServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initServer,
    TResult? Function()? closeServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initServer,
    TResult Function()? closeServer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerEventInitServer value) initServer,
    required TResult Function(_ServerEventCloseServer value) closeServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerEventInitServer value)? initServer,
    TResult? Function(_ServerEventCloseServer value)? closeServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerEventInitServer value)? initServer,
    TResult Function(_ServerEventCloseServer value)? closeServer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerEventCopyWith<$Res> {
  factory $ServerEventCopyWith(
          ServerEvent value, $Res Function(ServerEvent) then) =
      _$ServerEventCopyWithImpl<$Res, ServerEvent>;
}

/// @nodoc
class _$ServerEventCopyWithImpl<$Res, $Val extends ServerEvent>
    implements $ServerEventCopyWith<$Res> {
  _$ServerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerEventInitServerImplCopyWith<$Res> {
  factory _$$ServerEventInitServerImplCopyWith(
          _$ServerEventInitServerImpl value,
          $Res Function(_$ServerEventInitServerImpl) then) =
      __$$ServerEventInitServerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerEventInitServerImplCopyWithImpl<$Res>
    extends _$ServerEventCopyWithImpl<$Res, _$ServerEventInitServerImpl>
    implements _$$ServerEventInitServerImplCopyWith<$Res> {
  __$$ServerEventInitServerImplCopyWithImpl(_$ServerEventInitServerImpl _value,
      $Res Function(_$ServerEventInitServerImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerEventInitServerImpl implements _ServerEventInitServer {
  const _$ServerEventInitServerImpl();

  @override
  String toString() {
    return 'ServerEvent.initServer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerEventInitServerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initServer,
    required TResult Function() closeServer,
  }) {
    return initServer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initServer,
    TResult? Function()? closeServer,
  }) {
    return initServer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initServer,
    TResult Function()? closeServer,
    required TResult orElse(),
  }) {
    if (initServer != null) {
      return initServer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerEventInitServer value) initServer,
    required TResult Function(_ServerEventCloseServer value) closeServer,
  }) {
    return initServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerEventInitServer value)? initServer,
    TResult? Function(_ServerEventCloseServer value)? closeServer,
  }) {
    return initServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerEventInitServer value)? initServer,
    TResult Function(_ServerEventCloseServer value)? closeServer,
    required TResult orElse(),
  }) {
    if (initServer != null) {
      return initServer(this);
    }
    return orElse();
  }
}

abstract class _ServerEventInitServer implements ServerEvent {
  const factory _ServerEventInitServer() = _$ServerEventInitServerImpl;
}

/// @nodoc
abstract class _$$ServerEventCloseServerImplCopyWith<$Res> {
  factory _$$ServerEventCloseServerImplCopyWith(
          _$ServerEventCloseServerImpl value,
          $Res Function(_$ServerEventCloseServerImpl) then) =
      __$$ServerEventCloseServerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerEventCloseServerImplCopyWithImpl<$Res>
    extends _$ServerEventCopyWithImpl<$Res, _$ServerEventCloseServerImpl>
    implements _$$ServerEventCloseServerImplCopyWith<$Res> {
  __$$ServerEventCloseServerImplCopyWithImpl(
      _$ServerEventCloseServerImpl _value,
      $Res Function(_$ServerEventCloseServerImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerEventCloseServerImpl implements _ServerEventCloseServer {
  const _$ServerEventCloseServerImpl();

  @override
  String toString() {
    return 'ServerEvent.closeServer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerEventCloseServerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initServer,
    required TResult Function() closeServer,
  }) {
    return closeServer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initServer,
    TResult? Function()? closeServer,
  }) {
    return closeServer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initServer,
    TResult Function()? closeServer,
    required TResult orElse(),
  }) {
    if (closeServer != null) {
      return closeServer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerEventInitServer value) initServer,
    required TResult Function(_ServerEventCloseServer value) closeServer,
  }) {
    return closeServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerEventInitServer value)? initServer,
    TResult? Function(_ServerEventCloseServer value)? closeServer,
  }) {
    return closeServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerEventInitServer value)? initServer,
    TResult Function(_ServerEventCloseServer value)? closeServer,
    required TResult orElse(),
  }) {
    if (closeServer != null) {
      return closeServer(this);
    }
    return orElse();
  }
}

abstract class _ServerEventCloseServer implements ServerEvent {
  const factory _ServerEventCloseServer() = _$ServerEventCloseServerImpl;
}

/// @nodoc
mixin _$ServerState {
  HttpServer? get server => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  bool get isServerActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerStateCopyWith<ServerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerStateCopyWith<$Res> {
  factory $ServerStateCopyWith(
          ServerState value, $Res Function(ServerState) then) =
      _$ServerStateCopyWithImpl<$Res, ServerState>;
  @useResult
  $Res call({HttpServer? server, String? url, bool isServerActive});
}

/// @nodoc
class _$ServerStateCopyWithImpl<$Res, $Val extends ServerState>
    implements $ServerStateCopyWith<$Res> {
  _$ServerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? server = freezed,
    Object? url = freezed,
    Object? isServerActive = null,
  }) {
    return _then(_value.copyWith(
      server: freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as HttpServer?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      isServerActive: null == isServerActive
          ? _value.isServerActive
          : isServerActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerStateImplCopyWith<$Res>
    implements $ServerStateCopyWith<$Res> {
  factory _$$ServerStateImplCopyWith(
          _$ServerStateImpl value, $Res Function(_$ServerStateImpl) then) =
      __$$ServerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HttpServer? server, String? url, bool isServerActive});
}

/// @nodoc
class __$$ServerStateImplCopyWithImpl<$Res>
    extends _$ServerStateCopyWithImpl<$Res, _$ServerStateImpl>
    implements _$$ServerStateImplCopyWith<$Res> {
  __$$ServerStateImplCopyWithImpl(
      _$ServerStateImpl _value, $Res Function(_$ServerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? server = freezed,
    Object? url = freezed,
    Object? isServerActive = null,
  }) {
    return _then(_$ServerStateImpl(
      server: freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as HttpServer?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      isServerActive: null == isServerActive
          ? _value.isServerActive
          : isServerActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ServerStateImpl implements _ServerState {
  const _$ServerStateImpl(
      {this.server = null, this.url = null, this.isServerActive = false});

  @override
  @JsonKey()
  final HttpServer? server;
  @override
  @JsonKey()
  final String? url;
  @override
  @JsonKey()
  final bool isServerActive;

  @override
  String toString() {
    return 'ServerState(server: $server, url: $url, isServerActive: $isServerActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerStateImpl &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.isServerActive, isServerActive) ||
                other.isServerActive == isServerActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, server, url, isServerActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerStateImplCopyWith<_$ServerStateImpl> get copyWith =>
      __$$ServerStateImplCopyWithImpl<_$ServerStateImpl>(this, _$identity);
}

abstract class _ServerState implements ServerState {
  const factory _ServerState(
      {final HttpServer? server,
      final String? url,
      final bool isServerActive}) = _$ServerStateImpl;

  @override
  HttpServer? get server;
  @override
  String? get url;
  @override
  bool get isServerActive;
  @override
  @JsonKey(ignore: true)
  _$$ServerStateImplCopyWith<_$ServerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
