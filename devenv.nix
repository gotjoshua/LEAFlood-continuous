# Docs: https://devenv.sh/basics/
{ pkgs, inputs, ... }:
let
  # https://devenv.sh/common-patterns/#getting-a-recent-version-of-a-package-from-nixpkgs-unstable
  pkgs-latest = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in
{

  languages = {
    # Docs: https://devenv.sh/languages/
    nix.enable = true;
    python = {
      enable = true;
      # Specify version to use (e.g., "3.11", "3.12", "3.13")
      # Omit to use default. See: https://devenv.sh/reference/options/#languagespythonversion
      # version = "3.12";

      # Language Server Protocol - enabled by default with pyright
      # To use pylsp instead (includes linting/formatting integrations):
      # lsp.package = pkgs.python312Packages.python-lsp-server;

      # Package manager
      uv = {
        enable = true;
        # Enable sync to auto-install dependencies from pyproject.toml on shell entry
        # sync.enable = true;
      };

      # Virtual environment - typically managed by uv, but can be enabled for pip workflows
      # venv.enable = true;
    };
  };

  packages = with pkgs; [
    # Docs: https://devenv.sh/packages/
    ruff # Python linter/formatter (fast, single tool for linting & formatting)
  ];

  scripts = { }; # Docs: https://devenv.sh/scripts/

  git-hooks.hooks = {
    # Docs: https://devenv.sh/pre-commit-hooks/
    # list of pre-configured hooks: https://devenv.sh/reference/options/#pre-commithooks
    nil.enable = true; # nix lsp
    nixpkgs-fmt.enable = true; # nix formatting
  };

  difftastic.enable = true; # enable semantic diffs - https://devenv.sh/integrations/difftastic/
}
