//
//  AddressSelectorConfig.swift
//  AddressSelectorModule
//
//  Created by tofuls on 2022/12/15.
//

import UIKit

public class AddrSelectorConfig: NSObject {
    static public let share: AddrSelectorConfig = AddrSelectorConfig()
    
    public var defaultSelectedColor: UIColor = RGBA(r: 255, g: 99, b: 8, a: 1)
    public var defaultTitleColor: UIColor = UIColor.black
    public var defaultTitleFont: UIFont = PingFangSC_M(16)
    public var defaultCellColor: UIColor = RGBA(r: 51, g: 51, b: 51, a: 1)
    public var defaultCellFont: UIFont = PingFangSC_M(14)
    
    public var areaPath: String?
    
    class private func RGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    //MARK: - 颜色方法
    class private func PingFangSC_R(_ size: CGFloat) -> UIFont {
        return FontName(name: "PingFangSC-Regular", size: size)
    }
    class private func PingFangSC_L(_ size: CGFloat) -> UIFont {
        return FontName(name: "PingFangSC-Light", size: size)
    }
    class private func PingFangSC_M(_ size: CGFloat) -> UIFont {
        return FontName(name: "PingFangSC-Medium", size: size)
    }
    class private func PingFangSC_S(_ size: CGFloat) -> UIFont {
        return FontName(name: "PingFangSC-Semibold", size: size)
    }
    
    class private func FontName(name: String, size: CGFloat) -> UIFont {
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    
    class public func getLocationStr(proviceCode: String, cityCode: String, areaCode: String, streetCode: String, cb: ((String, String, String, String) -> Void)?) {
        var allDict: [String: Any] = [:]
        var jsonPath = AddrSelectorConfig.share.areaPath
        if jsonPath?.isEmpty ?? true {
            jsonPath = ResoureUtil.getResourcePath("area_format_object", ofType: "json")
        }
        if let path = jsonPath {
            do {
                let data = try NSData.init(contentsOfFile: path) as Data
                if let dict = self.dataToDictionary(data: data) {
                    allDict = dict
                }
            } catch {
                print("error：获取行政区数据失败。")
            }
        } else {
            print("error：获取行政区数据失败。原因：url为空")
        }
        let locationModel = CountryModel(dict: allDict)
        var provice = ""
        for addrInfo in locationModel.provinces {
            if addrInfo.code == proviceCode {
                provice = addrInfo.name ?? ""
                break
            }
        }
        let proviceModel = locationModel.provinceDict[provice]
        var city = ""
        if let proArr = proviceModel?.cities {
            for addrInfo in proArr {
                if addrInfo.code == cityCode {
                    city = addrInfo.name ?? ""
                    break
                }
            }
        }
        let cityModel = proviceModel?.citiesDict[city]
        var area = ""
        if let cityArr = cityModel?.areas {
            for addrInfo in cityArr {
                if addrInfo.code == areaCode {
                    area = addrInfo.name ?? ""
                    break
                }
            }
        }
        let areaModel = cityModel?.areasDict[area]
        var street = ""
        if let strArr = areaModel?.streets {
            for addrInfo in strArr {
                if addrInfo.code == streetCode {
                    street = addrInfo.name ?? ""
                    break
                }
            }
        }
        cb?(provice, city, area, street)
    }
    
    class private func dataToDictionary(data: Data) -> Dictionary<String, Any>? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)

            let dic = json as! Dictionary<String, Any>

            return dic

        } catch _ {
            print("失败")
            return nil
        }
    }
}
