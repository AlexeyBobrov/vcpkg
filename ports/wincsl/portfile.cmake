
vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL https://bitbucket.org/AlexeyBobrov/wincsl
  REF 7991bc334ee2d55ae4da8df8d0da6a706d6723da
  )

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
  OPTIONS
	-DBUILD_WITHOUT_TESTS=ON
	-DWITH_UNICODE=ON
  )
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/wincsl)

set(csl_DIR lib/cmake/wincsl)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
configure_file(${SOURCE_PATH}/License.txt ${CURRENT_PACKAGES_DIR}/share/wincsl/copyright COPYONLY)

vcpkg_copy_pdbs()
