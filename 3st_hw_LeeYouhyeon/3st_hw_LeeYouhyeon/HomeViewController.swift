import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    let layer1 = CAGradientLayer() // 레이어를 클래스의 프로퍼티로 선언

    let cellidentifier = "cellidentifier"
    let collectionview: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
//        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionview.backgroundColor = .clear
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        return collectionview
    }()
    
    // 배경 이미지 뷰 설정
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "back") // 원하는 배경 이미지로 변경
        imageView.contentMode = .scaleAspectFill // 이미지 비율에 맞게 조정
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // 내비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        
        setBackgroundImage()
        
        setUI()
        
        collectionview.register(CustomCell.self, forCellWithReuseIdentifier: cellidentifier)
        collectionview.register(CustomHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        //컬렉션 뷰만 스크롤하지 못하도록 설정
        collectionview.isScrollEnabled = false
        
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

//MARK: - 화면에 띄우는 모든 것 (배경 이미지 제외)
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
        
        //중앙 부분 아이콘1
        let myListPlusimg: UIImageView = {
            let img = UIImageView()
            img.image = UIImage(named: "plus")
            img.translatesAutoresizingMaskIntoConstraints = false
            img.contentMode = .scaleAspectFit
            return img
        }()
        
        let myListPlusLabel: UILabel = {
            let label = UILabel()
            label.text = "My List"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            label.font = UIFont(name: "SFProDisplay-Regular", size: 13.64)
            return label
        }()
        
        let myListStackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [myListPlusimg, myListPlusLabel])
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical // 수평 스택
            stack.spacing = 2 // 간격 설정
            stack.alignment = .center
            return stack
        }()
        contentView.addSubview(myListStackView)
        
        //중앙 부분 버튼
        let playButton: UIButton = {
            let button = UIButton(type: .system)

            // 버튼 텍스트 및 이미지 설정
            button.setTitle("Play", for: .normal)
            button.setImage(UIImage(named: "play"), for: .normal)

            // UIButtonConfiguration 생성 및 설정
            var configuration = UIButton.Configuration.filled()
            configuration.title = "Play"
            configuration.image = UIImage(named: "play")
            configuration.baseBackgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
            configuration.cornerStyle = .medium

            // 텍스트와 이미지 간의 간격 조절
            let imageTitleSpacing: CGFloat = 15 // 원하는 간격을 설정
            configuration.imagePadding = imageTitleSpacing

            // UIButton에 configuration 적용
            button.configuration = configuration
            
            // 기타 속성 설정
            button.tintColor = .black
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 20.46)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()


        contentView.addSubview(playButton)
        
        //중앙 부분 아이콘2
        let Infoimg: UIImageView = {
            let img = UIImageView()
            img.image = UIImage(named: "info")
            img.translatesAutoresizingMaskIntoConstraints = false
            img.contentMode = .scaleAspectFit
            return img
        }()
        
        let InfoLabel: UILabel = {
            let label = UILabel()
            label.text = "Info"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            label.font = UIFont(name: "SFProDisplay-Regular", size: 13.64)
            return label
        }()
        
        let InfoStackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [Infoimg, InfoLabel])
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical // 수평 스택
            stack.spacing = 2 // 간격 설정
            stack.alignment = .center
            return stack
        }()
        contentView.addSubview(InfoStackView)
        
        
        collectionview.dataSource = self
        collectionview.delegate = self
        contentView.addSubview(collectionview)

//MARK: -제약조건
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
            
            //myListStackView 제약조건
            myListStackView.topAnchor.constraint(equalTo: mylists.bottomAnchor, constant: 338.8),
            myListStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 52),
            myListStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -282),
            
            //playButton 제약조건
            playButton.topAnchor.constraint(equalTo: mylists.bottomAnchor, constant: 338.8),
//            playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 135),
//            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -129),
            playButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 110),
            playButton.heightAnchor.constraint(equalToConstant: 45),
            
            //InfoStackView 제약조건
            InfoStackView.topAnchor.constraint(equalTo: mylists.bottomAnchor, constant: 338.8),
            InfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 287),
            InfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64),
            
            // UICollectionView 제약조건
            collectionview.topAnchor.constraint(equalTo: myListStackView.bottomAnchor, constant: 26),
            collectionview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), // trailingAnchor 제약 추가
            collectionview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30), // 스크롤 가능하도록 하단 제약 추가
            collectionview.heightAnchor.constraint(greaterThanOrEqualToConstant: 1250)
        ])
    }
    // 스크롤 시 배경 이미지의 알파 값 변경
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Check if the scroll view is scrolling vertically
        if scrollView.contentOffset.y != 0 {
            let offsetY = scrollView.contentOffset.y
            let height = backgroundImage.frame.height
            
            // 배경 이미지의 알파 값 조정
            let alpha = max(0, 1 - (offsetY / height))
            backgroundImage.alpha = alpha
        }
    }

}

//MARK: - 콜렉션 뷰 셀과 헤더 관리
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
        switch indexPath.section{
            case 0 :
                headerView.headerLabel.text = "Popular on Netflix"
            case 1 :
                headerView.headerLabel.text = "Trending Now"
            case 2 :
                headerView.headerLabel.text = "Top 10 in Nigeria Today"
            case 3 :
                headerView.headerLabel.text = "My List"
            case 4 :
                headerView.headerLabel.text = "African Movies"
            case 5 :
                headerView.headerLabel.text = "Nollywood Movies & TV"
            default:
                headerView.headerLabel.text = "Section \(indexPath.section + 1)"
            }
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
        let totalSpacing: CGFloat = 0 // 좌우 여백 조정
        let numberOfItems: CGFloat = 5 // 한 행에 4개의 아이템
        let itemWidth: CGFloat = 103 // 셀의 너비

        let inset = (collectionView.bounds.width - (numberOfItems * itemWidth) - totalSpacing) / 2
        return UIEdgeInsets(top: 0, left: 7, bottom: 0, right: inset) // 좌우 여백
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // 수평 간격
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // 수직 간격
        return 52
    }
}
