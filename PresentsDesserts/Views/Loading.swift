//
//  ViewController.swift
//  PresentsDesserts
//
//  Created by Kelly Go on 7/18/23.
//

import UIKit
import Lottie

extension UIColor {
    static let lightPink = UIColor(red: 255/255, green: 210/255, blue: 220/255, alpha: 1)
    // etc
}

class Loading: UINavigationController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Presents Desserts"
        
        let customFont = UIFont(name: "Mynerve-Regular", size: 30)
        label.font = customFont
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    private let animationView: LottieAnimationView = {
        let animView = LottieAnimationView(name: "animation_lk8xo6lc")
        animView.frame = CGRect(x:0, y:0, width: 100, height: 100)
        animView.contentMode = .scaleAspectFit
        animView.contentMode = .scaleAspectFill
        animView.backgroundBehavior = .pauseAndRestore
        return animView
    }()
    
    @IBAction func moveTo(_ sender: Any) {
        //storyboard를 통해 두번째 화면의 storyboard ID를 참조하여 뷰 컨트롤러를 가져옵니다.
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "pdHome") else {
            return
        }
        
        //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
        svc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
        self.present(svc, animated: true)
    }
    
    // Created View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .lightPink
        view.addSubview(animationView)
    
        animationView.center = view.center
        
        // Animation Active
        animationView.play{ (finish) in
            
            UIView.animate(withDuration: 2, animations: {
                self.animationView.alpha = 0
            }, completion: { _ in
            })
            //
            print ("Animation Done.")
            
            self.animationView.isHidden = true
            self.animationView.removeFromSuperview()
            
            // Add titleLabel
            self.view.addSubview(self.titleLabel)
            
            // Details
            self.view.backgroundColor = .lightPink
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
                
    }
}

