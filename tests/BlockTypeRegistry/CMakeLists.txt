cmake_minimum_required(VERSION 3.0.2)
enable_testing()

include_directories(${CMAKE_SOURCE_DIR}/src/)

add_definitions(-DTEST_GLOBALS=1)





# Define individual test executables:

# BlockStateTest: Verify that the BlockState class works as intended:
add_executable(BlockStateTest
	BlockStateTest.cpp
	../TestHelpers.h
	${CMAKE_SOURCE_DIR}/src/BlockState.cpp
	${CMAKE_SOURCE_DIR}/src/StringUtils.cpp
	${CMAKE_SOURCE_DIR}/src/OSSupport/CriticalSection.cpp
)
target_link_libraries(BlockStateTest fmt::fmt)

add_executable(BlockTypePaletteTest
	BlockTypePaletteTest.cpp
	../TestHelpers.h
	${CMAKE_SOURCE_DIR}/src/BlockState.cpp
	${CMAKE_SOURCE_DIR}/src/BlockTypePalette.cpp
	${CMAKE_SOURCE_DIR}/src/StringUtils.cpp
	${CMAKE_SOURCE_DIR}/src/OSSupport/CriticalSection.cpp
	${CMAKE_SOURCE_DIR}/src/OSSupport/File.cpp
)
target_link_libraries(BlockTypePaletteTest fmt::fmt jsoncpp_lib_static)

# BlockTypeRegistryTest: Verify that the BlockTypeRegistry class works as intended:
add_executable(BlockTypeRegistryTest
	BlockTypeRegistryTest.cpp
	../TestHelpers.h
	${CMAKE_SOURCE_DIR}/src/BlockTypeRegistry.cpp
	${CMAKE_SOURCE_DIR}/src/StringUtils.cpp
	${CMAKE_SOURCE_DIR}/src/OSSupport/CriticalSection.cpp
)
target_link_libraries(BlockTypeRegistryTest fmt::fmt)

# PalettedBlockAreaTest: Verify that the PalettedBlockArea class works as intended:
add_executable(PalettedBlockAreaTest
	PalettedBlockAreaTest.cpp
	../TestHelpers.h
	${CMAKE_SOURCE_DIR}/src/BlockState.cpp
	${CMAKE_SOURCE_DIR}/src/BlockTypeRegistry.cpp
	${CMAKE_SOURCE_DIR}/src/BlockTypePalette.cpp
	${CMAKE_SOURCE_DIR}/src/Cuboid.cpp
	${CMAKE_SOURCE_DIR}/src/PalettedBlockArea.cpp
	${CMAKE_SOURCE_DIR}/src/StringUtils.cpp
	${CMAKE_SOURCE_DIR}/src/OSSupport/CriticalSection.cpp
)
target_link_libraries(PalettedBlockAreaTest fmt::fmt jsoncpp_lib_static)

# Extra files for BlockTypePalette test:
file (COPY
	../../Server/Protocol/1.13/base.btp.txt
	../../Server/Protocol/UpgradeBlockTypePalette.txt
	DESTINATION ./
)







# Define individual tests:

add_test(NAME BlockStateTest        COMMAND BlockStateTest)
add_test(NAME BlockTypeRegistryTest COMMAND BlockTypeRegistryTest)
add_test(NAME BlockTypePaletteTest  COMMAND BlockTypePaletteTest)
add_test(NAME PalettedBlockAreaTest COMMAND PalettedBlockAreaTest)





# Put all the tests into a solution folder (MSVC):
set_target_properties(
	BlockStateTest
	BlockTypeRegistryTest
	BlockTypePaletteTest
	PalettedBlockAreaTest
	PROPERTIES FOLDER Tests/BlockTypeRegistry
)
