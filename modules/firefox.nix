{ config, pkgs, ... }:

  let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
  in
{
  programs = {
    firefox = {
      enable = true;
      languagePacks = [ "de" "en-US" ];

      /* ---- POLICIES ---- */
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "newtab"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "separate"; # alternative: "separate"
        PromptForDownloadLocation = true;
        DNSOverHTTPS = {
          Enabled =  true;
          ProviderURL = "https://doh.opendns.com/dns-query";
          Locked = true;
          Fallback = false;
        };
        AutofillCreditCardEnabled = false;
        OfferToSaveLogins = false;
        HttpsOnlyMode = "force_enabled";

        /* ---- EXTENSIONS ---- */
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          # Privacy Badger:
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
          };
          # Bitwarden:
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
          # PopUpOFF:
          "{154cddeb-4c8b-4627-a478-c7e5b427ffdf}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/popupoff/latest.xpi";
            installation_mode = "force_installed";
          };
          # BetterTTV:
          "firefox@betterttv.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/betterttv/latest.xpi";
            installation_mode = "force_installed";
          };
          # ClearURLs:
          "{74145f27-f039-47ce-a470-a662b129930a}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
            installation_mode = "force_installed";
          };
        };

        /* ---- PREFERENCES ---- */
        # Check about:config for options.
        Preferences = {
          "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
          "general.autoScroll" = lock-true;
          "extensions.pocket.enabled" = lock-false;
          "extensions.screenshots.disabled" = lock-true;
          "browser.topsites.contile.enabled" = lock-false;
          "browser.formfill.enable" = lock-true;
          "browser.search.suggest.enabled" = lock-true;
          "browser.search.suggest.enabled.private" = lock-true;
          "browser.urlbar.suggest.searches" = lock-true;
          "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-true;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-true;
          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        };
      };
    };
  };
}
