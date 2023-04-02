import 'package:get/get.dart';
import 'package:kannada_devangar/repositories/user_repository.dart';

class Your_Match_Controller extends GetxController {
  final UserRepository _userRepository;

  Your_Match_Controller(this._userRepository);
  static const cpf = 'CPF';
}
