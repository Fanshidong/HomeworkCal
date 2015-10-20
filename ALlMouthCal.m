//
//  ALlMouthCal.m
//  HomeworkCal
//
//  Created by Fanshidong on 15/10/20.
//  Copyright © 2015年 Fanshidong. All rights reserved.
//

#import "ALlMouthCal.h"
#include "SingleMonthCal.h"

@implementation ALlMouthCal

- (int) max:(int)a :(int)b{
    return a > b ? a : b;
}
- (id) init{
    for( int i = 0 ; i < 12 ; ++ i ){
        
        TWMouthCal[i] = [SingleMonthCal new];
    }
    self = [super init];
    return self;
}
- (void) outData:(int)one :(int)two :(int)three{
    printf("             ");[TWMouthCal[one] outMouthName:one];
    printf("        ");printf("         ");printf("        ");[TWMouthCal[two] outMouthName:two];
    printf("        ");printf("         ");printf("        ");[TWMouthCal[three] outMouthName:three];
    printf("\n");
    [TWMouthCal[one] outWeekName];printf(" ");
    [TWMouthCal[two] outWeekName];printf(" ");
    [TWMouthCal[three] outWeekName];printf(" ");
    printf("\n");
    int l1 = [TWMouthCal[one] getLen];
    int l2 = [TWMouthCal[two] getLen];
    int l3 = [TWMouthCal[three] getLen];
    int l = (l1 > l2 ? l1 : l2);
    l = (l>l3?l:l3);
    for(int i = 0; i < l ; ++ i ){
        for( int j = 0 ; j < 7; ++ j ){
            if([TWMouthCal[one] getDayDataX:i AndY:j]==0) printf("    ");
            else printf("%3d ", [TWMouthCal[one] getDayDataX:i AndY:j]);
        }
        printf(" ");
        for( int j = 0 ; j < 7; ++ j ){
            if([TWMouthCal[two] getDayDataX:i AndY:j]==0) printf("    ");
            else printf("%3d ", [TWMouthCal[two] getDayDataX:i AndY:j]);
        }
        printf(" ");
        for( int j = 0 ; j < 7; ++ j ){
            if([TWMouthCal[three] getDayDataX:i AndY:j]==0) printf("    ");
            else printf("%3d ", [TWMouthCal[three] getDayDataX:i AndY:j]);
        }
        printf("\n");
    }
}
- (void) setYear:(NSString *)year{
    for( int i = 1 ; i <= 12 ; ++ i ){
        NSString *mouth = [NSString stringWithFormat:@"%d" , i];
       // NSLog(@"%@",mouth);
        [TWMouthCal[i-1] setDate:mouth AndYear:year :YES];
      
    }
    printf("%46d\n\n",[year intValue]);
    [self outData:0 :1 :2];
    [self outData:3 :4 :5];
    [self outData:6 :7 :8];
    [self outData:9 :10 :11];
}
@end
