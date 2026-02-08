# 适配iOS15+无根越狱的Tweak编译配置
ARCHS = arm64 arm64e
TARGET = iphone:clang:15.0:15.0
INSTALL_TARGET_PROCESSES = YoudaoNote

# 关键：指定无根越狱模式
THEOS_PACKAGE_SCHEME = rootless

# 插件名称（自定义，保持英文）
TOOL_NAME = YNCloudNoteVIP

# 编译源文件与参数
YNCloudNoteVIP_FILES = Tweak.x
YNCloudNoteVIP_CFLAGS = -fobjc-arc -Wno-error=deprecated-declarations -Wno-unused-variable
YNCloudNoteVIP_FRAMEWORKS = Foundation UIKit
YNCloudNoteVIP_LIBRARIES = hooker

# Theos路径配置（如果你的Theos不在默认路径，需修改下面的路径）
# export THEOS=/opt/theos