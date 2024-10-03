
//import Foundation
import UIKit

class DownloadViewController: UIViewController{
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
            button.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            button.layer.cornerRadius = 194/2  // 크기의 절반으로 설정해서 동그랗게
            button.clipsToBounds = true
            
            if let buttonImage = UIImage(named: "download2") {
                button.setImage(buttonImage, for: .normal)
            }
            return button
        }()
        
        let label: UILabel = {
            let labels = UILabel()
            labels.translatesAutoresizingMaskIntoConstraints = false
            labels.text = "Movies and TV shows that you\n download appear here."
            labels.textColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0.65)
            labels.textAlignment = .center
            labels.numberOfLines = 0
            return labels
        }()
        
        // 동그란 버튼 생성
        let button1: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .white
            button.setTitle("Find Something to Download", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 6
            button.clipsToBounds = true
            return button
        }()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(roundButton)
        contentView.addSubview(label)
        contentView.addSubview(button1)
        
        
        NSLayoutConstraint.activate([

            // scrollview의 constraint를 safeArea를 기준으로
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            // 이때, bottomanchor를 뷰의 bottomAnchor로 주면 끝까지 스크롤영역
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // contentView의 autoLayout. scrollView를 따라 설정
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // 버튼
            roundButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 204),
            roundButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            roundButton.widthAnchor.constraint(equalToConstant: 194),  // 버튼 크기
            roundButton.heightAnchor.constraint(equalToConstant: 194),
            
            // 라벨
            label.topAnchor.constraint(equalTo: roundButton.bottomAnchor, constant: 32),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // 하단 버튼
            button1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 184),
            button1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button1.widthAnchor.constraint(equalToConstant: 280),  // 버튼 크기
            button1.heightAnchor.constraint(equalToConstant: 42),
            
        ])
        
    }
}
