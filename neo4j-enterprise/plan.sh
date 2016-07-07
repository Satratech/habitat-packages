#!/usr/bin/env bash
pkg_origin=keyvan
pkg_name=neo4j-enterprise
pkg_version=3.0.3
pkg_maintainer="Your Name <your email address>"
pkg_license=('GPLv3')
pkg_source=http://dist.neo4j.org/${pkg_name}-${pkg_version}-unix.tar.gz
pkg_shasum=f73ed4faf94087bded5ee34bc2614f09bbedc3b6e25439058526ce5506eb127e
pkg_deps=(core/curl core/server-jre)
#pkg_deps=(core/jdk8 core/curl core/vim core/procps-ng)
pkg_bin_dirs=(neo4j/bin)
#pkg_lib_dirs=(neo4j/lib)
pkg_svc_run="echo "neooooooo $NEO4J_HOME" && export $NEO4J_HOME=$pkg_prefix/neo4j && export $NEO4J_CONFIG=$pkg_svc_config_path && neo4j console"
pkg_expose=(9494 9493 9898)

#do_build() {
#  export JAVA_HOME=$(hab pkg path core/server-jre)
#}

do_install() {
  build_line "Copying files from $PWD"
  export NEO4J_HOME=$pkg_prefix/neo4j
  mkdir -p $NEO4J_HOME
  cp -r * $NEO4J_HOME
  sed -i "/#!\/usr\/bin\/env/c\#!\/bin\/bash" $NEO4J_HOME/bin/neo4j
  cd $NEO4J_HOME/bin
  attach
}