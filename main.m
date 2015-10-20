//
//  main.m
//  HomeworkCal
//
//  Created by Fanshidong on 15/10/20.
//  Copyright © 2015年 Fanshidong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommondController.h"
#import "SingleMonthCal.h"
#import "ALlMouthCal.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        CommondController *cc = [CommondController new];
        SingleMonthCal *sm = [SingleMonthCal new];
        ALlMouthCal *ay = [ALlMouthCal new];
        while(true){
            if([cc scanfCommond]){
                NSLog(@"accpect");
                if([cc getCount] == 3 || [cc getCount] == 1)[sm setDate:[cc getMouth] AndYear:[cc getYear] :NO];
                if([cc getCount] == 2)[ay setYear:[cc getYear]];
            }
            else {NSLog(@"error");};
            
        }
        
    }
    return 0;
}
