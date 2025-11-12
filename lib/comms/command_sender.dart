import 'dart:io';

import 'package:pi_mote/messages/ir_command.pb.dart';
import 'package:pi_mote/storage/button_data.dart';

final InternetAddress CMD_SND_ADDR = InternetAddress("225.1.2.3");
const int             CMD_SND_PORT = 5002;

class CommandSender {
  static Future<void> send(CommandDeltas command, String device) async {
    final msg    = IrCommand(name: device, interval: command);
    final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4,
                                                CMD_SND_PORT, reusePort: true);

    socket.listen(
      (RawSocketEvent e){
        if ( e == RawSocketEvent.write ) {
          if ( socket.send(msg.writeToBuffer(), CMD_SND_ADDR, CMD_SND_PORT) > 0 )
            socket.close();
        }
      }
    );
  }
}
