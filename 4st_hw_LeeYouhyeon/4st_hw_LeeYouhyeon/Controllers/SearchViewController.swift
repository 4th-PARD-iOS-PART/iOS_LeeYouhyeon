import UIKit

class SearchViewController: UIViewController {
    var searchText: String = ""
    var filteredData: [SearchModel] = SearchModel.SearchData // 필터링된 데이터 배열
    
    //서치바
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for a show, movie, genre, etc."
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        // 서치바 배경색 설정
        let searchBarColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1)
        searchBar.barTintColor = searchBarColor // 서치바 배경색
        searchBar.layer.cornerRadius = 5
        searchBar.clipsToBounds = true

        
        // 서치바의 텍스트 필드 커스터마이징
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .clear // 텍스트 필드 배경색을 서치바와 동일하게 설정
            textField.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1) // 텍스트 색상
            textField.font = UIFont(name: "SFProDisplay-Regular", size: 15.21) // 폰트 설정
            
            // 플레이스홀더 속성 설정
            let placeholderColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1)
            textField.attributedPlaceholder = NSAttributedString(
                string: "Search for a show, movie, genre, etc.",
                attributes: [
                    .foregroundColor: placeholderColor,
                ]
            )
            
            // 검색 아이콘 색상 변경
            if let searchIcon = textField.leftView as? UIImageView {
                searchIcon.tintColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1) // 검색 아이콘 색상 변경
            }

        }
        return searchBar
    }()
    
    //테이블
    let tableViewUI: UITableView = {
        let tableVIew = UITableView()
        tableVIew.backgroundColor = .clear
        tableVIew.translatesAutoresizingMaskIntoConstraints = false
        return tableVIew
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 기본적으로 전체 데이터를 보여줌
        filteredData = SearchModel.SearchData
        tableViewUI.reloadData()
        
        // 내비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        
        // 서치바의 delegate를 self로 설정
        searchBar.delegate = self
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        
        view.backgroundColor = .black
        
        setupUI()
    }
    
    //탭바 배경색이 왜 얘만 바뀔까....
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.barTintColor = .black
    }

    
    func setupUI() {
        
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
        
        let micImageView: UIImageView = {
            // 마이크 버튼 추가
            let micImageView = UIImageView(image: UIImage(named: "mic"))
            micImageView.tintColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1) // 아이콘 색상 설정
            micImageView.translatesAutoresizingMaskIntoConstraints = false
            micImageView.contentMode = .scaleAspectFit
            return micImageView
        }()
        
        let header: UILabel = {
            let label = UILabel()
            label.text = "Top Searches"
            label.translatesAutoresizingMaskIntoConstraints = false
//            label.textAlignment = .center
            label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            label.font = UIFont.boldSystemFont(ofSize: 26.75)
            return label
        }()
        
        // 스크롤 뷰와 콘텐츠 뷰를 추가
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        // 서치바를 콘텐츠 뷰에 추가
        contentView.addSubview(searchBar)
        searchBar.addSubview(micImageView)
        
        contentView.addSubview(header)

        contentView.addSubview(tableViewUI)
        
        tableViewUI.register(SearchTableCell.self, forCellReuseIdentifier: "SearchCell")
        
        // AutoLayout 제약조건 설정
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
            
            // 서치바의 제약조건 설정
            searchBar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            searchBar.heightAnchor.constraint(equalToConstant: 48),
            
            //mic rightView 왜 안되냥 ㅠ
            micImageView.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            micImageView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 309),
            micImageView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            
            header.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12.88),
            header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            header.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -201),
//            header.bottomAnchor.constraint(equalTo: tableViewUI.bottomAnchor, constant: 30),
            
            tableViewUI.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 21),
            tableViewUI.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tableViewUI.heightAnchor.constraint(equalToConstant:700)
        ])
    }

}

// UISearchBarDelegate 기능을 extension으로 구현
extension SearchViewController: UISearchBarDelegate {
    
    // 검색 버튼 클릭 시 호출되는 메서드
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        self.searchText = searchText
        print("검색할 텍스트: \(searchText)")
        searchBar.resignFirstResponder()  // 키보드 숨기기
    }
    
    // 텍스트가 변경될 때 호출되는 메서드
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        
        if searchText.isEmpty {
            // 검색어가 없으면 전체 데이터를 다시 보여줌
            filteredData = SearchModel.SearchData
        } else {
            // 검색어가 있을 경우 데이터를 필터링
            filteredData = SearchModel.SearchData.filter { data in
                data.title.lowercased().contains(searchText.lowercased())
            }
        }
        
        // 테이블 뷰를 다시 로드하여 업데이트
        tableViewUI.reloadData()
        print("텍스트 변경됨: \(searchText)")
    }
    
    // 검색창 편집이 시작될 때 호출되는 메서드
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("검색창 편집 시작")
    }
    
    // 취소 버튼 클릭 시 호출되는 메서드
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("취소 버튼 클릭됨")
        searchBar.resignFirstResponder()  // 키보드 숨기기
        searchBar.text = ""  // 검색어 초기화
        self.searchText = ""
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewUI.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchTableCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .darkGray
        
        cell.label.text = filteredData[indexPath.row].title
        
        let imageName = filteredData[indexPath.row].image
        cell.customImageView.image = UIImage(named: imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 셀을 가져옴
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        // 셀의 배경색을 변경
        cell.contentView.backgroundColor = .darkGray
        
        // 선택된 셀을 비활성화 해제 (선택 시 색상 유지)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 79.0
    }

}
