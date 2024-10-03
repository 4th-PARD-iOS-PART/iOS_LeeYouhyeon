
//import Foundation
import UIKit

class ComingViewController: UIViewController{
    
    let tableViewUI: UITableView = {
        let tableVIew = UITableView()
        tableVIew.backgroundColor = .clear
        tableVIew.translatesAutoresizingMaskIntoConstraints = false
        tableVIew.separatorStyle = .none
        return tableVIew
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // 내비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = .black
        
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        
        setUI()
    }
    
    //탭바 배경색이 왜 얘만 바뀔까.... 그래서 고정해버림
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.barTintColor = .black
    }
    
    func setUI(){
        let scrollView: UIScrollView = {
            let scrollViews = UIScrollView()
            scrollViews.translatesAutoresizingMaskIntoConstraints = false
            return scrollViews
        }()
        
        let contentView: UIView = {
            let contents = UIView()
            contents.translatesAutoresizingMaskIntoConstraints = false
            return contents
        }()
        
        let roundButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor(red: 0.96, green: 0.04, blue: 0.08, alpha: 1)
            button.layer.cornerRadius = 19/2  // 크기의 절반으로 설정해서 동그랗게
            button.clipsToBounds = true
            
            if let buttonImage = UIImage(named: "smallbell") {
                button.setImage(buttonImage, for: .normal)
            }
            return button
        }()
        
        let label: UILabel = {
            let labels = UILabel()
            labels.translatesAutoresizingMaskIntoConstraints = false
            labels.text = "Notifications"
            labels.textColor = .white
            labels.textAlignment = .center
            labels.font = UIFont.boldSystemFont(ofSize: 16.91)
            return labels
        }()
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(roundButton)
        contentView.addSubview(label)
        contentView.addSubview(tableViewUI)
        
        tableViewUI.register(ComingTableCell.self, forCellReuseIdentifier: "ComingCell")
        
        NSLayoutConstraint.activate([

            // scrollview의 constraint를 safeArea를 기준으로
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            // 이때, bottomanchor를 뷰의 bottomAnchor로 주면 끝까지 스크롤영역
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // contentView의 autoLayout. scrollView를 따라 설정
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // 벨 버튼
            roundButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            roundButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            roundButton.widthAnchor.constraint(equalToConstant: 19),  // 버튼 크기
            roundButton.heightAnchor.constraint(equalToConstant: 19),
            
            // 라벨
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            label.leadingAnchor.constraint(equalTo: roundButton.trailingAnchor, constant: 7),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -235),
            
            tableViewUI.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 29),
            tableViewUI.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tableViewUI.heightAnchor.constraint(equalToConstant:1300)
        ])
        
    }
}

extension ComingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ComingModel.ComingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewUI.dequeueReusableCell(withIdentifier: "ComingCell", for: indexPath) as? ComingTableCell else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = .black
        
        let imageName = ComingModel.ComingData[indexPath.row].image
        cell.image.image = UIImage(named: imageName)
        
        cell.dates.text = ComingModel.ComingData[indexPath.row].date
        cell.Title.text = ComingModel.ComingData[indexPath.row].title
        
        cell.Contents.text = ComingModel.ComingData[indexPath.row].contents
        cell.Genre.text = ComingModel.ComingData[indexPath.row].genre
         
        cell.selectionStyle = .none
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 402.0
    }
}
