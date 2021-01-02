
set(PortName csl)

vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL https://bitbucket.org/AlexeyBobrov/${PortName}
  REF f63e9316fbab432d833c465f0c6b7f9ff887ce86
  )

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
  OPTIONS
	-DBUILD_WITHOUT_TESTS=ON
  )
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/${PortName})

set(csl_DIR lib/cmake/${PortName})

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
configure_file(${SOURCE_PATH}/License.txt ${CURRENT_PACKAGES_DIR}/share/${PortName}/copyright COPYONLY)

vcpkg_copy_pdbs()
