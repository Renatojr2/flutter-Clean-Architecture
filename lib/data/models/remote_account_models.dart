import 'package:fordev/domain/entities/account_entity.dart';

class RemoteAccountModels {
  final String accessToken;

  RemoteAccountModels(this.accessToken);

  factory RemoteAccountModels.fromJson(Map json) {
    return RemoteAccountModels(json['accessToken']);
  }

  AccountEntity toEntity() => AccountEntity(accessToken);
}
