import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    let layer1 = CAGradientLayer() // 레이어를 클래스의 프로퍼티로 선언

    let cellidentifier = "cellidentifier"
    let collectionview: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionview.backgroundColor = .clear
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        return collectionview
    }()
    
    // 배경 이미지 뷰 설정
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "movie1") // 원하는 배경 이미지로 변경
        imageView.contentMode = .scaleAspectFill // 이미지 비율에 맞게 조정
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // 내비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        
        setBackgroundImage()
        
        addGradientLayer()
        
        setUI()
        
        collectionview.register(CustomCell.self, forCellWithReuseIdentifier: cellidentifier)
        collectionview.register(CustomHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        // ScrollView의 델리게이트 설정
        if let scrollView = view.subviews.compactMap({ $0 as? UIScrollView }).first {
            scrollView.delegate = self
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        layer1.frame = view.bounds
    }

    func setBackgroundImage() {
        
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
        
        collectionview.dataSource = self
        collectionview.delegate = self
        contentView.addSubview(collectionview)

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
            mylists.leadingAnchor.constraint(equalTo: movies.trailingAnchor, constant: 39.4),
            
            // UICollectionView 제약조건
            collectionview.topAnchor.constraint(equalTo: mylists.bottomAnchor, constant: 300),
            collectionview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), // trailingAnchor 제약 추가
            collectionview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30), // 스크롤 가능하도록 하단 제약 추가
            collectionview.heightAnchor.constraint(greaterThanOrEqualToConstant: 1000)
        ])
    }
    // 스크롤 시 배경 이미지의 알파 값 변경
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let height = backgroundImage.frame.height
        
        // 배경 이미지의 알파 값 조정
        let alpha = max(0, 1 - (offsetY / height))
        backgroundImage.alpha = alpha
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    // 섹션의 개수 반환
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Model.ModelData.count // 섹션 수는 데이터 배열의 수와 같음
    }

    // 각 섹션 내 아이템 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.ModelData[section].count // 섹션에 있는 아이템의 수
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath) as? CustomCell else{
            print("error using collectioview")
            return UICollectionViewCell()
        }
        let target = Model.ModelData[indexPath.section][indexPath.item]
        let image = UIImage(named: "\(target.image)")
        cell.imageView.image = image
        return cell
    }
    
    //헤더
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CustomHeader
            // 섹션에 맞는 헤더 텍스트 설정
            headerView.headerLabel.text = "Section \(indexPath.section + 1)"
            return headerView
        }
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth: CGFloat = 103 // 고정된 너비
        let itemHeight: CGFloat = 161 // 고정된 높이
        return CGSize(width: itemWidth, height: itemHeight)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let totalSpacing: CGFloat = 7 // 좌우 여백 조정
        let numberOfItems: CGFloat = 4 // 한 행에 4개의 아이템
        let itemWidth: CGFloat = 103 // 셀의 너비

        let inset = (collectionView.bounds.width - (numberOfItems * itemWidth) - totalSpacing) / 2
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset) // 좌우 여백
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // 수평 간격
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // 수직 간격
        return 50
    }
}
