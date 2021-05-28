{ lib, stdenv, buildPackages, fetchFromGitHub , perl, buildLinux, modDirVersionArg ? null, ... } @ args:

with lib;

buildLinux (args // rec {
  version = "5.11-rc1";

  # modDirVersion needs to be x.y.z, will automatically add .0 if needed
  modDirVersion = if (modDirVersionArg == null) then concatStringsSep "." (take 3 (splitVersion "${version}.0")) else modDirVersionArg;

  # branchVersion needs to be x.y
  extraMeta.branch = versions.majorMinor version;

  src = fetchFromGitHub {
    owner = "djrscally";
    repo = "media_tree";
    rev = "ov5693-v2";
    sha256 = "sha256-EQJ1YRTrkW7bzDeJcib1YmOykxkR0tUJNVBHPOGldgA=";
  };
} // (args.argsOverride or {}))
