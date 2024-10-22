import UIKit

class ModalViewController: UIViewController{

    //선택된 데이터 저장 변수
    var selectedData: SearchModel?
//    weak var delegate: ModalFromSearchDelegate?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // 내비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = .black
        setUI()
        
    }
    
    func setUI(){
        
        let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        let contentView: UIView = {
            let contentView = UIView()
            contentView.translatesAutoresizingMaskIntoConstraints = false
            return contentView
        }()
        
        let mainImage: UIImageView = {
            
            let mainImage = UIImageView(image: UIImage(named: selectedData?.image ?? "mov1"))
            mainImage.translatesAutoresizingMaskIntoConstraints = false
//            mainImage.contentMode = .scaleAspectFit
            return mainImage
        }()
        
        let connectBtn: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            
            // 버튼 이미지 설정
            button.setImage(UIImage(named: "wifi"), for: .normal)
            button.layer.cornerRadius = 14 // 버튼의 반지름을 설정하여 원형으로 만들기
            button.clipsToBounds = true // 모서리 잘림을 활성화
            button.backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1)
            return button
        }()
        
        let cancelBtn: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            
            // 버튼 이미지 설정
            button.setImage(UIImage(named: "hw5_x"), for: .normal)
            button.layer.cornerRadius = 14 // 버튼의 반지름을 설정하여 원형으로 만들기
            button.clipsToBounds = true // 모서리 잘림을 활성화
            button.backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1)
            button.addTarget(self, action: #selector(dismissModal), for: .touchUpInside) // 버튼 클릭 이벤트 추가
            return button
        }()
        
        let playBtn: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            
            // 버튼 이미지 설정
            button.setImage(UIImage(named: "hw5_paly"), for: .normal)
            
            button.layer.cornerRadius = 27
            button.clipsToBounds = true
            
            button.backgroundColor = .clear
            
            // 보더 설정
            button.layer.borderColor = UIColor(red: 0.82, green: 0.18, blue: 0.15, alpha: 1).cgColor  // 보더 색상 설정
            button.layer.borderWidth = 1  // 보더 두께 설정

            
            return button
        }()

        
        // 스크롤 뷰와 콘텐츠 뷰를 추가
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        //그외
        contentView.addSubview(mainImage)
        contentView.addSubview(connectBtn)
        contentView.addSubview(cancelBtn)
        contentView.addSubview(playBtn)
        
        NSLayoutConstraint.activate([
            // scrollView의 제약조건 설정
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // contentView의 제약조건 설정
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            //
            // mainImage의 제약조건 설정
            mainImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 210),
            
            connectBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            connectBtn.widthAnchor.constraint(equalToConstant: 28), // 버튼 너비
            connectBtn.heightAnchor.constraint(equalToConstant: 28), // 버튼 높이
            connectBtn.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 300),

            cancelBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cancelBtn.widthAnchor.constraint(equalToConstant: 28), // 버튼 너비
            cancelBtn.heightAnchor.constraint(equalToConstant: 28), // 버튼 높이
            cancelBtn.leadingAnchor.constraint(equalTo: connectBtn.trailingAnchor, constant: 16),
//            cancelBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            
            playBtn.widthAnchor.constraint(equalToConstant: 54), // 버튼 너비
            playBtn.heightAnchor.constraint(equalToConstant: 54), // 버튼 높이
            playBtn.centerXAnchor.constraint(equalTo: mainImage.centerXAnchor),
            playBtn.centerYAnchor.constraint(equalTo: mainImage.centerYAnchor),


        ])
        
    }
    
    @objc func dismissModal(){
        self.dismiss(animated: true)
//        print("ff")
    }
    
}
