import UIKit

class ViewController: UIViewController {
    let customScrollView = CustomScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomScrollView()
    }

    private func setupCustomScrollView() {
        customScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customScrollView)

        NSLayoutConstraint.activate([
            customScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            customScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
