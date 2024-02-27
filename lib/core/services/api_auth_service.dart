import 'package:dio/dio.dart';
import 'package:flutter_pos/core/constant/api_auth_const.dart';
import 'package:flutter_pos/core/services/request/login_rq.dart';
import 'package:flutter_pos/core/services/response/login_rs.dart';
import 'package:retrofit/http.dart';

part 'api_auth_service.g.dart';

@RestApi(baseUrl: '/rest/auth')
abstract class APIAuthService {
  factory APIAuthService(Dio dio, {String baseUrl}) = _APIAuthService;

  @POST(APIAuthConst.login)
  Future<LoginRs> login(@Body() LoginRq loginRq);
}