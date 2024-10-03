
//import Foundation
import UIKit

class ComingViewController: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // 내비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = .black
        setUI()
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
        ])
        
    }
}
