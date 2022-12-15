//
//  ViewController.swift
//  AddressSelectorModule
//
//  Created by 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 on 12/14/2022.
//  Copyright (c) 2022 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. All rights reserved.
//

import UIKit

import AddressSelectorModule

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        btn.center = self.view.center
        btn.backgroundColor = UIColor.init(red: 225/255.0, green: 225/255.0, blue: 225/255.0, alpha: 1)
        btn.setTitle("地址选择器", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        self.view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc
    func btnAction() {
        AddrSelectorConfig.share.areaPath = Bundle.main.path(forResource: "area_format_object", ofType: "json")
        AddrSelectorConfig.share.defaultSelectedColor = .systemBlue
        let vc = LWAddressVC()
        vc.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.present(vc, animated: true, completion: nil)
    }

}

