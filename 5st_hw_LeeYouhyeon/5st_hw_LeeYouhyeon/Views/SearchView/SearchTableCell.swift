import UIKit

class SearchTableCell: UITableViewCell {
    let customImageView = UIImageView()
    let label = UILabel()
    
    let separatorLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .black // 구분선 색상 설정
        return line
    }()
    
    let playImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "playBtn")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // 라벨과 이미지 뷰 추가
        contentView.addSubview(customImageView)
        contentView.addSubview(label)
        contentView.addSubview(separatorLine)
        contentView.addSubview(playImageView)
        
        // 제약조건 설정
        setLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // 이미지 뷰 제약조건
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customImageView.heightAnchor.constraint(equalToConstant: 76),
            customImageView.widthAnchor.constraint(equalToConstant: 146),
            
            // 라벨 제약조건
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 19),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            //행 간의 간격 주는척~
            separatorLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 3),
            
            //플레이 버튼 제약조건
            playImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5), // 오른쪽 끝에 정렬
            playImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playImageView.widthAnchor.constraint(equalToConstant: 28),
            playImageView.heightAnchor.constraint(equalToConstant: 28),
            
        ])
        
        // 라벨 스타일 설정
        label.textColor = .white // 라벨 색상 변경
        label.font = UIFont.systemFont(ofSize: 16) // 폰트 설정
    }
}
