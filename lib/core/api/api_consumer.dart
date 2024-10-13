abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    bool isFormData = false,
  });

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? body,
    bool isFormData = false,
  });

  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? body,
    bool isFormData = false,
  });

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? body,
    bool isFormData = false,
  });
}
