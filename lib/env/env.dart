import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'IMAGE_API_KEY')
  static const String imageApiKey = _Env.imageApiKey;
}