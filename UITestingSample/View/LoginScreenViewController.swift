//
//  LoginScreenViewController.swift
//  UITestingSample
//
//

import UIKit

final class LoginScreenViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    // MARK: - IBAction
    @IBAction func loginButtonPressed() {
        loginSpinner.startAnimating()
        fetchUsers()
    }

    // MARK: - iVars
    var viewModel: LoginScreenViewModel?
    let loginSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginScreenViewModel()
        self.addSpinner()
    }
}

// MARK: - Helpers
extension LoginScreenViewController {
    func addSpinner() {
        loginButton.addSubview(loginSpinner)
        loginSpinner.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor).isActive = true
        loginSpinner.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor).isActive = true
    }

    func fetchUsers() {
        viewModel?.loginButtonPressed { [weak self] result in
            DispatchQueue.main.async {
                self?.loginSpinner.stopAnimating()
                switch result {
                case .success(let users):
                    print(users)
                    self?.handleSuccess()
                case .failure(let error):
                    self?.handleFailure(with: error)
                }
            }
        }
    }

    func handleSuccess() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameVC = storyboard.instantiateViewController(identifier: String(describing: GameScreenViewController.self))
        gameVC.modalPresentationStyle = .fullScreen
        self.present(gameVC, animated: true)
    }

    func handleFailure(with error: DataError) {
        let okButton = UIAlertAction(title: "OK", style: .default)
        let alertController = UIAlertController(title: "", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(okButton)
        self.present(alertController, animated: true)
    }
}
