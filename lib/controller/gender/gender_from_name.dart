import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_booking/models/gender/gender_from_name_model.dart';
import 'package:hotel_booking/network/requests.dart';

final genderFromNameProvider = FutureProvider.family((ref, String url) {
  return GenderFromNameController().getData(url);
});

class GenderFromNameController with HTTPRequests {
  Future<GenderModel?> getData(String name) async {
    final url = "https://api.genderize.io/?name=$name";
    final data = await getRequest(url);

    if (data != null) return genderModelFromJson(data);
    return null;
  }
}
