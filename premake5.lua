project "yaml-cpp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    files {
    	"src/**.h",
    	"src/**.cpp",
    	
    	"include/**.h"
    }
    
    includedirs {
    	"include"
    }

    defines{
        "YAML_CPP_STATIC_DEFINE"
    }
    
    filter "system:windows"
        systemversion "latest"
    
    filter "system:linux"
        pic "On"
        systemversion "latest"
    
    filter "configurations:Debug"
    	runtime "Debug"
    	symbols "On"
    
    filter "configurations:Release"
    	runtime "Release"
    	optimize "On"

    filter "configurations:Distribution"
        optimize "Full"
        runtime "Release"
        symbols "Off"
