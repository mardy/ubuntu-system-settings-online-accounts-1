#-----------------------------------------------------------------------------
# Common configuration for all projects.
#-----------------------------------------------------------------------------

# we don't like warnings...
QMAKE_CXXFLAGS += -Werror
# Disable RTTI
QMAKE_CXXFLAGS += -fno-exceptions -fno-rtti

TOP_SRC_DIR = $$PWD
TOP_BUILD_DIR = $${TOP_SRC_DIR}/$(BUILD_DIR)

include(coverage.pri)

#-----------------------------------------------------------------------------
# setup the installation prefix
#-----------------------------------------------------------------------------
INSTALL_PREFIX = /usr  # default installation prefix

# default prefix can be overriden by defining PREFIX when running qmake
isEmpty(PREFIX) {
    message("====")
    message("==== NOTE: To override the installation path run: `qmake PREFIX=/custom/path'")
    message("==== (current installation path is `$${INSTALL_PREFIX}')")
} else {
    INSTALL_PREFIX = $${PREFIX}
    message("====")
    message("==== install prefix set to `$${INSTALL_PREFIX}'")
}

PLUGIN_MANIFEST_DIR = $$system("pkg-config --define-variable=prefix=$${INSTALL_PREFIX} --variable plugin_manifest_dir SystemSettings")
PLUGIN_MODULE_DIR = $$system("pkg-config --define-variable=prefix=$${INSTALL_PREFIX} --variable plugin_module_dir SystemSettings")
PLUGIN_QML_DIR = $$system("pkg-config --define-variable=prefix=$${INSTALL_PREFIX} --variable plugin_qml_dir SystemSettings")
