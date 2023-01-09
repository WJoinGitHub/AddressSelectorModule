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
    var provinces: Array<AddrInfoModel> = []
    init(dict: [String: Any]) {
        for key in dict.keys.sorted() {
            var info = AddrInfoModel()
            info.code = key
            if let dict = dict[key] as? [String: Any] {
                if dict.keys.contains("n") {
                    if let province = dict["n"] as? String {
                        info.name = province
                        provinces.append(info)
                        if dict.keys.contains("c") {
                            if let clDict = dict["c"] as? [String: Any] {
                                let model = ProvinceModel(dict: clDict)
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
    var cities: Array<AddrInfoModel> = []
    init(dict: [String: Any]) {
        for key in dict.keys.sorted() {
            var info = AddrInfoModel()
            info.code = key
            if let dict = dict[key] as? [String: Any] {
                if dict.keys.contains("n") {
                    if let city = dict["n"] as? String {
                        info.name = city
                        cities.append(info)
                        if dict.keys.contains("c") {
                            if let clDict = dict["c"] as? [String: Any] {
                                let model = CityModel(dict: clDict)
                                citiesDict[city] = model
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
    var areas: Array<AddrInfoModel> = []
    init(dict: [String: Any]) {
        for key in dict.keys.sorted() {
            var info = AddrInfoModel()
            info.code = key
            if let dict = dict[key] as? [String: Any] {
                if dict.keys.contains("n") {
                    if let area = dict["n"] as? String {
                        info.name = area
                        areas.append(info)
                        if dict.keys.contains("c") {
                            if let clDict = dict["c"] as? [String: Any] {
                                let model = AreaModel(dict: clDict)
                                areasDict[area] = model
                            }
                        }
                    }
                }
            }
        }
    }
}

public struct AreaModel {
    var streets: Array<AddrInfoModel> = []
    init(dict: [String: Any]) {
        for key in dict.keys.sorted() {
            var info = AddrInfoModel()
            info.code = key
            if let dict = dict[key] as? [String: Any] {
                if dict.keys.contains("n") {
                    if let street = dict["n"] as? String {
                        info.name = street
                        streets.append(info)
                    }
                }
            }
        }
    }
}

public struct AddrInfoModel {
    var name: String?
    var code: String?
}

