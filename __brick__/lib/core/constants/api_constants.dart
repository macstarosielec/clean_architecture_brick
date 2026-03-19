class ApiConstants {
  static const String baseUrlDev = '{{base_url_dev}}';
  static const String baseUrlProd = '{{base_url_prod}}';
{{#include_stage}}
  static const String baseUrlStage = '{{base_url_stage}}';
{{/include_stage}}
  static const String apiVersion = 'v1';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
