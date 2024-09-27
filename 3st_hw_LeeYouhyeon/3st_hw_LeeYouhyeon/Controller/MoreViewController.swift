//
//  MoreViewController.swift
//  3st_hw_LeeYouhyeon
//
//  Created by 이유현 on 9/24/24.
//

//import Foundation
import UIKit

class MoreViewController: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
    
    func setUI(){
        let label1: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "More"
            label.textColor = .white
            return label
        }()
        
        view.addSubview(label1)
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
        
    }
}
