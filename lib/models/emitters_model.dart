import 'dart:io';
import 'package:pi_mote/messages/presence_notification.pb.dart';

final InternetAddress DISCOVERY_ADDR = InternetAddress("225.1.2.3");
const int             DISCOVERY_PORT = 5000;

typedef Emitters = Map<String, EmitterData>;

typedef EmittingEntity =({
  String name,
  EmitterData data
});

class EmitterData {
  String   description;
  String   ip_addr;
  DateTime last_reported;

  EmitterData(this.description, this.ip_addr, this.last_reported);
}

class EmittersModel {
  //EmittersModel() {
  //  RawDatagramSocket.bind(InternetAddress.anyIPv4, DISCOVERY_PORT)
  //    .then((RawDatagramSocket socket){
  //      socket.joinMulticast(DISCOVERY_ADDR);

  //      socket.listen((RawSocketEvent e){
  //        Datagram? d = socket.receive();
  //        if (d == null) return;

  //        PresenceNotification pn = PresenceNotification.fromBuffer(d.data);
  //        print('From: ${d.address.address}:${d.port}');
  //        print('\tName: ${pn.name}');
  //        print('\tDesc: ${pn.description}');
  //      });
  //  });
  //}

  Stream<EmittingEntity> getEventStream() async* {
    final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, DISCOVERY_PORT);
    socket.joinMulticast(DISCOVERY_ADDR);

    //socket.listen((RawSocketEvent e){
    //  Datagram? d = socket.receive();
    //  if (d == null) return;
    //
    //  PresenceNotification pn = PresenceNotification.fromBuffer(d.data);
    //  print('From: ${d.address.address}:${d.port}');
    //  print('\tName: ${pn.name}');
    //  print('\tDesc: ${pn.description}');
    //});

    await for (final event in socket) {
      Datagram? d = socket.receive();
      if (d == null) continue;

      PresenceNotification pn = PresenceNotification.fromBuffer(d.data);
      yield ( name: pn.name,
              data: EmitterData(pn.description, d.address.address, DateTime.now())
            );
    }
  }
}
