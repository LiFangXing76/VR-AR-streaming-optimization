import UIKit


class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var passwrodTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private Methods
    
    /// Configure UI elements and setup tap gesture recognizer to dismiss keyboard
    private func configureUI() {
        userNameTextField.textColor = UIColor.black
        passwrodTextField.textColor = UIColor.black
        userNameTextField.backgroundColor = UIColor.white
        passwrodTextField.backgroundColor = UIColor.white
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    /// Dismiss the keyboard when tapped outside of text fields
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: - IBActions
    
    /// Resign first responder on pressing Return key for userNameTextField
    @IBAction func userNameAction(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    /// Resign first responder on pressing Return key for passwrodTextField
    @IBAction func passwordAction(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    /// Check credentials and navigate to FullPreviewViewController if correct in future you need to get these username & password from somewhere like fetch this data with encryption way so that you will have it with the top security.
    /// for example let say we will have 10 streams so we will fetch these stream credntial encrypted with a keys and once open the app we can add a login to app screen with this key to have the ability to decrypt these data (username, password)
    
    @IBAction func startWatchPressed(_ sender: Any) {
        guard let userName = userNameTextField.text, let password = passwrodTextField.text else { return }
        
        if userName == "vipr" && password == "SealClaps" {
            navigateToFullPreview(userName: userName, password: password)
            errorMessage.text = ""
        } else {
            errorMessage.text =  "User name or password incorrect"
        }
    }
    
    // MARK: - Navigation
    
    /// Navigate to FullPreviewViewController
    private func navigateToFullPreview(userName: String, password: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "FULLVIEW") as? ViewController {
            vc.username = userName
            vc.password = password
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Helper Methods
    
    /// Show a snackbar message
}
