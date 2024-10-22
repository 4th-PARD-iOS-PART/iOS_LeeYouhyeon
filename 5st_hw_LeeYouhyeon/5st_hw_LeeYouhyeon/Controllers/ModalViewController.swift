import UIKit

class ModalViewController: UIViewController{

    //선택된 데이터 저장 변수
    var selectedData: SearchModel?
//    weak var delegate: ModalFromSearchDelegate?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // 내비게이션 바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = .black
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
        
        let mainImage: UIImageView = {
            
            let mainImage = UIImageView(image: UIImage(named: selectedData?.image ?? "mov1"))
            mainImage.translatesAutoresizingMaskIntoConstraints = false
//            mainImage.contentMode = .scaleAspectFit
            return mainImage
        }()
        
        let connectBtn: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            
            // 버튼 이미지 설정
            button.setImage(UIImage(named: "wifi"), for: .normal)
            button.layer.cornerRadius = 14 // 버튼의 반지름을 설정하여 원형으로 만들기
            button.clipsToBounds = true // 모서리 잘림을 활성화
            button.backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1)
            return button
        }()
        
        let cancelBtn: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            
            // 버튼 이미지 설정
            button.setImage(UIImage(named: "hw5_x"), for: .normal)
            button.layer.cornerRadius = 14 // 버튼의 반지름을 설정하여 원형으로 만들기
            button.clipsToBounds = true // 모서리 잘림을 활성화
            button.backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1)
            button.addTarget(self, action: #selector(dismissModal), for: .touchUpInside) // 버튼 클릭 이벤트 추가
            return button
        }()
        
        let playBtn: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            
            // 버튼 이미지 설정
            button.setImage(UIImage(named: "hw5_paly"), for: .normal)
            
            button.layer.cornerRadius = 27
            button.clipsToBounds = true
            
            button.backgroundColor = .clear
            
            // 보더 설정
            button.layer.borderColor = UIColor(red: 0.82, green: 0.18, blue: 0.15, alpha: 1).cgColor  // 보더 색상 설정
            button.layer.borderWidth = 1  // 보더 두께 설정

            
            return button
        }()
        
        let netfixiconIng: UIImageView = {
            let netfixImg = UIImageView(image: UIImage(named:"netflix"))
            netfixImg.translatesAutoresizingMaskIntoConstraints = false
            netfixImg.contentMode = .scaleAspectFit
            return netfixImg
        }()
        
        let labelSeries: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "SERIES"
            label.textColor = UIColor(red: 0.72, green: 0.72, blue: 0.72, alpha: 1)
            label.font = UIFont(name: "NetflixSans-Bold", size: 10)
            return label
        }()
        
        let moveTitleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = selectedData?.title ?? "default"
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        
        let dateLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = selectedData?.date ?? "default"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 11)
            return label
        }()
        
        let tvmaImgicon: UIImageView = {
            let tvmaimg = UIImageView(image: UIImage(named:"rating"))
            tvmaimg.translatesAutoresizingMaskIntoConstraints = false
            tvmaimg.contentMode = .scaleAspectFit
            return tvmaimg
        }()
        
        let seasonLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "5 Seasons"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 11)
            return label
        }()
        
        let visonimgIcon: UIImageView = {
            let visonimg = UIImageView(image: UIImage(named:"vision"))
            visonimg.translatesAutoresizingMaskIntoConstraints = false
            visonimg.contentMode = .scaleAspectFit
            return visonimg
        }()
        let hdimgIcon: UIImageView = {
            let hdimg = UIImageView(image: UIImage(named:"hd"))
            hdimg.translatesAutoresizingMaskIntoConstraints = false
            hdimg.contentMode = .scaleAspectFit
            return hdimg
        }()
        let adimgIcon: UIImageView = {
            let adimg = UIImageView(image: UIImage(named:"ad"))
            adimg.translatesAutoresizingMaskIntoConstraints = false
            adimg.contentMode = .scaleAspectFit
            return adimg
        }()

        let playBigBtn: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false

            // 버튼 이미지 설정
            button.setImage(UIImage(named: "hw5_playmini"), for: .normal)
            
            // 버튼 제목 설정
            button.setTitle("Play", for: .normal) // 버튼의 제목 설정
            button.setTitleColor(.black, for: .normal) // 글자 색상 설정
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14) // 글꼴 크기 설정

            button.layer.cornerRadius = 4
            button.clipsToBounds = true
            
            button.backgroundColor = .white

            // 이미지와 텍스트 배치
            button.semanticContentAttribute = .forceLeftToRight // 이미지와 텍스트를 왼쪽에서 오른쪽으로 배치

            // 버튼의 이미지와 텍스트 간격 설정
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8) // 이미지와 텍스트 사이의 간격
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0) // 텍스트와 버튼의 경계 사이의 간격
            
            return button
        }()
        
        let downloadBtn: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false

            // 버튼 이미지 설정
            button.setImage(UIImage(named: "hw5_down"), for: .normal)
            
            // 버튼 제목 설정
            button.setTitle("Download", for: .normal) // 버튼의 제목 설정
            button.setTitleColor(UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1), for: .normal) // 글자 색상 설정
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14) // 글꼴 크기 설정

            button.layer.cornerRadius = 4
            button.clipsToBounds = true
            
            button.backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1)

            // 이미지와 텍스트 배치
            button.semanticContentAttribute = .forceLeftToRight // 이미지와 텍스트를 왼쪽에서 오른쪽으로 배치

            // 버튼의 이미지와 텍스트 간격 설정
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8) // 이미지와 텍스트 사이의 간격
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0) // 텍스트와 버튼의 경계 사이의 간격
            
            return button
        }()
        
        let mainExplainLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "S5:E10 Nothing Remains The Same"
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 12)
            return label
        }()
        
        let subExplainLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Hearts flip as Heather weds Tarek. Jason and Mary grapple with being ghosted. Go solo or take the next step: The agents face life-changing decisions."
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 12)
            
            // 자동 줄바꿈을 위해 설정
            label.numberOfLines = 0 // 0은 무제한 줄 수를 의미
            label.lineBreakMode = .byWordWrapping
            
            return label
        }()
        
        let mylistImg: UIImageView = {
            let img = UIImageView(image: UIImage(named:"hw5_plus"))
            img.translatesAutoresizingMaskIntoConstraints = false
            img.contentMode = .scaleAspectFit
            return img
        }()
        let mylistLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "My List"
            label.textColor = UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 10)
            return label
        }()
        
        let goodImg: UIImageView = {
            let img = UIImageView(image: UIImage(named:"hw5_good"))
            img.translatesAutoresizingMaskIntoConstraints = false
            img.contentMode = .scaleAspectFit
            return img
        }()
        let goodLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Rate"
            label.textColor = UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 10)
            return label
        }()
        
        let shareImg: UIImageView = {
            let img = UIImageView(image: UIImage(named:"hw5_send"))
            img.translatesAutoresizingMaskIntoConstraints = false
            img.contentMode = .scaleAspectFit
            return img
        }()
        let shareLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Share"
            label.textColor = UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 10)
            return label
        }()
    
        
        // 스크롤 뷰와 콘텐츠 뷰를 추가
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        //그외
        contentView.addSubview(mainImage)
        contentView.addSubview(connectBtn)
        contentView.addSubview(cancelBtn)
        contentView.addSubview(playBtn)
        
        contentView.addSubview(netfixiconIng)
        contentView.addSubview(labelSeries)
        contentView.addSubview(moveTitleLabel)
        
        contentView.addSubview(dateLabel)
        contentView.addSubview(tvmaImgicon)
        contentView.addSubview(seasonLabel)
        contentView.addSubview(visonimgIcon)
        contentView.addSubview(hdimgIcon)
        contentView.addSubview(adimgIcon)
        
        contentView.addSubview(playBigBtn)
        contentView.addSubview(downloadBtn)
        
        contentView.addSubview(mainExplainLabel)
        contentView.addSubview(subExplainLabel)
        
        contentView.addSubview(mylistImg)
        contentView.addSubview(mylistLabel)
        contentView.addSubview(goodImg)
        contentView.addSubview(goodLabel)
        contentView.addSubview(shareImg)
        contentView.addSubview(shareLabel)
        
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
            // mainImage의 제약조건 설정
            mainImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 210),
            
            connectBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            connectBtn.widthAnchor.constraint(equalToConstant: 28), // 버튼 너비
            connectBtn.heightAnchor.constraint(equalToConstant: 28), // 버튼 높이
            connectBtn.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 315),
            connectBtn.trailingAnchor.constraint(equalTo: cancelBtn.leadingAnchor, constant: -16),

            cancelBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cancelBtn.widthAnchor.constraint(equalToConstant: 28), // 버튼 너비
            cancelBtn.heightAnchor.constraint(equalToConstant: 28), // 버튼 높이
