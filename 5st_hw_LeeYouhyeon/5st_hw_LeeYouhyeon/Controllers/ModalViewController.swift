import UIKit

class ModalViewController: UIViewController{

    //선택된 데이터 저장 변수
    var selectedData: SearchModel?
    weak var delegate: ModalFromSearchDelegate?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .orange
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
        
//        데이터 전달 예시
//        let label1: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = "More"
//            label.textColor = .white
//            
//            if let data = selectedData {
//                label.text = data.title // 레이블에 데이터 제목 설정
//            }
//            
//            return label
//        }()
        
        // 스크롤 뷰와 콘텐츠 뷰를 추가
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        //그외
//        contentView.addSubview(label1)
        
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
        ])
        
    }
    
    
    //모달창 제거
    @objc func dismissModal(){
        self.dismiss(animated: true)
    }
    
}
