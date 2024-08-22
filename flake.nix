{
  description = "Paul Corbineau NixOS Flake";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";
  };
  
  outputs = {self, nixpkgs, home-manager, ...}@inputs: 
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          nixpkgs.overlays = [
            inputs.nur.overlay
          ];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.pcorbineau = import ./home.nix;
        }  
      ];
    };
  };
}
