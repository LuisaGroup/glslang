target("lc-glslang")
set_basename("luisa-glslang")
_config_project({
    project_kind = "static",
    batch_size = 64
})

add_includedirs(".", {
    public = true
})

add_defines("ENABLE_SPIRV", {
    public = true
})
add_defines("ENABLE_OPT=0", {
    public = true
})

if is_plat("windows") then
    add_files("glslang/OSDependent/Windows/ossource.cpp")
    add_defines("GLSLANG_OSINCLUDE_WIN32", {
        public = true
    })
else
    add_files("glslang/OSDependent/Unix/ossource.cpp")
    add_defines("GLSLANG_OSINCLUDE_UNIX", {
        public = true
    })
end

add_files("glslang/CInterface/glslang_c_interface.cpp")
add_files("glslang/GenericCodeGen/*.cpp")
add_files("glslang/MachineIndependent/*.cpp")
add_files("glslang/MachineIndependent/preprocessor/*.cpp")
add_files("glslang/ResourceLimits/*.cpp")
add_files("SPIRV/*.cpp")
add_files("SPIRV/CInterface/*.cpp")

add_headerfiles("glslang/Public/*.h")
add_headerfiles("glslang/Include/*.h")
add_headerfiles("glslang/MachineIndependent/*.h")
add_headerfiles("glslang/MachineIndependent/preprocessor/*.h")
add_headerfiles("SPIRV/*.h")
add_headerfiles("SPIRV/CInterface/*.h")

if is_plat("linux", "macosx") then
    add_syslinks("pthread", {
        public = true
    })
end

target_end()
