let
  qitoy = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFRlehNRNXIByTOjwFf5iBCntY2a9LLNs/Itkr7DmHQA";
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKyHTS6Ysvyk1O20DZTOccxOLAOF1SeTYT9T24srRcA";
in
{
  "nixos/secrets/wifi.age".publicKeys = [ system qitoy ];
}
