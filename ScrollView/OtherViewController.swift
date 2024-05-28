import UIKit

class OtherViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Press me", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        let label = UILabel()
        label.text = "Hello, world!"
        label.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(label)
        contentView.addSubview(button)

        NSLayoutConstraint.activate([
            // Constraints para a label
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            // Constraints para o botão
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])

        // Adicionando uma subview extra para garantir altura suficiente
        let placeholderView = UIView()
        placeholderView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(placeholderView)

        NSLayoutConstraint.activate([
            placeholderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            placeholderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            placeholderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            placeholderView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20)
        ])

        // Ajustando a altura da contentView se necessário
        contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor).isActive = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if view.frame.height > 600 { // Ajuste essa altura conforme necessário
            // Device maior: botão colado ao fundo
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        } else {
            // Device menor: permitir rolagem
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        }
    }
}
