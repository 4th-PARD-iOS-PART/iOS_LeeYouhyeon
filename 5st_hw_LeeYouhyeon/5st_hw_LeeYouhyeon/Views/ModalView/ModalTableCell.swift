import UIKit

class ModalTableCell: UIView {
    
    let playImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "video player")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1. Game Changer"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let time: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "37m"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let explain: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return."
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0 // 무제한 줄 수 설정
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() { // 뷰 설정 메서드
        // 뷰에 서브뷰 추가
        addSubview(playImageView)
        addSubview(name)
        addSubview(time)
        addSubview(explain)
        
        // 제약조건 설정
        setLabelConstraints()
    }
    
    private func setLabelConstraints() {
        NSLayoutConstraint.activate([
            // 플레이 이미지 제약조건
            playImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            playImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            playImageView.widthAnchor.constraint(equalToConstant: 124),
            playImageView.heightAnchor.constraint(equalToConstant: 69),
            
            // 이름 레이블 제약조건
            name.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            name.leadingAnchor.constraint(equalTo: playImageView.trailingAnchor, constant: 8),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            // 시간 레이블 제약조건
            time.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
            time.leadingAnchor.constraint(equalTo: playImageView.trailingAnchor, constant: 8),
            time.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            // 설명 레이블 제약조건
            explain.topAnchor.constraint(equalTo: playImageView.bottomAnchor, constant: 8),
            explain.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            explain.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            explain.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
}
