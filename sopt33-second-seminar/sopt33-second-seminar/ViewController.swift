//
//  ViewController.swift
//  sopt33-second-seminar
//
//  Created by 최서연 on 10/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    var baduk1: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var baduk2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var wall: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    var yellowBlock: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var greenBlock: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    var blackBlock: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var blueBlock: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    var redBlock: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    var whiteBlock: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var whiteBlock2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var whiteBlock3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var whiteBlock4: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private var stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    private var stackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    private var stackView4: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private var stackView5: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private var stackView6: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        //self.setLayout()
        //self.setBlock()
        //self.setStackView()
        //self.setStackView2()
        self.setScrollView()
    }
    
    private func setLayout() {
        [baduk1, baduk2, wall].forEach{ [weak self] view in
            guard let self else { return }
            // 충돌 방지를 위한 거임
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([baduk1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
                                     baduk1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
                                     baduk1.widthAnchor.constraint(equalToConstant: 20),
                                     baduk1.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([baduk2.topAnchor.constraint(equalTo: baduk1.bottomAnchor, constant: 40),
                                     baduk2.leadingAnchor.constraint(equalTo: baduk1.trailingAnchor, constant: 40),
                                     baduk2.widthAnchor.constraint(equalToConstant: 20),
                                     baduk2.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([wall.topAnchor.constraint(equalTo: baduk2.bottomAnchor, constant: 20),
                                     wall.leadingAnchor.constraint(equalTo: baduk2.trailingAnchor, constant: 20),
                                     wall.widthAnchor.constraint(equalToConstant: 60),
                                     wall.heightAnchor.constraint(equalToConstant: 20)])
    }
    
    private func setBlock() {
        [yellowBlock, greenBlock, blackBlock, blueBlock].forEach{ [weak self] view in
            guard let self else { return }
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([yellowBlock.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
                                     yellowBlock.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     yellowBlock.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     yellowBlock.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
        
        NSLayoutConstraint.activate([greenBlock.topAnchor.constraint(equalTo: yellowBlock.bottomAnchor, constant: 0),
                                     greenBlock.leadingAnchor.constraint(equalTo: yellowBlock.trailingAnchor, constant: 0),
                                     greenBlock.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     greenBlock.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
        
        NSLayoutConstraint.activate([blackBlock.topAnchor.constraint(equalTo: greenBlock.bottomAnchor, constant: 0),
                                     blackBlock.trailingAnchor.constraint(equalTo: greenBlock.leadingAnchor, constant: 0),
                                     blackBlock.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     blackBlock.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
        
        NSLayoutConstraint.activate([blueBlock.topAnchor.constraint(equalTo: blackBlock.bottomAnchor, constant: 0),
                                     blueBlock.leadingAnchor.constraint(equalTo: blackBlock.trailingAnchor, constant: 0),
                                     blueBlock.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     blueBlock.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
    }
    
    private func setStackView() {
        [stackView1, stackView2].forEach{[weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        [yellowBlock, blackBlock].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView1.addArrangedSubview($0)
        }
        
        [greenBlock, blueBlock].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView2.addArrangedSubview($0)
        }
        // stackView와 self.view와의 크기를 동일하게 설정
        NSLayoutConstraint.activate([stackView1.topAnchor.constraint(equalTo: view.topAnchor),
                                     stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     stackView1.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     stackView1.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4*3)]
        )
        NSLayoutConstraint.activate([stackView2.topAnchor.constraint(equalTo:yellowBlock.bottomAnchor),
                                     stackView2.leadingAnchor.constraint(equalTo: stackView1.trailingAnchor),
                                     stackView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     stackView2.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4*3)]
        )
    }
    
    private func setStackView2() {
        [stackView3, stackView4, stackView5, stackView6].forEach {[weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        [yellowBlock, whiteBlock].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView3.addArrangedSubview($0)
        }
        
        [whiteBlock2, redBlock].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView4.addArrangedSubview($0)
        }
        
        [blueBlock, whiteBlock3].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView5.addArrangedSubview($0)
        }
        
        [whiteBlock4,greenBlock].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView6.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([stackView3.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     stackView3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     stackView3.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     stackView3.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
        
        NSLayoutConstraint.activate([stackView4.topAnchor.constraint(equalTo: stackView3.bottomAnchor),
                                     stackView4.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     stackView4.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     stackView4.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
        
        NSLayoutConstraint.activate([stackView5.topAnchor.constraint(equalTo: stackView4.bottomAnchor),
                                     stackView5.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     stackView5.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     stackView5.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
        
        NSLayoutConstraint.activate([stackView6.topAnchor.constraint(equalTo: stackView5.bottomAnchor),
                                     stackView6.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     stackView6.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     stackView6.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
    }
    
    var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .cyan
        return view
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    private func setScrollView() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
        
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView1)
        contentView.addSubview(stackView2)
        
        // stackView와 self.view와의 크기를 동일하게 설정
        NSLayoutConstraint.activate([stackView1.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     stackView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     stackView1.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     stackView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        
        NSLayoutConstraint.activate([stackView2.topAnchor.constraint(equalTo:contentView.topAnchor),
                                     stackView2.leadingAnchor.constraint(equalTo: stackView1.trailingAnchor),
                                     stackView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     stackView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        
        
        [yellowBlock, blackBlock].forEach {
            NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                         $0.heightAnchor.constraint(equalToConstant: 600)])
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView1.addArrangedSubview($0)
        }
        
        [greenBlock, blueBlock].forEach {
            NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                         $0.heightAnchor.constraint(equalToConstant: 600)])
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView2.addArrangedSubview($0)
        }
        
        //        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        //        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        //        contentViewHeight.priority = .defaultLow
        //        contentViewHeight.isActive = true
        // stackview는 .fillequally를 설정해뒀기 때문에 굳이 높이를 설정하지 않아도 된다!
        
    }
}

