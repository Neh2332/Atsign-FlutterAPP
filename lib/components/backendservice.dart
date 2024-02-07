import 'package:at_client/at_client.dart';
import 'package:at_commons/at_commons.dart';

class BackendService {
  AtClient? atClient;

  Future<bool> authenticateFile(List<int> fileContents) async {
    // Convert the file contents to a string
    String fileContentsString = String.fromCharCodes(fileContents);

    // Create an AtKey object for the file
    AtKey atKey = AtKey();
    atKey.key = 'file';
    atKey.sharedWith = '@sign'; // Replace with the @sign of the recipient

    // Put the file on the @platform server
    bool putResult = await atClient!.put(atKey, fileContentsString);
    if (!putResult) {
      return false;
    }

    // Get the authentication result from the server
    AtValue? atValue = await atClient!.get(atKey);
    if (atValue == null) {
      return false;
    }

    // Check the authentication result
    bool isValid = atValue.value == 'Good';
    return isValid;
  }
}
