class AppConstants {
  static const appNameProd = '{{project_name.titleCase()}}';
  static const appNameDev = '[DEV] {{project_name.titleCase()}}';
{{#include_stage}}
  static const appNameStage = '[STG] {{project_name.titleCase()}}';
{{/include_stage}}
}
