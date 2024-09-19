################################################################################
#
# openttd
#
################################################################################

OPENTTD_SITE = https://github.com/OpenTTD/OpenTTD.git
OPENTTD_VERSION = 13.4
OPENTTD_SITE_METHOD = git
OPENTTD_GIT_SUBMODULES = YES
OPENTTD_CONF_OPTS =
OPENTTD_SUPPORTS_IN_SOURCE_BUILD=NO
OPENTTD_DEPENDENCIES = xlib_libX11 sdl zlib xz libpng sdl freetype fontconfig icu host-openttd host-pkgconf
HOST_OPENTTD_DEPENDENCIES =
#OPENTTD_CXXFLAGS +=
#OPENTTD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(OPENTTD_CXXFLAGS)"

OPENTTD_CONF_OPTS += -DSSE_FOUND:INTERNAL=0

define HOST_OPENTTD_BUILD_CMDS
	$(HOST_MAKE_ENV) $(OPENTTD_MAKE_ENV) $(MAKE1) $(OPENTTD_MAKE_OPTS) -C $(HOST_OPENTTD_BUILDDIR) strgen settingsgen
endef

define HOST_OPENTTD_INSTALL_CMDS
	cp $(HOST_OPENTTD_BUILDDIR)/src/strgen/strgen $(HOST_DIR)/bin
	cp $(HOST_OPENTTD_BUILDDIR)/src/settingsgen/settingsgen $(HOST_DIR)/bin
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))

#(encouraged) liblzma: (de)compressing of savegames (1.1.0 and later)
