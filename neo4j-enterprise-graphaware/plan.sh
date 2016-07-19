#@IgnoreInspection BashAddShebang
pkg_origin=satratech
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
  build_line "Copying files from $PWD"
  export NEO4J_HOME=$pkg_prefix/neo4j
  mkdir -p $NEO4J_HOME
  cp -r * $NEO4J_HOME
  sed -i "/#!\/usr\/bin\/env/c\#!\/bin\/bash" $NEO4J_HOME/bin/neo4j
}

do_install() {
  cd $NEO4J_HOME/plugins
  if [ ! -f graphaware-server-community-all-3.0.3.39.jar ]; then
    wget http://products.graphaware.com/download/framework-server-community/graphaware-server-community-all-3.0.3.39.jar
  fi
#  sum_expect="a825cc711648b64a2c5fe456b941374c83d444886af3608158b661f3a694d7b4"
#  sum=($(sha256sum graphaware-server-community-all-3.0.3.39.jar))
#  echo "expect:$sum_expect"
#  echo "got:$sum"
#  if [ sum != sum_expect ]; then
#    echo "download corrupted"
#    return 1
#  fi
  echo "dbms.unmanaged_extension_classes=com.graphaware.server=/graphaware" >> $NEO4J_HOME/conf/neo4j.conf
#  attach
}