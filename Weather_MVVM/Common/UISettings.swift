//
//  UISettings.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit

//MARK: - ScreenSize -
struct ScreenSize
{
    static let WIDTH                = UIScreen.mainScreen().bounds.size.width
    static let HEIGHT               = UIScreen.mainScreen().bounds.size.height
    static let MAX_LENGTH           = max(ScreenSize.WIDTH, ScreenSize.WIDTH)
    static let MIN_LENGTH           = min(ScreenSize.HEIGHT, ScreenSize.HEIGHT)
}

//MARK: - DeviceType -

enum DeviceType
{
    static let IS_IPHONE                = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MAX_LENGTH < 568.0
    static let IS_IPHONE_5              = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MAX_LENGTH == 568.0
    static let IS_IPHONE_6              = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MAX_LENGTH == 667.0
    static let IS_IPHONE_6P             = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MAX_LENGTH == 736.0
    static let IS_IPAD                  = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.MAX_LENGTH == 1024.0
}

//MARK: - System Version -

struct Version
{
    static let SYS_VERSION_FLOAT        = (UIDevice.currentDevice().systemVersion as NSString).floatValue
    static let iOS8                     = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
    static let iOS9                     = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
}

//MARK: - Multiplier -

let IPHONE_4_SCALE : CGFloat            = 480  / 736
let IPHONE_5_SCALE : CGFloat            = 568  / 736
let IPHONE_6_SCALE : CGFloat            = 667  / 736
let IPAD_SCALE : CGFloat                = 1024 / 736

//MARK: - Colors Constants -
let BLACK                               = UIColor.blackColor()
let WHITE                               = UIColor.whiteColor()
let CLEAR                               = UIColor.clearColor()

//MARK: - Navigation Bar Constants -
let NAV_FONT                            = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 25 : 18)
let NAV_HEIGHT : CGFloat                = 64

//MARK: - Landing Constants -
let LA_ICON_SIZE : CGFloat              = DeviceType.IS_IPAD ? 50     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 50     : DeviceType.IS_IPHONE_6 ? 50   * IPHONE_6_SCALE : 50   * IPHONE_5_SCALE
let LA_INSET : CGFloat                  = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let LA_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 6      * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 6      : DeviceType.IS_IPHONE_6 ? 6    * IPHONE_6_SCALE : 6    * IPHONE_5_SCALE
let LA_CELL_HEIGHT : CGFloat            = DeviceType.IS_IPAD ? 220    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 220    : DeviceType.IS_IPHONE_6 ? 220  * IPHONE_6_SCALE : 220  * IPHONE_5_SCALE
let LA_LBL_FONT                         = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 14     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_SCALE)
let LA_TEMP_FONT                        = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 60     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 60     : DeviceType.IS_IPHONE_6 ? 60   * IPHONE_6_SCALE : 60   * IPHONE_5_SCALE)
let TITLE_LBL_FONT                      = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE)
let TITLE_BTN_FONT                      = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 16     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 16     : DeviceType.IS_IPHONE_6 ? 16   * IPHONE_6_SCALE : 16   * IPHONE_5_SCALE)

//MARK: - Detail Constants -
let DE_INSET : CGFloat                  = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let DE_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_SCALE
let DE_TOP_HEIGHT : CGFloat             = DeviceType.IS_IPAD ? 300    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 300    : DeviceType.IS_IPHONE_6 ? 300  * IPHONE_6_SCALE : 300  * IPHONE_5_SCALE
let DE_BOTTOM_HEIGHT : CGFloat          = DeviceType.IS_IPAD ? 60     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 60     : DeviceType.IS_IPHONE_6 ? 60   * IPHONE_6_SCALE : 60   * IPHONE_5_SCALE
let DE_DAY_CELL_HEIGHT : CGFloat        = DeviceType.IS_IPAD ? 45     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 45     : DeviceType.IS_IPHONE_6 ? 45   * IPHONE_6_SCALE : 45   * IPHONE_5_SCALE
let DE_TIME_CELL_SIZE : CGFloat         = DeviceType.IS_IPAD ? 75     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 75     : DeviceType.IS_IPHONE_6 ? 75   * IPHONE_6_SCALE : 75   * IPHONE_5_SCALE
let DE_ICON_SIZE : CGFloat              = DeviceType.IS_IPAD ? 80     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 80     : DeviceType.IS_IPHONE_6 ? 80   * IPHONE_6_SCALE : 80   * IPHONE_5_SCALE
let DE_BTN_SIZE : CGFloat               = DeviceType.IS_IPAD ? 50     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 50     : DeviceType.IS_IPHONE_6 ? 50   * IPHONE_6_SCALE : 50   * IPHONE_5_SCALE
let DE_NAME_FONT                        = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_SCALE)
let DE_TITLE_FONT                       = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 18     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 18     : DeviceType.IS_IPHONE_6 ? 18   * IPHONE_6_SCALE : 18   * IPHONE_5_SCALE)
let DE_TEMP_FONT                        = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 150    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 150    : DeviceType.IS_IPHONE_6 ? 150  * IPHONE_6_SCALE : 150  * IPHONE_5_SCALE)


