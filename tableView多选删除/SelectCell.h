//
//  SelectCell.h
//  tableView多选删除
//
//  Created by wuguangquan on 2021/1/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SelectCellDelegate <NSObject>

-(void)selectStatus:(NSInteger)pIndex;

@end


@interface SelectCell : UITableViewCell
@property(nonatomic,strong) UILabel * pTitleLabel;
@property(nonatomic,strong) UIButton * selectBtn;
@property(nonatomic,weak)id<SelectCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
