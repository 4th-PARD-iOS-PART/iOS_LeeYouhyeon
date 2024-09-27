import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    let layer1 = CAGradientLayer() // 레이어를 클래스의 프로퍼티로 선언
    
    // 배경 이미지 뷰 설정
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "back") // 원하는 배경 이미지로 변경
        imageView.contentMode = .scaleAspectFill // 이미지 비율에 맞게 조정
        return imageView
    }()
    
    //테이블 뷰
    let tableViewUI: UITableView = {
        let tableVIew = UITableView(frame: .zero, style: .grouped)
//        tableVIew.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        tableVIew.backgroundColor = .clear // 테이블 뷰 배경색을 투명하게 설정
        tableVIew.separatorStyle = .none   // 셀 구분선 숨기기
        tableVIew.translatesAutoresizingMaskIntoConstraints = false
        return tableVIew
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // 내비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        
        setBackgroundImage()
        
        setUI()
        
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        
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
        

        contentView.addSubview(tableViewUI)
        tableViewUI.register(TableCustomCell.self, forCellReuseIdentifier: "cell")
        // 테이블 뷰 스크롤 비활성화
        tableViewUI.isScrollEnabled = false
        
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
            
            //테이블뷰 제액조건
            tableViewUI.topAnchor.constraint(equalTo: InfoStackView.bottomAnchor, constant: 20), // 테이블 뷰 위치 조정
            tableViewUI.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            tableViewUI.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: contentView.bottomAnchor), // contentView의 아래쪽에 위치
            tableViewUI.heightAnchor.constraint(equalToConstant:1400)
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

// MARK: - 테이블뷰
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewUI.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableCustomCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.getSectionNumber(num: 0)
        case 1:
            cell.getSectionNumber(num: 1)
        case 2:
            cell.getSectionNumber(num: 2)
        case 3:
            cell.getSectionNumber(num: 3)
        case 4:
            cell.getSectionNumber(num: 4)
        case 5:
            cell.getSectionNumber(num: 5)
        default:
            cell.getSectionNumber(num: 0)
        }
        
        cell.backgroundColor = .clear // 셀의 배경색을 투명하게 설정
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Model.ModelData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 셀을 가져옴
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        // 셀의 배경색을 변경
        cell.contentView.backgroundColor = .black
        
        // 선택된 셀을 비활성화 해제 (선택 시 색상 유지)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 161.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }

// MARK: - 테이블뷰 헤더
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        // 이때는 꺼야함.... 이것때문에 삽질...
//            headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.black

        let headerTitle = UILabel()
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        
        // 섹션에 맞는 헤더 텍스트 설정
        switch section {
        case 0:
            headerTitle.text = "Popular on Netflix"
        case 1:
            headerTitle.text = "Trending Now"
        case 2:
            headerTitle.text = "Top 10 in Nigeria Today"
        case 3:
            headerTitle.text = "My List"
        case 4:
            headerTitle.text = "African Movies"
        case 5:
            headerTitle.text = "Nollywood Movies & TV"
        default:
            headerTitle.text = "Section \(section + 1)"
        }
        
        headerTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        headerTitle.textColor = .white

        headerView.addSubview(headerTitle)

        NSLayoutConstraint.activate([
            headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0),
            headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8),
            headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -8),
            headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0)
        ])

        return headerView
    }
    
    }

