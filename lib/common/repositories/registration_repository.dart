
abstract class RegistrationRepository {
  Future<String?> createRegistration(int studentCode, int courseCode);
}