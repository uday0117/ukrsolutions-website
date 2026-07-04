import 'dart:js_interop';

@JS('updateAdPolicy')
external void _updateAdPolicy(String path);

void updateAdsForPath(String path) {
  _updateAdPolicy(path);
}
