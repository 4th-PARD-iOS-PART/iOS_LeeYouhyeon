//import UIKit
//
//class CustomHeader: UICollectionReusableView {
//    // 헤더에 표시될 레이블을 정의
//    let headerLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .white
//        label.font = UIFont.boldSystemFont(ofSize: 21)
//        return label
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupViews()
//    }
//
//    // 레이블을 뷰에 추가하고 제약조건을 설정하는 함수
//    private func setupViews() {
//        addSubview(headerLabel)
//
//        // 레이블 제약조건 설정
//        NSLayoutConstraint.activate([
//            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
//            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
//            headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
//        ])
//    }
//}
