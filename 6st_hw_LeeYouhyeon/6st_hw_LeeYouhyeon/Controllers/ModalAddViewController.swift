//
//  ModalAddViewController.swift
//  6st_hw_LeeYouhyeon
//
//  Created by 이유현 on 11/1/24.
//

import Foundation
import UIKit

//포스트 후 데이터 업데이트를 위함
extension Notification.Name {
    static let postNotification = Notification.Name("postNotification")
}

class ModalAddViewController: UIViewController {
    var mode :String = "add"
    var selectMember: Member?
    
    // 텍스트 필드
     let nameTextField: UITextField = {
         let field = UITextField()
         field.translatesAutoresizingMaskIntoConstraints = false
         field.placeholder = "이름을 입력해주세요"
         field.borderStyle = .roundedRect
         field.font = UIFont.systemFont(ofSize: 15)
         field.textColor = UIColor.black
         return field
     }()
    
    let ageTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "나이를 입력해주세요"
        field.keyboardType = .numberPad
        field.borderStyle = .roundedRect
        field.font = UIFont.systemFont(ofSize: 15)
        field.textColor = UIColor.black
        return field
    }()
    
    let partTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "파트를 입력해주세요"
        field.borderStyle = .roundedRect
        field.font = UIFont.systemFont(ofSize: 15)
        field.textColor = UIColor.black
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = .white
        
        if mode == "edit", let selectMember = selectMember {
            nameTextField.text = selectMember.name
        }
        if mode == "edit", let selectMember = selectMember {
            ageTextField.text = String(selectMember.age)
        }
        if mode == "edit", let selectMember = selectMember {
            partTextField.text = selectMember.part
        }
        
        setUI()
    }
    
    func setUI(){
        
        let contentView: UIView = {
            let contents = UIView()
            contents.translatesAutoresizingMaskIntoConstraints = false
            return contents
        }()
        
        let AddButton : UIButton = {
            let button = UIButton()
            
            if mode == "add" {
                button.setTitle("추가하기", for: .normal)
                button.addTarget(self, action: #selector(addAndDismissModal), for: .touchUpInside)
            }
            else{
                button.setTitle("수정하기", for: .normal)
                button.addTarget(self, action: #selector(editAndDismissModal), for: .touchUpInside)
            }
            button.setTitleColor(.systemBlue, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        view.addSubview(contentView)
        contentView.addSubview(nameTextField)
        contentView.addSubview(ageTextField)
        contentView.addSubview(partTextField)
        contentView.addSubview(AddButton)
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            ageTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ageTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            ageTextField.heightAnchor.constraint(equalToConstant: 40),
            
            partTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 15),
            partTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            partTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            partTextField.heightAnchor.constraint(equalToConstant: 40),
            
            AddButton.topAnchor.constraint(equalTo: ageTextField.topAnchor, constant: 500),
            AddButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            AddButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            
        ])
        
    }
    
    @objc func addAndDismissModal(){
        guard let name = nameTextField.text, !name.isEmpty,
              let ageText = ageTextField.text,
              let part = partTextField.text,!part.isEmpty,
              let age = Int(ageText) else {
            showAlert(message: "입력 데이터가 올바르지 않습니다.")
            return
        }
        
        // Member 인스턴스 생성
        let newMember = SendMember(name: name, part: part, age: age)
        // 확인용 출력
        print("저장된 멤버: \(newMember)")
        //나중에 notificationcenter로 확인 후 서버 전달
        
        APIService.shared.postMember(data: newMember) { error in
            DispatchQueue.main.async { // UI 업데이트는 메인 스레드에서 수행해야 합니다.
                if let error = error {
                    print("Error posting members!: \(error)")
                } else {
                    print("Member posted successfully!")
                    
                    NotificationCenter.default.post(name: .postNotification, object: nil)
                }
            }
        }
        
        self.dismiss(animated: true)
    }
    
    //수정
    @objc func editAndDismissModal(){
        guard let name = nameTextField.text, !name.isEmpty,
              let ageText = ageTextField.text,
              let part = partTextField.text,!part.isEmpty,
              let age = Int(ageText) else {
            showAlert(message: "입력 데이터가 올바르지 않습니다.")
            return
        }
        
        // Member 인스턴스 생성
        let newMember = SendMember(name: name, part: part, age: age)
        // 확인용 출력
        print("저장된 멤버: \(newMember)")
        //나중에 notificationcenter로 확인 후 서버 전달
        
        guard let selectMember = selectMember else {
            return
        }
        
        APIService.shared.updateMember(withId: selectMember.id, data: newMember){ error in
            DispatchQueue.main.async { // UI 업데이트는 메인 스레드에서 수행해야 합니다.
                if let error = error {
                    print("Error posting members!: \(error)")
                } else {
                    print("Member posted successfully!")
                    
                    NotificationCenter.default.post(name: .postNotification, object: nil)
                }
            }
        }
        
        self.dismiss(animated: true)
    }
    
    //알람 표시
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        // 현재 뷰 컨트롤러에서 경고창을 표시
        self.present(alertController, animated: true, completion: nil)
    }
}
