//
//  SelectCell.m
//  tableView多选删除
//
//  Created by wuguangquan on 2021/1/21.
//

#import "SelectCell.h"

@interface SelectCell ()


@end


@implementation SelectCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    _selectBtn =[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    [_selectBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_selectBtn];
    
    
    _pTitleLabel =[[UILabel alloc]initWithFrame:CGRectMake(40, 15, 180, 20)];
    [self.contentView addSubview:_pTitleLabel];
}
-(void)btnClicked:(UIButton *)btn
{
    if([self.delegate respondsToSelector:@selector(selectStatus:)])
    {
        [self.delegate selectStatus:btn.tag];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
