#@IgnoreInspection BashAddShebang
pkg_origin=satra
pkg_suffix=server-community
pkg_name=graphaware-framework
pkg_version=3.0.3.39
pkg_source=http://products.graphaware.com/download/framework-${pkg_suffix}/graphaware-${pkg_suffix}-all-${pkg_version}.jar
pkg_filename=${pkg_name}-${pkg_version}.jar
pkg_shasum=a825cc711648b64a2c5fe456b941374c83d444886af3608158b661f3a694d7b4
pkg_deps=(satra/neo4j-enterprise)

do_begin() {
  export NEO4J_HOME=$(pkg_path_for satra/neo4j-enterprise)/neo4j
}

do_unpack() {
  mv $HAB_CACHE_SRC_PATH/$pkg_filename $NEO4J_HOME/plugins
}

do_build() {
  export NEO4J_CONF=$NEO4J_HOME/conf
}

do_install() {
  echo "dbms.unmanaged_extension_classes=com.graphaware.server=/graphaware" >> $NEO4J_CONF/neo4j.conf
}