import '../../domain/domain.dart';
import '../models/models.dart';

class HistouricUserMapper {
  static HistouricUser fromHistouricUserResponse(
    HistouricUserResponse histouricUserResponse,
  ) {
    return HistouricUser(
      id: histouricUserResponse.id,
      nickname: histouricUserResponse.nickname,
      email: histouricUserResponse.email,
    );
  }
}
