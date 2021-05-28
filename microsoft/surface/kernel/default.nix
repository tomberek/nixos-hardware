{ config, lib, pkgs, ... }:

{
  #boot.kernelPackages = pkgs.callPackage ./linux-5.10.19 {};
  #boot.kernelPackages = pkgs.callPackage ./linux-5.11.22 {};
  boot.kernelPackages = pkgs.callPackage ./linux-5.11-rc1 {};
  #boot.kernelPackages = pkgs.callPackage ./linux-5.12.6 {};
}
