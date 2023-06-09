
import 'request.dart';

abstract class Remote {
  Future<dynamic> loginRTAF(Map<String, String> body);
}

class RemoteImpl extends Remote {
  @override
  Future<dynamic> loginRTAF(Map<String, String> body) async {
    final response = await post("", body);
    return response;
  }
}
