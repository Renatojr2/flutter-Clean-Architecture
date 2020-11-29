import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';
import '../../domain/helpes/domain_error.dart';
import '../../domain/usecases/usecases.dart';

import '../models/models.dart';
import '../http/http.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });

  Future<AccountEntity> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();

    try {
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);
      return RemoteAccountModels.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.unauThorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({
    @required this.email,
    @required this.password,
  });

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) {
    return RemoteAuthenticationParams(
        email: params.email, password: params.password);
  }

  Map toJson() => {'email': email, 'password': password};
}
