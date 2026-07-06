{lib, ...}:
{
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Simon Kammermeier";
          email = "simon.kammermeier@tum.de";
        };
      };
    };

    zsh = {
      enable = true;
      zsh-abbr = {
        enable = true;
        abbreviations = {
          ll = "ls -l";
          la = "ls -la";
        };
        globalAbbreviations = {
          G = "| grep";
          L = "| less -R";
        };
      };
      enableVteIntegration = true;
      history = {
        append = true;
        expireDuplicatesFirst = true;
        extended = true;
        findNoDups = true;
        ignoreDups = true;
        save = 50000;
        size = 50000;
      };
      syntaxHighlighting.enable = true;
      #TODO
      initContent = lib.mkOrder 550 ''
      zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _correct _approximate
      zstyle ':completion:*' completions 1
      zstyle ':completion:*' expand prefix suffix
      zstyle ':completion:*' glob 1
      zstyle ':completion:*' group-name '''
      zstyle ':completion:*' ignore-parents parent pwd
      zstyle ':completion:*' insert-unambiguous false
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
      zstyle ':completion:*' list-suffixes true
      zstyle ':completion:*' matcher-list ''' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
      zstyle ':completion:*' max-errors 2
      zstyle ':completion:*' menu select=1
      zstyle ':completion:*' old-menu false
      zstyle ':completion:*' original false
      zstyle ':completion:*' preserve-prefix '//[^/]##/'
      zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
      zstyle ':completion:*' substitute 1
      zstyle ':completion:*' use-compctl true
      zstyle ':completion:*' verbose true
      zstyle ':completion:*' word true
      ''
      ;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };


  # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };
}