//            cancelBtn.leadingAnchor.constraint(equalTo: connectBtn.trailingAnchor, constant: 16),
            cancelBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            playBtn.widthAnchor.constraint(equalToConstant: 54), // 버튼 너비
            playBtn.heightAnchor.constraint(equalToConstant: 54), // 버튼 높이
            playBtn.centerXAnchor.constraint(equalTo: mainImage.centerXAnchor),
            playBtn.centerYAnchor.constraint(equalTo: mainImage.centerYAnchor),
            
            netfixiconIng.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: -8),

            netfixiconIng.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1),
            netfixiconIng.trailingAnchor.constraint(equalTo: labelSeries.leadingAnchor, constant: -1),
            
            labelSeries.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 12),
            labelSeries.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -310),
            
            moveTitleLabel.topAnchor.constraint(equalTo: labelSeries.bottomAnchor),
            moveTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -510),
            moveTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            moveTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            dateLabel.topAnchor.constraint(equalTo: moveTitleLabel.bottomAnchor, constant: 9.5),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            tvmaImgicon.topAnchor.constraint(equalTo: moveTitleLabel.bottomAnchor, constant: 6),
            tvmaImgicon.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 4),
            
            seasonLabel.topAnchor.constraint(equalTo: moveTitleLabel.bottomAnchor, constant: 9.5),
            seasonLabel.leadingAnchor.constraint(equalTo: tvmaImgicon.trailingAnchor, constant: 4),
            
            visonimgIcon.topAnchor.constraint(equalTo: moveTitleLabel.bottomAnchor, constant: 9),
            visonimgIcon.leadingAnchor.constraint(equalTo: seasonLabel.trailingAnchor, constant: 4),
            
            hdimgIcon.topAnchor.constraint(equalTo: moveTitleLabel.bottomAnchor, constant: 9),
            hdimgIcon.leadingAnchor.constraint(equalTo: visonimgIcon.trailingAnchor, constant: 4),
            
            adimgIcon.topAnchor.constraint(equalTo: moveTitleLabel.bottomAnchor, constant: 9),
            adimgIcon.leadingAnchor.constraint(equalTo: hdimgIcon.trailingAnchor, constant: 4),
