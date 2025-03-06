{ pkgs, ... }: {
  channel = "stable-24.05"; # or "unstable"

  packages = [
    pkgs.go
    pkgs.gopls
    pkgs.docker
    pkgs.docker-compose
    pkgs.air
  ];

  env = {
    GOPATH = "/workspace/go";
    GOROOT = "${pkgs.go}/share/go";
  };

  services = {
    docker.enable = true;
  };

  idx = {
    extensions = [
      "golang.go"
      "golangci-lint.vscode-golangci-lint"
      "puremourning.go-test-explorer"
      "aaron-bond.better-comments"
      "usernamehw.errorlens"
      "arrterian.nix-env-selector"
      "zhuangtongfa.material-theme"
      "ms-azuretools.vscode-docker"
      "esbenp.prettier-vscode"
    ];

    previews = {
      enable = true;
    };

    workspace = {
      onStart = {
        check-go = "go version && go env";
        changes-git-push-username = "git config --global user.name \"DeTiveNC\"";
        changes-git-push-email = "git config --global user.name \"116792124+DeTiveNC@users.noreply.github.com\"";
      };
    };
  };
}
