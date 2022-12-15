//
//  LWAddressPickViewTableViewCell.swift
//  Group
//
//  Created by
//  Copyright  reserved.
//

import UIKit

class LWAddressPickViewTableViewCell: UITableViewCell {
    static let identifier = "LWAddressPickViewTableViewCell"

    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 12, y: 8, width: 250, height: 24))
        label.font = AddrSelectorConfig.share.defaultCellFont
        label.textColor = AddrSelectorConfig.share.defaultCellColor
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        drawMyView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func drawMyView() {
        self.addSubview(label)
    }
}

class LWAddressPickViewFirstTableViewCell: UITableViewCell {
    static let identifier = "LWAddressPickViewFirstTableViewCell"

    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 12, y: 11.5, width: 100, height: 17))
        label.font = AddrSelectorConfig.share.defaultCellFont
        label.textColor = AddrSelectorConfig.share.defaultCellColor
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        drawMyView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func drawMyView() {
        self.addSubview(label)
    }
}
