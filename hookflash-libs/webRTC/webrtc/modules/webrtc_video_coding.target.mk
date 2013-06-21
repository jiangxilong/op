# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := webrtc_video_coding
DEFS_Debug := \
	'-DWEBRTC_SVNREVISION="Unavailable(issue687)"' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DUSE_LINUX_BREAKPAD' \
	'-DNO_TCMALLOC' \
	'-DDISABLE_NACL' \
	'-DCHROMIUM_BUILD' \
	'-DUSE_LIBJPEG_TURBO=1' \
	'-DENABLE_WEBRTC=1' \
	'-DUSE_PROPRIETARY_CODECS' \
	'-DENABLE_PEPPER_THREADING' \
	'-DENABLE_GPU=1' \
	'-DUSE_OPENSSL=1' \
	'-DENABLE_EGLIMAGE=1' \
	'-DUSE_SKIA=1' \
	'-DWEBRTC_LOGGING' \
	'-DWEBRTC_ARCH_ARM' \
	'-DWEBRTC_ARCH_ARM_V7' \
	'-DWEBRTC_DETECT_ARM_NEON' \
	'-DWEBRTC_LINUX' \
	'-DWEBRTC_ANDROID' \
	'-DWEBRTC_CLOCK_TYPE_REALTIME' \
	'-DWEBRTC_THREAD_RR' \
	'-D__STDC_CONSTANT_MACROS' \
	'-D__STDC_FORMAT_MACROS' \
	'-DANDROID' \
	'-D__GNU_SOURCE=1' \
	'-DUSE_STLPORT=1' \
	'-D_STLP_USE_PTR_SPECIALIZATIONS=1' \
	'-DCHROME_BUILD_ID=""' \
	'-DHAVE_SYS_UIO_H' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=1' \
	'-DWTF_USE_DYNAMIC_ANNOTATIONS=1' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fstack-protector \
	--param=ssp-buffer-size=4 \
	-Werror \
	-fno-exceptions \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-Wextra \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fno-builtin-cos \
	-fno-builtin-sin \
	-fno-builtin-cosf \
	-fno-builtin-sinf \
	-mthumb \
	-march=armv7-a \
	-mtune=cortex-a8 \
	-mfloat-abi=softfp \
	-mfpu=vfpv3-d16 \
	-fno-tree-sra \
	-fuse-ld=gold \
	-Wno-psabi \
	-mthumb-interwork \
	-ffunction-sections \
	-funwind-tables \
	-g \
	-fstack-protector \
	-fno-short-enums \
	-finline-limit=64 \
	-Wa,--noexecstack \
	--sysroot=$(ANDROID_NDK_PATH)/platforms/android-9/arch-arm \
	-I$(ANDROID_NDK_PATH)/sources/cxx-stl/stlport/stlport \
	-I$(ANDROID_NDK_PATH)/sources/cxx-stl/gnu-libstdc++/4.6/include \
	-Os \
	-g \
	-fomit-frame-pointer \
	-fdata-sections \
	-ffunction-sections

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare \
	-Woverloaded-virtual \
	-Wno-abi

INCS_Debug := \
	-Iwebrtc \
	-I. \
	-I. \
	-Iwebrtc/modules/video_coding/main/interface \
	-Iwebrtc/modules/interface \
	-Iwebrtc/modules/video_coding/codecs/interface \
	-Iwebrtc/common_video/interface \
	-Iwebrtc/modules/video_coding/codecs/i420/main/interface \
	-Iwebrtc/common_video/jpeg/include \
	-Iwebrtc/common_video/libyuv/include \
	-Iwebrtc/system_wrappers/interface \
	-Iwebrtc/modules/video_coding/codecs/vp8/include \
	-Iwebrtc/common_video/interface \
	-Iwebrtc/modules/video_coding/codecs/interface

DEFS_Release := \
	'-DWEBRTC_SVNREVISION="Unavailable(issue687)"' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DUSE_LINUX_BREAKPAD' \
	'-DNO_TCMALLOC' \
	'-DDISABLE_NACL' \
	'-DCHROMIUM_BUILD' \
	'-DUSE_LIBJPEG_TURBO=1' \
	'-DENABLE_WEBRTC=1' \
	'-DUSE_PROPRIETARY_CODECS' \
	'-DENABLE_PEPPER_THREADING' \
	'-DENABLE_GPU=1' \
	'-DUSE_OPENSSL=1' \
	'-DENABLE_EGLIMAGE=1' \
	'-DUSE_SKIA=1' \
	'-DWEBRTC_LOGGING' \
	'-DWEBRTC_ARCH_ARM' \
	'-DWEBRTC_ARCH_ARM_V7' \
	'-DWEBRTC_DETECT_ARM_NEON' \
	'-DWEBRTC_LINUX' \
	'-DWEBRTC_ANDROID' \
	'-DWEBRTC_CLOCK_TYPE_REALTIME' \
	'-DWEBRTC_THREAD_RR' \
	'-D__STDC_CONSTANT_MACROS' \
	'-D__STDC_FORMAT_MACROS' \
	'-DANDROID' \
	'-D__GNU_SOURCE=1' \
	'-DUSE_STLPORT=1' \
	'-D_STLP_USE_PTR_SPECIALIZATIONS=1' \
	'-DCHROME_BUILD_ID=""' \
	'-DHAVE_SYS_UIO_H' \
	'-DNDEBUG' \
	'-DNVALGRIND' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=0' \
	'-D_FORTIFY_SOURCE=2'

