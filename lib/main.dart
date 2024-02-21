import 'package:flutter/material.dart';
import 'package:at_onboarding_flutter/at_onboarding_flutter.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (BuildContext context) => Onboarding(
          atClientPreference: AtClientPreference(),
          domain: 'root.atsign.org',
          rootEnvironment: 'prod',
          appColor: Color.fromARGB(255, 240, 94, 62),
          onboard: (Map<String?, AtClientService> value, String? atsign) {
            print('Onboarding successful');
            // Navigate to LoginPage after successful onboarding
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          onError: (Object error) {
            print('Onboarding failed: $error');
          },
        ),
      ),
    );
  }
}
