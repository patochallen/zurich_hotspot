import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zurich/hotspot_bloc/hotspot_bloc.dart';
import 'package:zurich/server_bloc/server_bloc.dart';

extension BuildingContextExtension on BuildContext {
  // QuestionnaireBloc get questionnaireBloc => read<QuestionnaireBloc>();
  ServerBloc get serverBloc => read<ServerBloc>();
  HotspotBloc get hotspotBloc => read<HotspotBloc>();
}
