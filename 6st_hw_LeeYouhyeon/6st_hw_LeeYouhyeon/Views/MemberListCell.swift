//
//  MemberListCell.swift
//  6st_hw_LeeYouhyeon
//
//  Created by 이유현 on 11/1/24.
//

import Foundation
import UIKit

class MemberListCell: UITableViewCell{
    
    let part: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor.black
        return label
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "memberListCell")
        contentView.addSubview(part)
        contentView.addSubview(name)
        setLabel()
    }
    
    func setLabel(){
        NSLayoutConstraint.activate([
            part.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            part.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
        ])
    }
}
