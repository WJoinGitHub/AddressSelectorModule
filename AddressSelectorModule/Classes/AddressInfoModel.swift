//
//  AddressInfoModel.swift
//  
//
//  Created by Ethan.Wang on 2018/8/30.
//  Copyright © 2018年 Ethan. All rights reserved.
//

import Foundation

public struct CountryModel {
    var provinceDict: Dictionary<String, ProvinceModel> = [:]
    var provinces: Array<String> = []
    init(Arr: [Any]) {
        for obj in Arr {
            if let dict = obj as? [String: Any] {
                if dict.keys.contains("n") {
                    if let province = dict["n"] as? String {
                        provinces.append(province)
                        if dict.keys.contains("c") {
                            if let clDict = dict["c"] as? [String: Any] {
                                var cArr: [Any] = []
                                for key in clDict.keys.sorted() {
                                    cArr.append(clDict[key]!)
                                }
                                let model = ProvinceModel(Arr: cArr)
                                provinceDict[province] = model
                            }
                        }
                    }
                }
            }
        }
    }
}

public struct ProvinceModel {
    var citiesDict: Dictionary<String, CityModel> = [:]
    var cities: Array<String> = []
    init(Arr: [Any]) {
        for obj in Arr {
            if let dict = obj as? [String: Any] {
                if dict.keys.contains("n") {
                    if let province = dict["n"] as? String {
                        cities.append(province)
                        if dict.keys.contains("c") {
                            if let clDict = dict["c"] as? [String: Any] {
                                var cArr: [Any] = []
                                for key in clDict.keys.sorted() {
                                    cArr.append(clDict[key]!)
                                }
                                let model = CityModel(Arr: cArr)
                                citiesDict[province] = model
                            }
                        }
                    }
                }
            }
        }
    }
}

public struct CityModel {
    var areasDict: Dictionary<String, AreaModel> = [:]
    var areas: Array<String> = []
    init(Arr: [Any]) {
        for obj in Arr {
            if let dict = obj as? [String: Any] {
                if dict.keys.contains("n") {
                    if let province = dict["n"] as? String {
                        areas.append(province)
                        if dict.keys.contains("c") {
                            if let clDict = dict["c"] as? [String: Any] {
                                var cArr: [Any] = []
                                for key in clDict.keys.sorted() {
                                    cArr.append(clDict[key]!)
                                }
                                let model = AreaModel(Arr: cArr)
                                areasDict[province] = model
                            }
                        }
                    }
                }
            }
        }
    }
}

public struct AreaModel {
    var streets: Array<String> = []
    init(Arr: [Any]) {
        for obj in Arr {
            if let dict = obj as? [String: Any] {
                if dict.keys.contains("n") {
                    if let province = dict["n"] as? String {
                        streets.append(province)
                    }
                }
            }
        }
    }
}

