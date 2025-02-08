import 'dart:io';

import 'package:pi_mote/messages/presence_notification.pb.dart';

final InternetAddress DISCOVERY_ADDR = InternetAddress("225.1.2.3");
const int             DISCOVERY_PORT = 5000;

typedef Devices = Map<String, DeviceData>;

typedef EmittingEntity =({
  String     name,
  DeviceData data
});

class DeviceData {
  String   description;
  String   ip_addr;
  DateTime last_reported;

  DeviceData(this.description, this.ip_addr, this.last_reported);
}

class DevicesModel {
  Stream<EmittingEntity> getEventStream() async* {
    final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, DISCOVERY_PORT);
    socket.joinMulticast(DISCOVERY_ADDR);

    await for (final event in socket) {
      Datagram? d = socket.receive();
      if (d == null) continue;

      PresenceNotification pn = PresenceNotification.fromBuffer(d.data);
      yield ( name: pn.name,
              data: DeviceData(pn.description, d.address.address, DateTime.now())
            );
    }
  }
}
