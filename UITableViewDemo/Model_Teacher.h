//
//  Model_Teacher.h
//  UITableViewDemo
//
//  Created by ezt on 15/11/5.
//  Copyright © 2015年 GE. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Model_Teacher : JSONModel

@property (nonatomic, copy) NSString<Optional> * name;

@property (nonatomic, copy) NSString<Optional> * position;

@property (nonatomic, copy) NSString<Optional> * subject;

@end
