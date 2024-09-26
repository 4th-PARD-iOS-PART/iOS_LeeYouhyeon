import UIKit

class CustomCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        contentView.addSubview(imageView)
        setUpcomponent()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configuration(with image: UIImage, name: String){
        imageView.image = image
    }
    private func setUpcomponent(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            imageView.widthAnchor.constraint(equalToConstant: 103), // 고정된 너비
//            imageView.heightAnchor.constraint(equalToConstant: 161)
        ])
    }
}
