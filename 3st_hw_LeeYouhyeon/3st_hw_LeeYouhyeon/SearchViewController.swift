
//import Foundation
import UIKit

class SearchViewController: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
    
    func setUI(){
        let label1: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Search"
            label.textColor = .white
            return label
        }()
        
        view.addSubview(label1)
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
        
    }
}
