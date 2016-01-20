#Startup bash script setup some usefull functions and variables

funciton export_genivi_3d_party {
  THIRD_PARTY_INSTALL_PREFIX=/tmp/genivi_3rd_party
  THIRD_PARTY_INSTALL_PREFIX_ARCH=$THIRD_PARTY_INSTALL_PREFIX/$(uname -m)
}

funciton export_pasa_3d_party {
  THIRD_PARTY_INSTALL_PREFIX=/tmp/pasa_3rd_party
  THIRD_PARTY_INSTALL_PREFIX_ARCH=$THIRD_PARTY_INSTALL_PREFIX/$(uname -m)
}
