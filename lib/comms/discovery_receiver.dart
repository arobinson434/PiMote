import 'dart:io';
import 'package:android_multicast_lock/android_multicast_lock.dart';

import 'package:pi_mote/messages/presence_notification.pb.dart';

final InternetAddress DISCOVERY_ADDR = InternetAddress("225.1.2.3");
const int             DISCOVERY_PORT = 5000;

typedef DeviceInfo = ({
  String   name,
  String   description,
  String   ip_addr,
});

class DiscoveryReceiver {
  void init() {
    AndroidMulticastLock().acquire();
  }

  void dispose() {
    AndroidMulticastLock().release();
  }

  Stream<DeviceInfo> getEventStream() async* {
    final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4,
                                                DISCOVERY_PORT, reusePort: true);
    socket.joinMulticast(DISCOVERY_ADDR);

    await for (final event in socket) {
      Datagram? d = socket.receive();
      if (d == null) continue;

      PresenceNotification pn = PresenceNotification.fromBuffer(d.data);
      yield (
        name:          pn.name,
        description:   pn.description, 
        ip_addr:       d.address.address
      );
    }
  }
}
