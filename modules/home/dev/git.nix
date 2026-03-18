{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "garcia.cli@pm.me";
        name = "Iván García";
      };
    };
  };

  programs.lazygit.enable = true;

  programs.ssh.matchBlocks = {
    "github.com" = {
      addKeysToAgent = "yes";
      identityFile = "~/.ssh/github";
    };
  };
}
