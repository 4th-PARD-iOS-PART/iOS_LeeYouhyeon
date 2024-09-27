import UIKit

class TableCustomCell: UITableViewCell {
//    let image = UIImageView()
//    let label = UILabel()
    
    var numberInSection : Int?
  
    let collectionview: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionview.backgroundColor = .clear
        collectionview.translatesAutoresizingMaskIntoConstraints = false
//        collectionview.register(CustomCell.self, forCellWithReuseIdentifier: "cellidentifier")
        return collectionview
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getSectionNumber(num : Int) {
        numberInSection = num
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.register(CustomCell.self, forCellWithReuseIdentifier: "CollectionCell")
        contentView.addSubview(collectionview)
        setUI()
        
    }
    
    func setUI(){
     
        NSLayoutConstraint.activate([
            collectionview.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionview.heightAnchor.constraint(equalToConstant: 161)
        ])
    }
}

extension TableCustomCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 각 섹션 내 아이템 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.ModelData[section].count // 섹션에 있는 아이템의 수
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CustomCell else{
            print("error using collectioview")
            return UICollectionViewCell()
        }
        let target = Model.ModelData[numberInSection ?? 0][indexPath.item]
        print(target.title)
        let image = UIImage(named: "\(target.image)")
        cell.imageView.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 103, height: 161) // 셀의 너비와 높이 설정
        }
    
}

extension TableCustomCell: UICollectionViewDelegateFlowLayout{
    

}
