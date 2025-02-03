part of 'server_bloc.dart';

@freezed
class ServerEvent with _$ServerEvent {
  const factory ServerEvent.initServer() = _ServerEventInitServer;

  const factory ServerEvent.closeServer() = _ServerEventCloseServer;
}
