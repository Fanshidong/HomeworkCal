//
//  CommondController.h
//  HomeworkCal
//
//  Created by Fanshidong on 15/10/20.
//  Copyright © 2015年 Fanshidong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommondController : NSObject{

    char string[50];
    NSArray *_commond;
    NSString *_mouth;
    NSString *_year;
    
}

- (BOOL) scanfCommond;
- (NSString*) getMouth;
- (NSString*) getYear;
- (int) getCount;
@end