//            adimgIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -143),
        
            playBigBtn.topAnchor.constraint(equalTo: adimgIcon.bottomAnchor, constant: 11),
            playBigBtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            playBigBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            playBigBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            playBigBtn.heightAnchor.constraint(equalToConstant: 34),
            
            //downloadBtn
            downloadBtn.topAnchor.constraint(equalTo: playBigBtn.bottomAnchor, constant: 8),
            downloadBtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            downloadBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            downloadBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            downloadBtn.heightAnchor.constraint(equalToConstant: 34),
            
            mainExplainLabel.topAnchor.constraint(equalTo: downloadBtn.bottomAnchor, constant: 14),
            mainExplainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            mainExplainLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            subExplainLabel.topAnchor.constraint(equalTo: mainExplainLabel.bottomAnchor, constant: 4),
//            mainExplainLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -510),
            subExplainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            subExplainLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            mylistImg.topAnchor.constraint(equalTo: subExplainLabel.bottomAnchor, constant: 32),
            mylistImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 39),
            mylistLabel.topAnchor.constraint(equalTo: mylistImg.bottomAnchor, constant: 6),
            mylistLabel.centerXAnchor.constraint(equalTo: mylistImg.centerXAnchor),
        
            goodImg.topAnchor.constraint(equalTo: subExplainLabel.bottomAnchor, constant: 32),
            goodImg.leadingAnchor.constraint(equalTo: mylistLabel.trailingAnchor, constant: 63),
            goodLabel.topAnchor.constraint(equalTo: goodImg.bottomAnchor, constant: 6),
            goodLabel.centerXAnchor.constraint(equalTo: goodImg.centerXAnchor),
        
            shareImg.topAnchor.constraint(equalTo: subExplainLabel.bottomAnchor, constant: 32),
            shareImg.leadingAnchor.constraint(equalTo: goodLabel.trailingAnchor, constant: 63),
            shareLabel.topAnchor.constraint(equalTo: shareImg.bottomAnchor, constant: 6),
            shareLabel.centerXAnchor.constraint(equalTo: shareImg.centerXAnchor),
        
        ])
        
    }
    
    @objc func dismissModal(){
        self.dismiss(animated: true)
//        print("ff")
    }
    
}
