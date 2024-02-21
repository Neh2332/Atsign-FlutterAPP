import 'package:at_client/at_client.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'dart:io';

class BackendService {
  static Future<bool> validateAtsignAndKey(
      String atsign, String keyFileName) async {
    // Check if atsign and keyFileName are not null
    if (atsign == null || keyFileName == null) {
      print('Atsign or keyFileName is null');
      return false;
    }

    // Initialize the AtClient for the given atsign
    AtClientPreference preferences = AtClientPreference();

    // Read the key file
    String privateKey = await readFile(keyFileName);

    // Check if privateKey is not null
    if (privateKey == null) {
      print('Private key is null');
      return false;
    }

    // Set the current atsign with the private key
    // Replace 'your_namespace' with the namespace of your app
    String namespace = 'com.example.newapp';
    AtClientManager.getInstance()
        .setCurrentAtSign(atsign, namespace, preferences);

    // Get the AtClientManager instance
    AtClientManager? manager = AtClientManager.getInstance();

    // Check if AtClientManager is not null
    if (manager == null) {
      print('AtClientManager is null');
      return false;
    }

    // Get the AtClient instance
    AtClient atClient = manager.atClient;

    // Validate the atsign and key
    bool isValidAtsign = atsign == manager.atClient.getCurrentAtSign();
    bool isValidKey;
    try {
      AtValue keyValue = await atClient.get(AtKey()..key = privateKey);
      isValidKey = keyValue.value != null;
    } catch (e) {
      isValidKey = false;
    }

    return isValidAtsign && isValidKey;
  }

  static Future<String> readFile(String fileName) async {
    final file = File(fileName);
    return file.readAsString();
  }
}
