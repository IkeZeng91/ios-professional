//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Xuankai Zeng on 13/1/2023.
//

import UIKit



class OnboardingViewController: UIViewController{
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    let heroImageName: String
    let titleText: String
        
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
        //这里，super.init(nibName: nil, bundle: nil) 调用父类 UIViewController 的 init(nibName:bundle:) 方法。这个方法的作用是初始化一个新的视图控制器对象。如果你不调用它，编译器会抛出错误。
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingViewController{
    func style() {
        view.backgroundColor = .systemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        //Image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: heroImageName)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = titleText
    }
    
    func layout(){
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
            
        ])
    }
}
