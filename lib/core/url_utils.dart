import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens an external URL reliably across web and mobile.
/// Avoids [canLaunchUrl] which often returns false on Flutter web for https links.
Future<bool> openExternalUrl(String url) async {
  if (url.trim().isEmpty) return false;

  final uri = Uri.tryParse(url);
  if (uri == null) return false;

  try {
    return await launchUrl(
      uri,
      mode: kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication,
      webOnlyWindowName: kIsWeb ? '_blank' : null,
    );
  } catch (_) {
    return false;
  }
}

bool hasPlayStoreUrl(String? url) => url != null && url.trim().isNotEmpty;
