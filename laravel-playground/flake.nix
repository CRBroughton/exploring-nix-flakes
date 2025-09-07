{
  description = "Laravel demo";

  inputs = {
    modules.url = "path:../";
  };

  outputs =
    {
      modules,
      ...
    }:
    modules.lib.mkDevShell modules [
      "git"
      "php_84"
      "composer"
      "laravel"
    ];
}
