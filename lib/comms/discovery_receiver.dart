import 'dart:io';
import 'package:android_multicast_lock/android_multicast_lock.dart';

import 'package:pi_mote/messages/presence_notification.pb.dart';

final InternetAddress DISCOVERY_ADDR = InternetAddress("225.1.2.3");
const int             DISCOVERY_PORT = 5000;

typedef DeviceInfo = ({
  String name,
  String description,
  String ip_addr,
});

class DiscoveryReceiver {
  RawDatagramSocket? _socket;

  Future<void> init() async {
    AndroidMulticastLock().acquire();
    
    _socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4,
                                           DISCOVERY_PORT, reusePort: true);
    _socket?.joinMulticast(DISCOVERY_ADDR);
  }

  void dispose() {
    AndroidMulticastLock().release();

    _socket?.close();
  }

  Stream<DeviceInfo> getEventStream() async* {
    if( _socket == null )
      throw Exception("DiscoveryReceiver::getEventStream called before initialization;"+
                      "Call init() before callink this function!");

    await for (final event in _socket!) {
      if( event == RawSocketEvent.read ) {
        Datagram? d = _socket!.receive();
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
}
