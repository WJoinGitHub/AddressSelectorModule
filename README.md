# 欢迎使用 AddressSelectorModule

**模块内置行政数据，数据来源https://xiangyuecn.gitee.io/areacity-jsspider-statsgov/**


AddressSelectorModule是一个四级地址选择器，更新于2022.12.15。最近刚开始弄组件化，比较简陋


## AddrSelectorConfig
选择器配置。主要是颜色和字体
```
    public var defaultSelectedColor: UIColor = RGBA(r: 255, g: 99, b: 8, a: 1)
    public var defaultTitleColor: UIColor = UIColor.black
    public var defaultTitleFont: UIFont = PingFangSC_M(16)
    public var defaultCellColor: UIColor = RGBA(r: 51, g: 51, b: 51, a: 1)
    public var defaultCellFont: UIFont = PingFangSC_M(14)
    
    public var areaPath: String?
```
areaPath 地区数据，json文件。参考https://xiangyuecn.gitee.io/areacity-jsspider-statsgov/
