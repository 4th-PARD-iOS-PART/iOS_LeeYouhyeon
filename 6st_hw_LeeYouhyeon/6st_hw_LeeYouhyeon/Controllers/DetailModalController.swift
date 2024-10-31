
import Foundation
import UIKit

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
        self.dismiss(animated: true)
    }
    
    @objc func EditAndDismissModal(){
        print("수정")
        self.dismiss(animated: true)
    }
    
}

