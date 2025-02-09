import 'dart:io';
import 'package:android_multicast_lock/android_multicast_lock.dart';

import 'package:pi_mote/messages/ir_command.pb.dart';

final InternetAddress CMD_RCV_ADDR = InternetAddress("225.1.2.3");
const int             CMD_RCV_PORT = 5001;

final InternetAddress CMD_SND_ADDR = InternetAddress("225.1.2.3");
const int             CMD_SND_PORT = 5002;

class CmdMgrModel {
  Future<IrCommand?> getCommand() async {
    IrCommand? command;

    final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, CMD_RCV_PORT);
    socket.joinMulticast(CMD_RCV_ADDR);

    AndroidMulticastLock().acquire();

    await socket.listen(
      (RawSocketEvent e){
        Datagram? d = socket.receive();
        if (d != null) {
          command = IrCommand.fromBuffer(d.data);
          socket.close();
        }
      }
    )
    .asFuture()
    .timeout(
      Duration(seconds:15),
      onTimeout: () {
        socket.close();
        return Future<IrCommand?>.value();
      }
    );

    AndroidMulticastLock().release();

    return command;
  }

  Future<void> sendCommand(IrCommand command) async {
    final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, CMD_SND_PORT);

    socket.listen(
      (RawSocketEvent e){
        if ( e == RawSocketEvent.write ) {
          if ( socket.send(command.writeToBuffer(), CMD_SND_ADDR, CMD_SND_PORT) > 0 )
            socket.close();
        }
      }
    );
  }
}
