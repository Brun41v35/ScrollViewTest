import UIKit

class CustomScrollView: UIView {
    let scrollView = UIScrollView()
    let contentView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        setupContentView()
        setupSubviews()
        configureLayout()
        adjustScrollBehavior()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupScrollView()
        setupContentView()
        setupSubviews()
        configureLayout()
        adjustScrollBehavior()
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
    }

    private func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
    }

    private func setupSubviews() {
        var previousView: UIView = contentView

        for i in 1...20 {
            let label = UILabel()
            label.text = "Label \(i)"
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(label)

            let button = UIButton(type: .system)
            button.setTitle("Button \(i)", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(button)

            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: previousView == contentView ? contentView.topAnchor : previousView.bottomAnchor, constant: 20),
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

                button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
                button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])

            previousView = button
        }

        NSLayoutConstraint.activate([
            previousView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    private func configureLayout() {
        NSLayoutConstraint.activate([
            // Constraints para UIScrollView
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // Constraints para contentView
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func adjustScrollBehavior() {
        let screenHeight = UIScreen.main.bounds.height

        if screenHeight > 667 { // iPhone 6/7/8 and smaller (including SE)
            scrollView.isScrollEnabled = false
            addConstraintsForLargerDevices()
        } else {
            scrollView.isScrollEnabled = true
        }
    }

    private func addConstraintsForLargerDevices() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}
