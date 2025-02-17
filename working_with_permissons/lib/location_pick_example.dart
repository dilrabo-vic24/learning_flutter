import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:working_with_permissons/location_service.dart';

class LocationPickExample extends StatelessWidget {
  LocationPickExample({super.key});

  ValueNotifier<String?> locationLink = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final locData = await LocationService().getLocationData();
          final latitude = locData.latitude;
          final longitude = locData.longitude;

          locationLink.value =
              "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
          _launchMaps(locationLink.value!);
          log(longitude.toString());
          log(latitude.toString());
        },
        child: Icon(Icons.location_on_rounded),
      ),
      body: ValueListenableBuilder(
        valueListenable: locationLink,
        builder: (context, locLinkValue, child) {
          if (locLinkValue != null) {
            return GestureDetector(
              // onTap: () => _launchMaps(locLinkValue),
              child: Center(
                child: Text(locLinkValue,
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline)),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Future<void> _launchMaps(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      log("URL ochib bo'lmadi: $url");
    }
  }
}
