//
//  BorderButton.h
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/07/28.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

#ifndef BorderButton_h
#define BorderButton_h


#endif /* BorderButton_h */

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface BorderButton : UIButton

@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end
