# 第一步：引入Theos通用编译规则（必须是第一行，不能改）
include $(THEOS)/makefiles/common.mk

# ===================== Tweak核心配置 =====================
# 插件名称（Tweak专属，绝对不能用TOOL_NAME）
TWEAK_NAME = YNCloudNoteVIP

# 适配iOS15+无根越狱（核心）
THEOS_PACKAGE_SCHEME = rootless

# 编译架构&SDK版本（匹配15.5 SDK，兼容iOS15.0+）
ARCHS = arm64 arm64e
TARGET = iphone:clang:15.5:15.0
INSTALL_TARGET_PROCESSES = YoudaoNote

# ===================== 编译参数 =====================
# 源文件
YNCloudNoteVIP_FILES = Tweak.x
# 编译标记（ARC模式+关闭无用警告）
YNCloudNoteVIP_CFLAGS = -fobjc-arc -Wno-error=deprecated-declarations -Wno-unused-variable
# 依赖的系统框架
YNCloudNoteVIP_FRAMEWORKS = Foundation UIKit
# 依赖的LibHooker库（无根越狱必需）
YNCloudNoteVIP_LIBRARIES = substrate

# 使用 dpkg-deb 替代 dm.pl（重要！）
ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
    THEOS_PACKAGE_TOOL = dpkg-deb
endif
# 设置使用 xz 压缩以兼容新版 dpkg-deb
THEOS_PACKAGE_COMPRESSION = xz
# 第二步：引入Tweak专属打包规则（必须最后一行）
include $(THEOS_MAKE_PATH)/tweak.mk

