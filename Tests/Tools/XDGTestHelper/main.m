//
//  main.c
//  xdgTestHelper
//
//  Created by mrz on 2020/7/20.
//  Copyright © 2020 Swift. All rights reserved.
//

#import "main.h"
@import CoreFoundation;

static void timerFired(CFRunLoopTimerRef timer, void *context)
{
    static int i = 0;
    printf("%d\n", i++);
}

void testRunloop() {
    CFAbsoluteTime fireDate = CFAbsoluteTimeGetCurrent() + 1;
    CFRunLoopTimerContext context = { 0, 0, 0, 0, 0 };
    CFRunLoopTimerRef timer = CFRunLoopTimerCreate(0, fireDate, 1, 0, 0, timerFired, &context);
    //    CFRunLoopTimerSetTolerance(timer, 1);
    CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes);
    CFRunLoopRun();
}


int main() {
    @autoreleasepool {
        testRunloop();
    }
    return 0;
}

