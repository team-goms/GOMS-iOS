//
//  IntroViewController.swift
//  GOMS-iOS
//
//  Created by 선민재 on 2023/04/17.
//

import UIKit
import Then
import SnapKit
import GAuthSignin

class IntroViewController: BaseViewController<IntroViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        gauthButtonSetUp()
    }
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "colorLogo.svg")
    }
    
    private let explainText = UILabel().then {
        $0.text = "간편한 수요 외출제 서비스"
        $0.font = UIFont.GOMSFont(size: 20, family: .Bold)
        $0.textColor = .black
        let fullText = $0.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "수요 외출제")
        attribtuedString.addAttribute(
            .foregroundColor,
            value: UIColor.mainColor!,
            range: range
        )
        $0.attributedText = attribtuedString
    }
    
    private let subExplainText = UILabel().then {
        $0.text = "앱으로 간편하게 GSM의 \n수요 외출제를 이용해 보세요!"
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = UIFont.GOMSFont(
            size: 16,
            family: .Medium
        )
        $0.textColor = UIColor(
            red: 121/255,
            green: 121/255,
            blue: 121/255,
            alpha: 1
        )
    }
    
    private let gauthSignInButton = GAuthButton(auth: .continue, color: .colored, rounded: .default)
    
    private func gauthButtonSetUp() {
        gauthSignInButton.prepare(
            clientID: "c6731e83059f4decaaa5b6a79c75320c306471f896da4284811f02bdcfeb7f94",
            redirectURI: "https://port-0-goms-backend-nx562olfamh7iw.sel3.cloudtype.app/",
            presenting: self
        ) { code in
            // 코드(String)
        }
    }
    
    override func addView() {
        [logoImage, explainText, subExplainText, gauthSignInButton].forEach{
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset((bounds.height) / 7.31)
            $0.centerX.equalToSuperview()
        }
        explainText.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(34)
            $0.centerX.equalToSuperview()
        }
        subExplainText.snp.makeConstraints {
            $0.top.equalTo(explainText.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        gauthSignInButton.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom).inset(60)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(60)
        }
    }


}