# Flags passed to all source files.
CFLAGS_Release := \
	-fstack-protector \
	--param=ssp-buffer-size=4 \
	-Werror \
	-fno-exceptions \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-Wextra \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fno-builtin-cos \
	-fno-builtin-sin \
	-fno-builtin-cosf \
	-fno-builtin-sinf \
	-mthumb \
	-march=armv7-a \
	-mtune=cortex-a8 \
	-mfloat-abi=softfp \
	-mfpu=vfpv3-d16 \
	-fno-tree-sra \
	-fuse-ld=gold \
	-Wno-psabi \
	-mthumb-interwork \
	-ffunction-sections \
	-funwind-tables \
	-g \
	-fstack-protector \
	-fno-short-enums \
	-finline-limit=64 \
	-Wa,--noexecstack \
	--sysroot=$(ANDROID_NDK_PATH)/platforms/android-9/arch-arm \
	-I$(ANDROID_NDK_PATH)/sources/cxx-stl/stlport/stlport \
	-I$(ANDROID_NDK_PATH)/sources/cxx-stl/gnu-libstdc++/4.6/include \
	-Os \
	-fno-ident \
	-fdata-sections \
	-ffunction-sections \
	-fomit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare \
	-Woverloaded-virtual \
	-Wno-abi

INCS_Release := \
	-Iwebrtc \
	-I. \
	-I. \
	-Iwebrtc/modules/video_coding/main/interface \
	-Iwebrtc/modules/interface \
	-Iwebrtc/modules/video_coding/codecs/interface \
	-Iwebrtc/common_video/interface \
	-Iwebrtc/modules/video_coding/codecs/i420/main/interface \
	-Iwebrtc/common_video/jpeg/include \
	-Iwebrtc/common_video/libyuv/include \
	-Iwebrtc/system_wrappers/interface \
	-Iwebrtc/modules/video_coding/codecs/vp8/include \
	-Iwebrtc/common_video/interface \
	-Iwebrtc/modules/video_coding/codecs/interface

OBJS := \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/codec_database.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/codec_timer.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/content_metrics_processing.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/decoding_state.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/encoded_frame.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/frame_buffer.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/generic_decoder.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/generic_encoder.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/inter_frame_delay.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/jitter_buffer.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/jitter_buffer_common.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/jitter_estimator.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/media_opt_util.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/media_optimization.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/packet.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/qm_select.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/receiver.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/rtt_filter.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/session_info.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/timestamp_extrapolator.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/timestamp_map.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/timing.o \
	$(obj).target/$(TARGET)/webrtc/modules/video_coding/main/source/video_coding_impl.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-Wl,-z,now \
	-Wl,-z,relro \
	-Wl,-z,noexecstack \
	-fPIC \
	-Wl,-z,relro \
	-Wl,-z,now \
	-fuse-ld=gold \
	-nostdlib \
	-Wl,--no-undefined \
	-Wl,--exclude-libs=ALL \
	--sysroot=$(ANDROID_NDK_PATH)/platforms/android-9/arch-arm \
	-Wl,--icf=safe \
	-L$(ANDROID_NDK_PATH)/sources/cxx-stl/stlport/libs/armeabi-v7a \
	-L$(ANDROID_NDK_PATH)/sources/cxx-stl/gnu-libstdc++/4.6/libs/armeabi-v7a \
	-Wl,-O1 \
	-Wl,--as-needed \
	-Wl,--gc-sections

LDFLAGS_Release := \
	-Wl,-z,now \
	-Wl,-z,relro \
	-Wl,-z,noexecstack \
	-fPIC \
	-Wl,-z,relro \
	-Wl,-z,now \
	-fuse-ld=gold \
	-nostdlib \
	-Wl,--no-undefined \
	-Wl,--exclude-libs=ALL \
	--sysroot=$(ANDROID_NDK_PATH)/platforms/android-9/arch-arm \
	-Wl,--icf=safe \
	-L$(ANDROID_NDK_PATH)/sources/cxx-stl/stlport/libs/armeabi-v7a \
	-L$(ANDROID_NDK_PATH)/sources/cxx-stl/gnu-libstdc++/4.6/libs/armeabi-v7a \
	-Wl,-O1 \
	-Wl,--as-needed \
	-Wl,--gc-sections

LIBS := \
	 \
	-lstlport_static \
	$(ANDROID_NDK_PATH)toolchains/arm-linux-androideabi-4.6/prebuilt/$(PLATFORM)/bin/../lib/gcc/arm-linux-androideabi/4.6/libgcc.a \
	-lc \
	-ldl \
	-lstdc++ \
	-lm

$(obj).target/webrtc/modules/libwebrtc_video_coding.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/webrtc/modules/libwebrtc_video_coding.a: LIBS := $(LIBS)
$(obj).target/webrtc/modules/libwebrtc_video_coding.a: TOOLSET := $(TOOLSET)
$(obj).target/webrtc/modules/libwebrtc_video_coding.a: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,alink)

all_deps += $(obj).target/webrtc/modules/libwebrtc_video_coding.a
# Add target alias
.PHONY: webrtc_video_coding
webrtc_video_coding: $(obj).target/webrtc/modules/libwebrtc_video_coding.a

# Add target alias to "all" target.
.PHONY: all
all: webrtc_video_coding

# Add target alias
.PHONY: webrtc_video_coding
webrtc_video_coding: $(builddir)/libwebrtc_video_coding.a

# Copy this to the static library output path.
$(builddir)/libwebrtc_video_coding.a: TOOLSET := $(TOOLSET)
$(builddir)/libwebrtc_video_coding.a: $(obj).target/webrtc/modules/libwebrtc_video_coding.a FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/libwebrtc_video_coding.a
# Short alias for building this static library.
.PHONY: libwebrtc_video_coding.a
libwebrtc_video_coding.a: $(obj).target/webrtc/modules/libwebrtc_video_coding.a $(builddir)/libwebrtc_video_coding.a

# Add static library to "all" target.
.PHONY: all
all: $(builddir)/libwebrtc_video_coding.a
