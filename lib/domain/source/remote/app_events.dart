// import dos pacotes
import 'package:firebase_analytics/firebase_analytics.dart';

class AppEvents {

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> sendScreen( String screenName ) async {
    await _analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenName,
    );
  }

  Future<void> sharedEvent( String eventName ) async {
    await _analytics.logEvent(name: eventName);
  }

}