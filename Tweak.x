/**
 * 有道云笔记iOS15无根越狱VIP Tweak
 * 功能：强制将YNUserVIPInfoModel的isVIP设为YES
 * 适配：iOS15+ 无根越狱（XinaA15/Fugu15等）
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 声明目标类，避免编译警告
@class YNUserVIPInfoModel;

// Hook YNUserVIPInfoModel类
%hook YNUserVIPInfoModel

// 重写isVIP属性的getter方法，强制返回YES
- (BOOL)isVIP {
    NSLog(@"[YNCloudNoteVIP] 拦截isVIP调用，强制返回YES");
    return YES;
}

// 可选：修改VIP等级为最高（根据实际需求调整）
- (NSInteger)vipLevel {
    return 9; // 自定义VIP等级，数值可根据有道云实际等级调整
}

%end

// 插件加载入口
%ctor {
    // 仅对有道云笔记生效，避免影响其他App
    NSString *bundleID = [NSBundle mainBundle].bundleIdentifier;
    if ([bundleID isEqualToString:@"com.youdao.note"]) {
        NSLog(@"[YNCloudNoteVIP] 有道云笔记已加载，VIP Tweak生效");
    } else {
        NSLog(@"[YNCloudNoteVIP] 非目标App，不执行Hook");
    }
}