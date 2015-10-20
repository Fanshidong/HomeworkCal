//
//  ALlMouthCal.h
//  HomeworkCal
//
//  Created by Fanshidong on 15/10/20.
//  Copyright © 2015年 Fanshidong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SingleMonthCal;
@interface ALlMouthCal : NSObject{
    int _year;
    SingleMonthCal *TWMouthCal[12];
}
- (void) setYear:(NSString *) year;
@end
