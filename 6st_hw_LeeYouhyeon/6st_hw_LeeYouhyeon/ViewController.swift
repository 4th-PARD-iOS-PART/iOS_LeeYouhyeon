//
//  ViewController.swift
//  6st_hw_LeeYouhyeon
//
//  Created by 이유현 on 11/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    var members: [Member] = []  // 테이블 뷰에 표시할 멤버 정보 리스트
    var selectedIndex: Int?     // 선택된 셀의 인덱스
    
    let tableViewUI: UITableView = {
        let tableVIew = UITableView()
        tableVIew.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
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
    }

    func setUI(){
        
        let contentView: UIView = {
            let contents = UIView()
            contents.translatesAutoresizingMaskIntoConstraints = false
            return contents
        }()
        
        view.addSubview(contentView)
        contentView.addSubview(tableViewUI)
        
        tableViewUI.register(MemberListCell.self, forCellReuseIdentifier: "memberListCell")
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            tableViewUI.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            tableViewUI.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
    }
    
    @objc func tapAddModalButton() {
        let modalViewController = ModalAddViewController()
        modalViewController.modalPresentationStyle = .formSheet
        self.present(modalViewController, animated: true)
    }

    @objc func tapEditModalButton() {
        let modalViewController = ModalEditViewController()
        modalViewController.modalPresentationStyle = .formSheet
        self.present(modalViewController, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 테이블 뷰의 셀 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    // 각 셀에 표시할 데이터 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberListCell", for: indexPath)
//        let member = members[indexPath.row]
//        cell.textLabel?.text = "[ \(member.part) ] \(member.name)"  // 셀에 멤버의 파트와 이름 표시
        return cell
    }
    
    // 셀이 선택되었을 때 호출되는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedIndex = indexPath.row  // 선택된 셀의 인덱스 저장
    }
}

