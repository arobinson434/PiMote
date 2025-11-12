import 'dart:io';
import 'package:android_multicast_lock/android_multicast_lock.dart';

import 'package:pi_mote/messages/ir_command.pb.dart';
import 'package:pi_mote/storage/button_data.dart';

final InternetAddress CMD_RCV_ADDR = InternetAddress("225.1.2.3");
const int             CMD_RCV_PORT = 5001;

typedef CommandInfo = ({
  String        name,
  CommandDeltas command
});

class CommandReceiver {
  RawDatagramSocket? _socket;

  Future<void> init() async {
    AndroidMulticastLock().acquire();
    
    _socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4,
                                           CMD_RCV_PORT, reusePort: true);
    _socket?.joinMulticast(CMD_RCV_ADDR);
  }

  void dispose() {
    AndroidMulticastLock().release();

    _socket?.close();
  }

  Future<CommandInfo?> getCommand() async {
    if( _socket == null )
      throw Exception("CommandReceiver::getCommand() called before initialization;"+
                      "Call init() before callink this function!");

    CommandInfo? command_info;

    await for( final event in _socket! ) {
      if( event == RawSocketEvent.read ) {
        Datagram? d = _socket?.receive();
        if (d == null) continue;

        IrCommand ir_cmd = IrCommand.fromBuffer(d.data);
        command_info = ( name: ir_cmd.name,
                         command: ir_cmd.interval.toList() );
        _socket?.close();
      }
    }

    return command_info;
  }
}
