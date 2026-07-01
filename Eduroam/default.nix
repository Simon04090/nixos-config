{username, ...}:{networking.networkmanager.ensureProfiles.profiles = {
  eduroam = {
    connection = {
      id = "eduroam";
      type = "wifi";
      interface-name = "wlp0s20f3"; ## replace with your interface-name as displayed by "ip a"

            #'uuid': str(uuid.uuid4()),
      permissions = "user:${username}";
    };
    wifi = {
      mode = "infrastructure";
      ssid = "eduroam";
    };
    wifi-security = {
      key-mgmt = "wpa-eap"; ## adapt according to your universities setup
        proto = "rsn";
        pairwise = "ccmp";
        group = "ccmp;tkip";
    };
    "802-1x" = { ## not all or even some additional values may be needed here according to your institution
      eap = "peap"; ## adapt according to your universities setup
      identity = "ge35tem@eduroam.mwn.de";
      phase2-auth = "mschapv2";
      anonymous-identity = "anonymouscat@eduroam.mwn.de";
      password-flags = 1;
      ca-cert = "/home/${username}/nixos-config/Eduroam/ca.pem";
      subject-match = "radius.lrz.de";
    };
    ipv4 = {
      method = "auto";
    };
    ipv6 = {
      method = "auto";
    };
  };
};}
