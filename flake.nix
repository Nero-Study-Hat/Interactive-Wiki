{
	description = "My NLP development environment.";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = {
		self,
		nixpkgs,
		flake-utils,
		...
	}:
	flake-utils.lib.eachDefaultSystem (system:
		let
			# pkgs = nixpkgs.legacyPackages.${system};
			pkgs = import nixpkgs {
				inherit system;
				pkgs = nixpkgs.legacyPackages.${system};
				config.allowUnfree = true;
			};


			# spaCy is not in nixpkgs so we will define it here
			# --- for get sha256 ---
			# nix shell nixpkgs#"nix-prefetch-github" --command \
			# nix-prefetch-github explosion spaCy --rev "release-v3.8.7"
			
			spacy = pkgs.python3Packages.buildPythonPackage rec {
				pname = "spaCy";
				version = "3.8.7";

				src = pkgs.fetchFromGitHub {
					owner = "explosion";
					repo = "spaCy";
					rev = "release-v${version}";
					sha256 = "mRra5/4W3DFVI/KbReTg2Ey9mOC6eQQ31/QDt7Pw0fU=";
				};

				doCheck = false; # check requires infrastructure
			};
		in rec {
			devShell = pkgs.mkShell {
				packages = with pkgs; [
					# all non-python packages here

					# all python packages here
					(python3.withPackages (ps: [
						ps.spacy
					]))
				];

				shellHook = ''
					echo "Starting new shell";
				'';
			};
		}
	);
}