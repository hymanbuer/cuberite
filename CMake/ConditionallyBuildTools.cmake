# This has to be done before any flags have been set up.
if(${BUILD_TOOLS})
	add_subdirectory(Tools/GrownBiomeGenVisualiser/)
	add_subdirectory(Tools/MCADefrag/)
	add_subdirectory(Tools/NoiseSpeedTest/)
	add_subdirectory(Tools/ProtoProxy/)
endif()

if(${BUILD_UNSTABLE_TOOLS})
	add_subdirectory(Tools/GeneratorPerformanceTest/)
endif()
