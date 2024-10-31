//
//  MemberListCell.swift
//  6st_hw_LeeYouhyeon
//
//  Created by 이유현 on 11/1/24.
//

import Foundation
import UIKit

class MemberListCell: UITableViewCell{
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "memberListCell")
//        contentView.addSubview(label)
        setLabel()
    }
    
    func setLabel(){
        NSLayoutConstraint.activate([

        ])
    }
}
