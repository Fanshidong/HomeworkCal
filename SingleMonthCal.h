//
//  SingleMonthCal.h
//  HomeworkCal
//
//  Created by Fanshidong on 15/10/20.
//  Copyright © 2015年 Fanshidong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleMonthCal : NSObject{
    int _year;
    int _len;
    int _mouth;
    int _dayData[8][8];
    NSArray *_mouthName;
    NSArray *_weekName;
    NSArray *_numbDay;
}
- (void) setDate:(NSString*)mouth AndYear:(NSString*)year :(BOOL)stop;
- (int) getDayDataX:(int)x AndY:(int)y;
- (void) outWeekName;
- (void) outMouthName:(int)mouth;
- (int) getLen;
    
@end
