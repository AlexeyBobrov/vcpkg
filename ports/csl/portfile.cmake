
vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL https://bitbucket.org/AlexeyBobrov/csl
  REF 75258f919df432b6e152b2cb156d0eeac2451323
  )

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
  OPTIONS
	-DBUILD_WITHOUT_TESTS=ON
	-DWITH_UNICODE=ON
  )
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/csl)

set(csl_DIR lib/cmake/csl)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
configure_file(${SOURCE_PATH}/License.txt ${CURRENT_PACKAGES_DIR}/share/csl/copyright COPYONLY)

vcpkg_copy_pdbs()
