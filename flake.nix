{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };

      # Import your theme with pkgs
      theme = import ./configs/theme.nix { inherit pkgs; };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              # The home.nix function receives the config and pkgs arguments.
              # Pass those arguments along with your custom 'theme' variable.
              users.kush = { config, pkgs, ... }: import ./home.nix {
                inherit config pkgs theme;
              };
            };
          }
        ];
      };
    };
}
