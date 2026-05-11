target("lc-glslang")
set_basename("luisa-glslang")
_config_project({
    project_kind = "static"
})

add_includedirs(".", {
    public = true
})

add_defines("ENABLE_SPIRV", "ENABLE_OPT=0", {
    public = true
})

if is_plat("windows") then
    add_files("glslang/OSDependent/Windows/ossource.cpp")
    add_defines("NOMINMAX", "UNICODE", "GLSLANG_OSINCLUDE_WIN32", {
        public = true
    })
else
    add_files("glslang/OSDependent/Unix/ossource.cpp")
    add_defines("GLSLANG_OSINCLUDE_UNIX", {
        public = true
    })
end

add_files(
    "glslang/CInterface/glslang_c_interface.cpp",
    "glslang/GenericCodeGen/*.cpp",
    "glslang/MachineIndependent/*.cpp",
    "glslang/MachineIndependent/preprocessor/*.cpp",
    "glslang/ResourceLimits/*.cpp",
    "SPIRV/*.cpp",
    "SPIRV/CInterface/*.cpp"
)

add_headerfiles(
    "glslang/Public/*.h",
    "glslang/Include/*.h",
    "glslang/MachineIndependent/*.h",
    "glslang/MachineIndependent/preprocessor/*.h",
    "SPIRV/*.h",
    "SPIRV/CInterface/*.h"
)

if is_plat("linux", "macosx") then
    add_syslinks("pthread", {
        public = true
    })
end

target_end()
