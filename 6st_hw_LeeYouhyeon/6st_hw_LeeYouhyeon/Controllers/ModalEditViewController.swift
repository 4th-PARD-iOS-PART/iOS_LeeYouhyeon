//
//  ModalEditViewController.swift
//  6st_hw_LeeYouhyeon
//
//  Created by 이유현 on 11/1/24.
//

import Foundation
import UIKit

class ModalEditViewController: UIViewController {
    var selectMember: Member?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = .white
        setUI()
    }
    
    func setUI(){
        
        let contentView: UIView = {
            let contents = UIView()
            contents.translatesAutoresizingMaskIntoConstraints = false
            return contents
        }()
        
        view.addSubview(contentView)
        
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }
    
    @objc func dismissModal(){
        self.dismiss(animated: true)
//        print("ff")
    }
}

