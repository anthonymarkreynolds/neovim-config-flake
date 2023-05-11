{ pkgs }:

let
  pythonEnv = pkgs.python3.withPackages (ps: [
    ps.requests
    # Add any other required packages here
  ]);
in
pkgs.writeScriptBin "update-plugins" ''
  #!${pkgs.runtimeShell}
  ${pythonEnv}/bin/python ${./generate-plugins-list.py}
''

