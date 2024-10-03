import UIKit

class SearchViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 내비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        
        // 서치바의 delegate를 self로 설정
        searchBar.delegate = self
        
        view.backgroundColor = .black
        
        // UI 구성
        setupUI()
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
        
        // 스크롤 뷰와 콘텐츠 뷰를 추가
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        // 서치바를 콘텐츠 뷰에 추가
        contentView.addSubview(searchBar)
        searchBar.addSubview(micImageView)

        
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
        ])
    }

}

// UISearchBarDelegate 기능을 extension으로 구현
extension SearchViewController: UISearchBarDelegate {
    
    // 검색 버튼 클릭 시 호출되는 메서드
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        print("검색할 텍스트: \(searchText)")
        searchBar.resignFirstResponder()  // 키보드 숨기기
    }
    
    // 텍스트가 변경될 때 호출되는 메서드
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("텍스트 변경됨: \(searchText)")
    }
    
    // 검색창 편집이 시작될 때 호출되는 메서드
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("검색창 편집 시작")
        searchBar.showsCancelButton = true
    }
    
    // 취소 버튼 클릭 시 호출되는 메서드
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("취소 버튼 클릭됨")
        searchBar.resignFirstResponder()  // 키보드 숨기기
        searchBar.text = ""  // 검색어 초기화
    }
}

