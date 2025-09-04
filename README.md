# Exploring Nix Flakes

Doing a little exploration for Nix Flakes, to see if it
can be used for team-wide declarative package installation,
as well as auditing software for IT.

install my personal settings:

#### Install from remote (once you're happy)
nix profile add github:CRBroughton/exploring-nix-flakes?dir=personal/craig

#### Install local development version from your repo directory
cd exploring-nix-flakes
nix profile instaddall ./personal/craig#default

#### One liner for remove and install local
nix profile remove personal/craig && nix profile add ./personal/craig#default


#### Update the remote flake
nix flake update --flake github:CRBroughton/exploring-nix-flakes


#### Get the latest version of the flake (need to do this after pushes/PR merges)
nix flake update dev-tools