//
//  ViewController.swift
//  6st_hw_LeeYouhyeon
//
//  Created by 이유현 on 11/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    let parts = ["iOS", "WEB", "SERVER"]
    var allMembers: [Member] = []  // 테이블 뷰에 표시할 멤버 정보 리스트
    var selectedIndex: Int?     // 선택된 셀의 인덱스
    
    let tableViewUI: UITableView = {
        let tableVIew = UITableView()
//        tableVIew.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        tableVIew.translatesAutoresizingMaskIntoConstraints = false
        return tableVIew
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 내비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = .white
        
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        setUI()
        
        getAllMembers()
        NotificationCenter.default.addObserver(self, selector: #selector(getAllMembers), name: .postNotification, object: nil)
        
    }

    func setUI(){
        
        let contentView: UIView = {
            let contents = UIView()
            contents.translatesAutoresizingMaskIntoConstraints = false
            return contents
        }()
        
        let title: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            label.text = "UrlSession"
            label.textColor = UIColor.black
            return label
        }()
        
        let AddButton : UIButton = {
            let button = UIButton()
            button.setTitle("추가", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(tapAddModalButton), for: .touchUpInside)
            return button
        }()
        
        view.addSubview(contentView)
        contentView.addSubview(tableViewUI)
        contentView.addSubview(title)
        contentView.addSubview(AddButton)
        
        tableViewUI.register(MemberListCell.self, forCellReuseIdentifier: "memberListCell")
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            AddButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            AddButton.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 100),
            AddButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            tableViewUI.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 40),
            tableViewUI.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
        ])
        
    }
    
    @objc func tapAddModalButton() {
        print("콘솔창 확인")
        let modalViewController = ModalAddViewController()
        modalViewController.modalPresentationStyle = .formSheet
        self.present(modalViewController, animated: true)
    }
    
    @objc func getAllMembers() {
        // 모든 멤버를 가져오기 전에 배열 초기화
        allMembers.removeAll()
        
        let dispatchGroup = DispatchGroup()
        
        for part in parts {
            dispatchGroup.enter() // 그룹에 작업 추가
            
            APIService.shared.getMembers(part: part) { members, error in
                DispatchQueue.main.async {
                    if let error = error {
                        print("Error fetching members for \(part): \(error)")
                    } else if let members = members {
//                        print("추가된 멤버 확인 \(members) \n")
                        self.allMembers.append(contentsOf: members) // 해당 파트 멤버 추가
                    }
                    dispatchGroup.leave() // 작업 완료
                }
            }
        }
        
        // 모든 작업 완료 후 실행할 코드
        dispatchGroup.notify(queue: .main) {
            self.tableViewUI.reloadData() // 테이블 뷰 업데이트
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 테이블 뷰의 셀 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMembers.count
    }
    
    // 각 셀에 표시할 데이터 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memberListCell", for: indexPath) as? MemberListCell else {
            return UITableViewCell()
        }
        
        let member = allMembers[indexPath.row]
        cell.part.text = "[ \(member.part) ]"  // 셀에 멤버의 파트와 이름 표시
        cell.name.text = "\(member.name)"
        return cell
    }
    
    // 셀이 선택되었을 때 호출되는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row  // 선택된 셀의 인덱스 저장
        
        let modalViewController = DetailModalController()
        let member = allMembers[indexPath.row]
        
        modalViewController.selectMember = member

        modalViewController.modalPresentationStyle = .formSheet
        self.present(modalViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
}


