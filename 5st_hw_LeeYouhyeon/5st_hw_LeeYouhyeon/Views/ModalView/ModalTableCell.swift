import UIKit

class ModalTableCell: UITableViewCell {
    
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
        
        // 자동 줄바꿈을 위해 설정
        label.numberOfLines = 0 // 0은 무제한 줄 수를 의미
        label.lineBreakMode = .byWordWrapping

        return label
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // 라벨과 이미지 뷰 추가
        contentView.addSubview(playImageView)
        contentView.addSubview(name)
        contentView.addSubview(time)
        contentView.addSubview(explain)
        
        // 제약조건 설정
        setLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setLabel() {
        
        NSLayoutConstraint.activate([
            
            //플레이 버튼 제약조건
            playImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            playImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            playImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playImageView.widthAnchor.constraint(equalToConstant: 124),
            playImageView.heightAnchor.constraint(equalToConstant: 69),
            
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.5),
            name.leadingAnchor.constraint(equalTo: playImageView.trailingAnchor, constant: 8),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -116),

            time.topAnchor.constraint(equalTo: name.bottomAnchor),
            time.leadingAnchor.constraint(equalTo: playImageView.trailingAnchor, constant: 8),
            time.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -187),
            
            explain.topAnchor.constraint(equalTo: playImageView.bottomAnchor, constant: 8),
            explain.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            explain.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            explain.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19.5),
            
        ])

    }
}
