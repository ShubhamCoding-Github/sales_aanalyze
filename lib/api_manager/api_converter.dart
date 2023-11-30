import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sales_aanalyze/model/profile_screen_api.dart';
import '../model/LoginApi.dart';


class HttpService {
  final String postsURL =
      "https://v1.checkprojectstatus.com/businessinsights/api/user/profile";
  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNzY2ZDc5ZTcwYTg3NmY1ZjZhMGQyYTY3YWFiMmZiYmIyOWU5OGMyYmE1NGEwM2M4ZDc5YjVlOGMyOTRkYTlkMmQ2MmQ4ZWZkOWU3MzQ3MTkiLCJpYXQiOjE2ODkwNzkwMTUuODExNjE4LCJuYmYiOjE2ODkwNzkwMTUuODExNjIsImV4cCI6MTcyMDcwMTQxNS44MDc1ODYsInN1YiI6IjUiLCJzY29wZXMiOltdfQ.mZcu_EHoQr6gt47fWPN20qvJeObG-p7RvLIlQI5lTxoSJNNSSDhaWYh2jdO28rHWiLKmvA2n_QolHSEqmnXlfveE9GghQ3xYUZENpnVHmeGxcftTrw-J6jrGj0lpqwt-F-5HSnU5yBzzA7b-_-5MOUW-2CFkVw0o7QHTu9LrvVqbPawio2moto67Nfj1Li65CrOOmH-IqIPfAlj0CMz0b7zGZaN3pIwv4bMw10PZQknpDLXP4ZVMm254dLcsgwM8m14ZOTkRWQVt-cM49DuMzRT5Hr1JNI3yF1Wxb4SjZ5oXdcxcO2uLNMlT1JjwNpOs4kEpOdCf060t1a2k5zLu0MIz6YpO9RntaQKGncvoAgCrYtSaWgANVOGY5vQc-HPHXqICIUB995-9AiehTrT_5qwUwN8UMQ56jx8UAnUja4XBsNsLEWwCeAJNZO0BorxcJojZT5qKGE-V-kV2XDmsTyI4fFRD6LUHOsQDr87MdRvIteyE2rzOuOEha9seYW_nWu-9ntjm1nSkqLZ0anvg74OM3ssXp8gvjApzHlvwRqb7gblV8hQ9_g3bJyOmshJr91ggRtXu325NBl2AWXffq0C3MBGvTw49LMSQP503g5ppam1yqS41NkeAaOj0Rmzk0oRrjqIrso7cwVeoJPE932rP_M2J_fNM2O5DtvQH-Gs";
  Future<ProfileApiResponse> getPosts() async {
    var res = await http.get(Uri.parse(postsURL), headers: {
      'Authorization': 'Bearer $token',
    });
    print("response");
    print(res.body);
    if (res.statusCode == 200) {
      return ProfileApiResponse.fromJson(jsonDecode(res.body));
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}

class LoginApi {
  final String LoginURL =
      "https://v1.checkprojectstatus.com/businessinsights/api/login";
  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNzY2ZDc5ZTcwYTg3NmY1ZjZhMGQyYTY3YWFiMmZiYmIyOWU5OGMyYmE1NGEwM2M4ZDc5YjVlOGMyOTRkYTlkMmQ2MmQ4ZWZkOWU3MzQ3MTkiLCJpYXQiOjE2ODkwNzkwMTUuODExNjE4LCJuYmYiOjE2ODkwNzkwMTUuODExNjIsImV4cCI6MTcyMDcwMTQxNS44MDc1ODYsInN1YiI6IjUiLCJzY29wZXMiOltdfQ.mZcu_EHoQr6gt47fWPN20qvJeObG-p7RvLIlQI5lTxoSJNNSSDhaWYh2jdO28rHWiLKmvA2n_QolHSEqmnXlfveE9GghQ3xYUZENpnVHmeGxcftTrw-J6jrGj0lpqwt-F-5HSnU5yBzzA7b-_-5MOUW-2CFkVw0o7QHTu9LrvVqbPawio2moto67Nfj1Li65CrOOmH-IqIPfAlj0CMz0b7zGZaN3pIwv4bMw10PZQknpDLXP4ZVMm254dLcsgwM8m14ZOTkRWQVt-cM49DuMzRT5Hr1JNI3yF1Wxb4SjZ5oXdcxcO2uLNMlT1JjwNpOs4kEpOdCf060t1a2k5zLu0MIz6YpO9RntaQKGncvoAgCrYtSaWgANVOGY5vQc-HPHXqICIUB995-9AiehTrT_5qwUwN8UMQ56jx8UAnUja4XBsNsLEWwCeAJNZO0BorxcJojZT5qKGE-V-kV2XDmsTyI4fFRD6LUHOsQDr87MdRvIteyE2rzOuOEha9seYW_nWu-9ntjm1nSkqLZ0anvg74OM3ssXp8gvjApzHlvwRqb7gblV8hQ9_g3bJyOmshJr91ggRtXu325NBl2AWXffq0C3MBGvTw49LMSQP503g5ppam1yqS41NkeAaOj0Rmzk0oRrjqIrso7cwVeoJPE932rP_M2J_fNM2O5DtvQH-Gs";
  Future<LoginApiResponse> getPosts() async {
    var res = await http.get(Uri.parse(LoginURL), headers: {
      'Authorization': 'Bearer $token',
    });
    print("response");
    print(res.body);
    if (res.statusCode == 200) {
      return LoginApiResponse.fromJson(jsonDecode(res.body));
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
