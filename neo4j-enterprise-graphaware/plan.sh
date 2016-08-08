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

do_download() {
  do_default_download
  download_file https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/1.1.0/apoc-1.1.0.jar apoc-1.1.0.jar 76f45ae97d442593c9e78d2e599e3d67e23db3b4bd4f5a305f6c0a7ac2dc1ade
  download_file http://products.graphaware.com/download/framework-server-community/graphaware-server-community-all-3.0.3.39.jar graphaware-server-community-all-3.0.3.39.jar a825cc711648b64a2c5fe456b941374c83d444886af3608158b661f3a694d7b4
  download_file http://products.graphaware.com/download/timetree/graphaware-timetree-3.0.3.39.24.jar graphaware-timetree-3.0.3.39.24.jar 3435d4898b6f58d2b9f4c1de3a2b41375c13300bc1a9c2b3e795e3d7cf29ba40
  download_file http://products.graphaware.com/download/uuid/graphaware-uuid-3.0.4.43.10.jar graphaware-uuid-3.0.4.43.10.jar 8610978fad8fb15fc6e9655d1b41dfde598bb86609cdf1e9da6924cbd1d2c36f
}

do_build() {
  return 0
}

do_install() {
  build_line "Copying files from $PWD"
  export NEO4J_HOME=$pkg_prefix/neo4j
  mkdir -p $NEO4J_HOME
  cp -r * $NEO4J_HOME
  sed -i "/#!\/usr\/bin\/env/c\#!\/bin\/bash" $NEO4J_HOME/bin/neo4j
  cp $HAB_CACHE_SRC_PATH/apoc-1.1.0.jar $NEO4J_HOME/plugins
  cp $HAB_CACHE_SRC_PATH/graphaware-server-community-all-3.0.3.39.jar $NEO4J_HOME/plugins
  cp $HAB_CACHE_SRC_PATH/graphaware-timetree-3.0.3.39.24.jar $NEO4J_HOME/plugins
  cp $HAB_CACHE_SRC_PATH/graphaware-uuid-3.0.4.43.10.jar $NEO4J_HOME/plugins
}
