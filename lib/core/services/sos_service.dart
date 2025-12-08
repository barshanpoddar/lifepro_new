import 'package:lifepro_new/domain/entities/user_profile.dart';
import 'package:url_launcher/url_launcher.dart';

class SOSService {


  Future<void> sendSOSAlert(UserProfile profile) async {
    // Since emergency contacts are removed, directly call emergency services
    // Using default emergency number - adjust based on location if needed

    try {
      // Call emergency services - using 911 as default
      final callUri = Uri.parse('tel:911');
      await launchUrl(callUri);
    } catch (e) {
      throw Exception('Failed to call emergency services: $e');
    }
  }

  Future<List<EmergencyServiceInfo>> getNearestEmergencyServices(double? latitude, double? longitude) async {
    // For simplicity, return static list. In real app, would use places API or database
    // Detect country from location or profile
    return [
      EmergencyServiceInfo(
        name: 'Emergency Services',
        phone: '911', // US
        type: 'Police/Fire/Medical',
      ),
      EmergencyServiceInfo(
        name: 'Nearest Hospital',
        phone: 'Emergency',
        type: 'Hospital',
      ),
      EmergencyServiceInfo(
        name: 'Ambulance',
        phone: '102', // India example
        type: 'Medical',
      ),
    ];
  }
}

class EmergencyServiceInfo {
  final String name;
  final String phone;
  final String type;

  EmergencyServiceInfo({required this.name, required this.phone, required this.type});
}
