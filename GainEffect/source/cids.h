//------------------------------------------------------------------------
// Copyright(c) 2024 Owen Stanley.
//------------------------------------------------------------------------

#pragma once

#include "pluginterfaces/base/funknown.h"
#include "pluginterfaces/vst/vsttypes.h"

namespace OwenStanley {
//------------------------------------------------------------------------
static const Steinberg::FUID kGainEffectProcessorUID (0xA01C1537, 0x3D49580E, 0xB14DD461, 0x03F63C7A);
static const Steinberg::FUID kGainEffectControllerUID (0xAA0DC48A, 0xEBAD5BD2, 0x86E90F1C, 0xC495D391);

#define GainEffectVST3Category "Fx"

//------------------------------------------------------------------------
} // namespace OwenStanley
