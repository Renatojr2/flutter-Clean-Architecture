import '../../domain/entities/account_entity.dart';

import '../http/http.dart';

class RemoteAccountModels {
  final String accessToken;

  RemoteAccountModels(this.accessToken);

  factory RemoteAccountModels.fromJson(Map json) {
    if (!json.containsKey('accessToken')) {
      throw HttpError.inalidData;
    }
    return RemoteAccountModels(json['accessToken']);
  }

  AccountEntity toEntity() => AccountEntity(accessToken);
}
