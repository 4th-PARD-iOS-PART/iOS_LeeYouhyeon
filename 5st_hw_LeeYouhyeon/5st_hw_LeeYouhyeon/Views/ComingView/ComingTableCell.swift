
import UIKit

class ComingTableCell: UITableViewCell {
    let image = UIImageView()
    
    let bellbutton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.clipsToBounds = true
        
        if let buttonImage = UIImage(named: "bell") {
            button.setImage(buttonImage, for: .normal)
        }
        return button
    }()
    
    let belllabel: UILabel = {
        let labels = UILabel()
        labels.translatesAutoresizingMaskIntoConstraints = false
        labels.text = "Remind Me"
        labels.textColor = .white
        labels.font =  UIFont.systemFont(ofSize: 11.13, weight: .light)
        return labels
    }()
    
    let sharebutton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.clipsToBounds = true
        
        if let buttonImage = UIImage(named: "share") {
            button.setImage(buttonImage, for: .normal)
        }
        return button
    }()
    
    let sharelabel: UILabel = {
        let labels = UILabel()
        labels.translatesAutoresizingMaskIntoConstraints = false
        labels.text = "Share"
        labels.textColor = .white
        labels.font = UIFont.systemFont(ofSize: 11.13, weight: .light)
        return labels
    }()
    
    let dates: UILabel = {
        let labels = UILabel()
        labels.translatesAutoresizingMaskIntoConstraints = false
        labels.textColor = .white
        labels.font = UIFont.systemFont(ofSize: 11.4, weight: .light)
        return labels
    }()
    
    let Title: UILabel = {
        let labels = UILabel()
        labels.translatesAutoresizingMaskIntoConstraints = false
        labels.textColor = .white
        labels.font = UIFont.systemFont(ofSize: 18.66, weight: .bold)
        return labels
    }()
    
    let Contents: UILabel = {
        let labels = UILabel()
        labels.translatesAutoresizingMaskIntoConstraints = false
        labels.textColor = .white
        labels.font = UIFont.systemFont(ofSize: 11.14, weight: .light)
        labels.numberOfLines = 0
        return labels
    }()
    
    let Genre: UILabel = {
        let labels = UILabel()
        labels.translatesAutoresizingMaskIntoConstraints = false
        labels.textColor = .white
        labels.font = UIFont.systemFont(ofSize: 11.4, weight: .regular)
        return labels
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ComingCell")
        contentView.addSubview(image)
        contentView.addSubview(bellbutton)
        contentView.addSubview(belllabel)
        
        contentView.addSubview(sharebutton)
        contentView.addSubview(sharelabel)
        
        contentView.addSubview(dates)
        contentView.addSubview(Title)
        contentView.addSubview(Contents)
        contentView.addSubview(Genre)

        
        setLabel()
        
    }
    
    func setLabel(){
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //이미지
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 195),
            
            //벨
            bellbutton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            bellbutton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 241),
            bellbutton.widthAnchor.constraint(equalToConstant: 24),
            bellbutton.heightAnchor.constraint(equalToConstant: 24),
            
            belllabel.topAnchor.constraint(equalTo: bellbutton.bottomAnchor, constant: 7),
            belllabel.centerXAnchor.constraint(equalTo: bellbutton.centerXAnchor),
            
            //공유
            sharebutton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            sharebutton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 327),
            sharebutton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sharebutton.widthAnchor.constraint(equalToConstant: 24),
            sharebutton.heightAnchor.constraint(equalToConstant: 24),
            
            sharelabel.topAnchor.constraint(equalTo: sharebutton.bottomAnchor, constant: 7),
            sharelabel.centerXAnchor.constraint(equalTo: sharebutton.centerXAnchor),
            
            
            //날짜
            dates.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 73),
            dates.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            dates.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dates.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -125),
            
            //제목
            Title.topAnchor.constraint(equalTo: dates.bottomAnchor, constant: 13),
            Title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            Title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            Title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -97),
            
            //내용
            Contents.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 13),
            Contents.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            Contents.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            //장르
            Genre.topAnchor.constraint(equalTo: Contents.bottomAnchor, constant: 16),
            Genre.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            Genre.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            Genre.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
