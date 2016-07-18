#@IgnoreInspection BashAddShebang
pkg_origin=satra
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
pkg_expose=(7474 7473 7678)

do_build() {
  return 0
}

do_install() {
  build_line "Copying files from $PWD"
  export NEO4J_HOME=$pkg_prefix/neo4j
  mkdir -p $NEO4J_HOME
  cp -r * $NEO4J_HOME
  sed -i "/#!\/usr\/bin\/env/c\#!\/bin\/bash" $NEO4J_HOME/bin/neo4j
#  attach
}