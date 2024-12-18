
import Foundation
import UIKit

extension Notification.Name {
    static let deleteNotification = Notification.Name("deleteNotification")
}

class DetailModalController: UIViewController {
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
        
        let DeleteButton : UIButton = {
            let button = UIButton()
            button.setTitle("Delete", for: .normal)
            button.setTitleColor(.systemRed, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(DeleteAndDismissModal), for: .touchUpInside)
            return button
        }()
        
        let EditButton : UIButton = {
            let button = UIButton()
            button.setTitle("Edit", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(EditAndDismissModal), for: .touchUpInside)
            return button
        }()
        
        let name: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            label.textColor = UIColor.black
            
            if let selectMember = selectMember {
                label.text = selectMember.name
            } else {
                print("해당 데이터 없음")
            }
        
            return label
        }()
        
        let age: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            label.textColor = UIColor.black
            
            if let selectMember = selectMember {
                label.text = "Age: " + String (selectMember.age)
            } else {
                print("해당 데이터 없음")
            }
            
            return label
        }()
        
        let part: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            label.textColor = UIColor.black
            
            if let selectMember = selectMember {
                label.text = "Part: " + selectMember.part
            } else {
                print("해당 데이터 없음")
            }
            
            return label
        }()
        
        view.addSubview(contentView)
        contentView.addSubview(DeleteButton)
        contentView.addSubview(EditButton)
        contentView.addSubview(name)
        contentView.addSubview(age)
        contentView.addSubview(part)
        
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            DeleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            DeleteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            EditButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            EditButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
           
            age.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 200),
            age.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            age.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            part.topAnchor.constraint(equalTo: age.bottomAnchor, constant: 10),
            part.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            part.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
        
    }
    
    @objc func DeleteAndDismissModal(){
        print("삭제")
        guard let selectMember = selectMember else {
            return
        }
        
        APIService.shared.deleteMember(withId: selectMember.id) { error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error posting members!: \(error)")
                } else {
                    print("Member posted successfully!")
                    
                    NotificationCenter.default.post(name: .deleteNotification, object: nil)
                }
            }
        }
        
        self.dismiss(animated: true)
    }
    
    @objc func EditAndDismissModal(){
        print("수정")
        guard let selectMember = selectMember else {
            return
        }
        
        // 현재 모달을 닫고, 닫힌 후에 새로운 모달을 표시합니다.
        self.dismiss(animated: true) { [weak self] in
            // ModalAddViewController 생성 및 설정
            let modalViewController = ModalAddViewController()
            modalViewController.selectMember = selectMember
            modalViewController.mode = "edit"
            
            // 현재 topmost viewController를 찾아 새로운 모달을 표시합니다.
            if let topController = UIApplication.shared.keyWindow?.rootViewController {
                topController.present(modalViewController, animated: true)
            }
        }
    }

    
}

