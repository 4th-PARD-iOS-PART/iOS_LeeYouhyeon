import UIKit

class HomeViewController: UIViewController {
    let layer1 = CAGradientLayer() // 레이어를 클래스의 프로퍼티로 선언

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // 내비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        
        setBackgroundImage()
        
        addGradientLayer()
        
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        layer1.frame = view.bounds
    }

    func setBackgroundImage() {
        // 배경 이미지 뷰 설정
        let backgroundImage: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "movie1") // 원하는 배경 이미지로 변경
            imageView.contentMode = .scaleAspectFill // 이미지 비율에 맞게 조정
            return imageView
        }()
        
        // 배경 이미지 뷰를 뷰에 추가
        view.addSubview(backgroundImage)
        
        // 배경 이미지의 제약 조건 설정
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 415)
        ])
    }

    func addGradientLayer() {
        // CAGradientLayer 인스턴스 생성 및 색상 설정
        layer1.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.45).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        ]
        
        // 시작점과 끝점 설정
        layer1.startPoint = CGPoint(x: 0.5, y: 0) // 중앙 상단
        layer1.endPoint = CGPoint(x: 0.5, y: 1)   // 중앙 하단
        
        // 레이어를 view에 추가 (가장 아래에)
        view.layer.insertSublayer(layer1, at: 1) // 배경 이미지 위에 추가
    }

    func setUI() {
        // ScrollView 및 ContentView 설정
        let scrollView: UIScrollView = {
            let scrollViews = UIScrollView()
            scrollViews.translatesAutoresizingMaskIntoConstraints = false
            return scrollViews
        }()
        view.addSubview(scrollView)
        
        let contentView: UIView = {
            let contents = UIView()
            contents.backgroundColor = .clear // 투명하게 설정
            contents.translatesAutoresizingMaskIntoConstraints = false
            return contents
        }()
        scrollView.addSubview(contentView)

        // 넷플릭스 로고 버튼 추가
        let netflixLogo: UIButton = {
            let button = UIButton(type: .custom)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: "netflix"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            return button
        }()
        contentView.addSubview(netflixLogo)

        // TV Show 레이블 추가
        let tvShow: UILabel = {
            let labels = UILabel()
            labels.translatesAutoresizingMaskIntoConstraints = false
            labels.text = "TV Shows"
            labels.textColor = .white
            labels.font = UIFont(name: "SFProDisplay-Regular", size: 17.2)
            labels.textAlignment = .center
            return labels
        }()
        contentView.addSubview(tvShow)

        // Movies 레이블 추가
        let movies: UILabel = {
            let labels = UILabel()
            labels.translatesAutoresizingMaskIntoConstraints = false
            labels.text = "Movies"
            labels.textColor = .white
            labels.font = UIFont(name: "SFProDisplay-Regular", size: 17.2)
            labels.textAlignment = .center
            return labels
        }()
        contentView.addSubview(movies)

        // My List 레이블 추가
        let mylists: UILabel = {
            let labels = UILabel()
            labels.translatesAutoresizingMaskIntoConstraints = false
            labels.text = "My List"
            labels.textColor = .white
            labels.font = UIFont(name: "SFProDisplay-Regular", size: 17.2)
            labels.textAlignment = .center
            return labels
        }()
        contentView.addSubview(mylists)

        // 제약조건 설정
        NSLayoutConstraint.activate([
            // ScrollView의 제약조건
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // ContentView의 제약조건
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // Netflix 로고의 제약조건
            netflixLogo.widthAnchor.constraint(equalToConstant: 53),
            netflixLogo.heightAnchor.constraint(equalToConstant: 57),
            netflixLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            netflixLogo.topAnchor.constraint(equalTo: contentView.topAnchor),

            // TV Show 레이블의 제약조건
            tvShow.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15.18),
            tvShow.leadingAnchor.constraint(equalTo: netflixLogo.trailingAnchor, constant: 23.63),
            tvShow.trailingAnchor.constraint(equalTo: movies.leadingAnchor, constant: -39.4),

            // Movies 레이블의 제약조건
            movies.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15.18),
            movies.leadingAnchor.constraint(equalTo: tvShow.trailingAnchor, constant: 39.4),
            movies.trailingAnchor.constraint(equalTo: mylists.leadingAnchor, constant: -39.4),

            // My List 레이블의 제약조건
            mylists.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15.18),
            mylists.leadingAnchor.constraint(equalTo: movies.trailingAnchor, constant: 39.4)
        ])
    }
}
