//
//  ImageUtil.swift
//  BaseUI
//
//  Created by tofuls on 2022/12/14.
//

import UIKit

public class ResoureUtil: NSObject {
    static public func getBaseUIFrameworkBundle(_ moduleName: String = "AddressSelectorModule") -> Bundle? {
        // 先进入MainBundle下的Frameworks文件夹下
        if var bundleURL = Bundle.main.url(forResource: "Frameworks", withExtension: nil) {
            // 再进入InformationModule.framework包下
            bundleURL = bundleURL.appendingPathComponent(moduleName)
            bundleURL = bundleURL.appendingPathExtension("framework")
            // 拿到InformationModule.framework的Bundle
            return Bundle(url: bundleURL)
        }
        return nil
    }
    
    static public func imageName(_ name: String) -> UIImage? {
        if let imgBundle = ResoureUtil.getBaseUIFrameworkBundle() {
            // 获取InformationModuleImageBundle.bundle路径
            if let tempBundleURL = imgBundle.url(forResource: "AddressSelectorModule", withExtension: "bundle") {
                // 获取InformationModuleImageBundle.bundle的Bundle
                let tempBundle = Bundle(url: tempBundleURL)
                // 拿InformationModuleImageBundle.bundle下的头文件
                if let file = tempBundle?.path(forResource: name, ofType: "png") {
                    return UIImage(contentsOfFile: file)
                }
            }
        }
        return nil
    }
    
    static public func getResourcePath(_ name: String, ofType: String) -> String? {
        if let imgBundle = ResoureUtil.getBaseUIFrameworkBundle() {
            // 获取InformationModuleImageBundle.bundle路径
            if let tempBundleURL = imgBundle.url(forResource: "AddressSelectorModule", withExtension: "bundle") {
                // 获取InformationModuleImageBundle.bundle的Bundle
                let tempBundle = Bundle(url: tempBundleURL)
                // 拿InformationModuleImageBundle.bundle下的头文件
                return tempBundle?.path(forResource: name, ofType: ofType)
            }
        }
        return nil
    }
}
