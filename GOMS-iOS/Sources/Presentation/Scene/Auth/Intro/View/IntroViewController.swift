import UIKit
import Then
import SnapKit
import GAuthSignin
import RxCocoa
import RxSwift

class IntroViewController: BaseViewController<IntroReactor> {

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
        $0.textColor = .gomsBlack
        let fullText = $0.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "수요 외출제")
        attribtuedString.addAttribute(
            .foregroundColor,
            value: UIColor.p10!,
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
        $0.textColor = .n20
    }
    
    private let gauthSignInButton = GAuthButton(auth: .signin, color: .colored, rounded: .default)
    
    private let cannotLoginText = UILabel().then {
        $0.text = "GAuth가 안된다면?"
        $0.font = UIFont.GOMSFont(
            size: 12,
            family: .Medium
        )
        $0.textColor = .n10
    }
    
    private let loginWithNumberButton = UIButton().then {
        $0.setTitle(
            "인증번호로 로그인",
            for: .normal
        )
        $0.setTitleColor(
            UIColor(
                red: 46/255,
                green: 128/255,
                blue: 204/255,
                alpha: 0.8
            ),
            for: .normal
        )
        $0.titleLabel?.font = UIFont.GOMSFont(size: 12, family: .Medium)
    }
    
    private func gauthButtonSetUp() {
        gauthSignInButton.prepare(
            clientID: GAuthInfo.clientID,
            redirectURI: GAuthInfo.redirectURI,
            presenting: self
        ) { code in
            self.viewModel.action.onNext(.gauthSigninCompleted(code: code))
        }
    }
    
    override func addView() {
        [
            logoImage,
            explainText,
            subExplainText,
            gauthSignInButton
        ].forEach{
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
            $0.bottom.equalTo(view.snp.bottom).inset(96)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(60)
        }
//        cannotLoginText.snp.makeConstraints {
//            $0.top.equalTo(gauthSignInButton.snp.bottom).offset(14)
//            $0.leading.equalToSuperview().offset((bounds.width) / 4)
//        }
//        loginWithNumberButton.snp.makeConstraints {
//            $0.top.equalTo(gauthSignInButton.snp.bottom).offset(14)
//            $0.leading.equalTo(cannotLoginText.snp.trailing).offset(8)
//            $0.height.equalTo(cannotLoginText.snp.height)
//        }
    }
}

