import UIKit

class ViewController: UIViewController {
    
    // MARK: - Stored properties
    
    private var textView: UITextView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add UITextView.
        self.textView = UITextView()
        textView.text = """
            Hey macOS Ventura, repeat after me:
            
            "The presence of a selectable UITextView should NOT cause a sustained increase in CPU usage!"
            """
        textView.font = UIFont
            .preferredFont(forTextStyle: .body)
            .withSize(28)
        
        textView.backgroundColor = .systemGray5
        textView.contentInset.left = 8
        textView.contentInset.right = 8
            
        textView.layer.cornerRadius = 10
        textView.isScrollEnabled = false
        
        textView.isSelectable = false
        textView.isEditable = false
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textView)
                
        textView
            .widthAnchor.constraint(equalToConstant: 300)
            .isActive = true
        
        textView
            .centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            .isActive = true
        
        textView
            .centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            .isActive = true
        
        // Add isSelectableSwitch to demonstrate difference in CPU usage when UITextView is selectable vs when it is not selectable.
        
        // isSelectableLabel
        let isSelectableLabel = UILabel()
        isSelectableLabel.text = "isSelectable"
        isSelectableLabel.textColor = .secondaryLabel
        isSelectableLabel.font = UIFont
            .preferredFont(forTextStyle: .body)
            .withSize(20)
        
        isSelectableLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(isSelectableLabel)
        
        isSelectableLabel
            .leadingAnchor.constraint(equalTo: textView.leadingAnchor)
            .isActive = true
        
        isSelectableLabel
            .topAnchor.constraint(
                equalTo: textView.bottomAnchor,
                constant: 12
            )
            .isActive = true
        
        // isSelectableSwitch
        let isSelectableSwitch = UISwitch()
        isSelectableSwitch.setOn(textView.isSelectable, animated: false)
        isSelectableSwitch.addTarget(
            self,
            action: #selector(didUpdateIsSelectableSwitch),
            for: .valueChanged
        )
        
        isSelectableSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(isSelectableSwitch)
        
        isSelectableSwitch
            .centerYAnchor.constraint(equalTo: isSelectableLabel.centerYAnchor)
            .isActive = true
        
        isSelectableSwitch
            .trailingAnchor.constraint(equalTo: textView.trailingAnchor)
            .isActive = true
    }
    
    // MARK: - Actions
    
    @objc
    private func didUpdateIsSelectableSwitch(
        _ isSelectableSwitch: UISwitch)
    {
        textView.isSelectable = isSelectableSwitch.isOn
    }
}
