import 'package:google_api_availability/google_api_availability.dart';

Future<void> checkGooglePlayServices() async {
  final GooglePlayServicesAvailability availability =
      await GoogleApiAvailability.instance.checkGooglePlayServicesAvailability();

  if (availability == GooglePlayServicesAvailability.success) {
    print("Google Play Services está disponível.");
  } else {
    print("Google Play Services não está disponível: $availability");
  }
}