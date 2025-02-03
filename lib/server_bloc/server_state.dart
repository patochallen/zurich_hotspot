part of 'server_bloc.dart';

@freezed
class ServerState with _$ServerState {
  const factory ServerState({
    @Default(null) HttpServer? server,
    @Default(null) String? url,
    @Default(false) bool isServerActive,
  }) = _ServerState;
}
