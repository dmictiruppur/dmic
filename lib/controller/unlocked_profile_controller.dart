import 'package:get/get.dart';
import 'package:kannada_devangar/repositories/user_repository.dart';

class Unlocked_Profile_Controller extends GetxController {
  final UserRepository _userRepository;

  Unlocked_Profile_Controller(this._userRepository);
  static const cpf = 'CPF';
}
