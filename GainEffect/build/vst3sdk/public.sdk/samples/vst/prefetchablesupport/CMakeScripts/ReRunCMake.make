# Generated by CMake, DO NOT EDIT

TARGETS:= 
empty:= 
space:= $(empty) $(empty)
spaceplus:= $(empty)\ $(empty)

TARGETS += $(subst $(space),$(spaceplus),$(wildcard /Users/owen/Documents/coding/plugins/VST_SDK/vst3sdk/cmake/templates/projectversion.h.in))
TARGETS += $(subst $(space),$(spaceplus),$(wildcard /Users/owen/Documents/coding/plugins/VST_SDK/vst3sdk/public.sdk/samples/vst/prefetchablesupport/CMakeLists.txt))

/Users/owen/Documents/coding/plugins/GainEffect/build/CMakeFiles/cmake.check_cache: $(TARGETS)
	/Applications/CMake.app/Contents/bin/cmake -S/Users/owen/Documents/coding/plugins/GainEffect -B/Users/owen/Documents/coding/plugins/GainEffect/build
