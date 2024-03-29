cmake_minimum_required(VERSION 3.14.0)
set(CMAKE_OSX_DEPLOYMENT_TARGET 10.13 CACHE STRING "")

set(vst3sdk_SOURCE_DIR "/Users/owen/Documents/coding/plugins/VST_SDK/vst3sdk")
if(NOT vst3sdk_SOURCE_DIR)
    message(FATAL_ERROR "Path to VST3 SDK is empty!")
endif()

project(GainEffect
    # This is your plug-in version number. Change it here only.
    # Version number symbols usable in C++ can be found in
    # source/version.h and ${PROJECT_BINARY_DIR}/projectversion.h.
    VERSION 1.0.0.0 
    DESCRIPTION "GainEffect VST 3 Plug-in"
)

set(SMTG_VSTGUI_ROOT "${vst3sdk_SOURCE_DIR}")

add_subdirectory(${vst3sdk_SOURCE_DIR} ${PROJECT_BINARY_DIR}/vst3sdk)
smtg_enable_vst3_sdk()

smtg_add_vst3plugin(GainEffect
    source/version.h
    source/cids.h
    source/processor.h
    source/processor.cpp
    source/controller.h
    source/controller.cpp
    source/entry.cpp
)

#- VSTGUI Wanted ----
if(SMTG_ENABLE_VSTGUI_SUPPORT)
    target_sources(GainEffect
        PRIVATE
            resource/editor.uidesc
    )
    target_link_libraries(GainEffect
        PRIVATE
            vstgui_support
    )
    smtg_target_add_plugin_resources(GainEffect
        RESOURCES
            "resource/editor.uidesc"
    )
endif(SMTG_ENABLE_VSTGUI_SUPPORT)
# -------------------

smtg_target_add_plugin_snapshots (GainEffect
    RESOURCES
        resource/A01C15373D49580EB14DD46103F63C7A_snapshot.png
        resource/A01C15373D49580EB14DD46103F63C7A_snapshot_2.0x.png
)

target_link_libraries(GainEffect
    PRIVATE
        sdk
)

smtg_target_configure_version_file(GainEffect)

if(SMTG_MAC)
    smtg_target_set_bundle(GainEffect
        BUNDLE_IDENTIFIER com.owenstanley.gaineffect
        COMPANY_NAME "Owen Stanley"
    )
    smtg_target_set_debug_executable(GainEffect
        "/Applications/VST3PluginTestHost.app"
        "--pluginfolder;$(BUILT_PRODUCTS_DIR)"
    )
elseif(SMTG_WIN)
    target_sources(GainEffect PRIVATE 
        resource/win32resource.rc
    )
    if(MSVC)
        set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT GainEffect)

        smtg_target_set_debug_executable(GainEffect
            "$(ProgramW6432)/Steinberg/VST3PluginTestHost/VST3PluginTestHost.exe"
            "--pluginfolder \"$(OutDir)/\""
        )
    endif()
endif(SMTG_MAC)
