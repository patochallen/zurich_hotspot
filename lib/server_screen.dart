import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zurich/common/qr_view.dart';
import 'package:zurich/server_bloc/server_bloc.dart';
import 'package:zurich/extensions/context_extension.dart';

class ServerScreen extends StatelessWidget {
  const ServerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerBloc, ServerState>(
      bloc: context.serverBloc,
      builder: (context, state) {
        return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                state.isServerActive ? 'Server is running' : 'Server is stopped',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (state.isServerActive) {
                    context.serverBloc.add(const ServerEvent.closeServer());
                  } else {
                    context.serverBloc.add(const ServerEvent.initServer());
                  }
                },
                child: Text(state.isServerActive ? 'Stop Server' : 'Start Server'),
              ),
              const SizedBox(height: 20),
              if (state.url != null) Expanded(child: QrView(title: 'Connect to Server', data: state.url!)),
              const SizedBox(height: 20),
              if (state.url != null)
                GestureDetector(
                  onTap: () => _launchUrl(state.url!),
                  child: Text(state.url!, style: const TextStyle(fontSize: 20)),
                ),
            ],
          ),
        );
      },
    );
  }
}

void _launchUrl(String url) async {
  try {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } catch (e) {
    print('SARASA ERROR: $e');
  }
}

