//
//  Cell_Teacher.m
//  UITableViewDemo
//
//  Created by ezt on 15/11/5.
//  Copyright © 2015年 GE. All rights reserved.
//

#import "Cell_Teacher.h"
#import "Masonry.h"
#import "Constant.h"

@interface Cell_Teacher()

@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UILabel * positionLabel;
@property (nonatomic, strong) UILabel * subjectLabel;

@end

@implementation Cell_Teacher


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    
/**
 *
 *不加约束建立控件
    //nameLabel
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 80, 20)];
    [self.contentView addSubview: self.nameLabel];
    
    //positionLabel
    self.positionLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLabel.frame), 20, 150, 20)];
    [self.contentView addSubview: self.positionLabel];
    
    //subjectLabel
    self.subjectLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.nameLabel.frame)+10, 150, 20)];
    [self.contentView addSubview: self.subjectLabel];
    
    
    //分割线
    UILabel * sepLine = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.subjectLabel.frame) + 20 ,SCREEN_WIDTH , 1)];
    sepLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:sepLine];
 */
    
    
    
    //使用masonry增加约束建立
    WEAK_SELF(weakSelf);
    //弱引用，block中避免重复引用
    self.nameLabel = [UILabel new];
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.contentView.mas_left).with.offset(20);
        make.top.mas_equalTo(weakSelf.contentView.mas_top).with.offset(20);
        
        make.size.mas_equalTo(CGSizeMake(80, 20));
        
    }];
    
    self.positionLabel = [UILabel new];
    [self.contentView addSubview:self.positionLabel];
    [self.positionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.nameLabel.mas_right).with.offset(10);
        make.bottomMargin.mas_equalTo(weakSelf.nameLabel);
        make.size.mas_equalTo(CGSizeMake(150, 20));
        
    }];
    
    self.subjectLabel = [UILabel new];
    [self.contentView addSubview:self.subjectLabel];
    [self.subjectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.contentView.mas_left).with.offset(20);
        make.top.mas_equalTo(weakSelf.nameLabel.mas_bottom).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(150, 20));
        
    }];
    
    UILabel * sepLine = [UILabel new];
    [self.contentView addSubview:sepLine];
    [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.contentView.mas_left).with.offset(0);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).with.offset(0);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).with.offset(0);
        make.height.equalTo(@1);
        
    }];
    sepLine.backgroundColor = [UIColor lightGrayColor];
    
}

-(void)setModel:(Model_Teacher *)model
{
    _model = model;
    self.nameLabel.text = model.name;
    self.positionLabel.text = model.position;
    self.subjectLabel.text = model.subject;
}


@end
