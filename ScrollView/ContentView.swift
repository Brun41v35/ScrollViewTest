import UIKit

class ContentView: UIView {

    let scrollView = UIScrollView()
    let contentView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        setupContentView()
        addContent()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupScrollView()
        setupContentView()
        addContent()
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
    }

    private func addContent() {
        // Exemplo de conteúdo adicional: várias labels
        var previousLabel: UILabel?
        for i in 1...20 {
            let label = UILabel()
            label.text = "Conteúdo da scroll view \(i)"
            label.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(label)

            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
            ])

            if let previous = previousLabel {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 20).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
            }
            previousLabel = label
        }

        // Constraint para a última label
        if let lastLabel = previousLabel {
            lastLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        }

        // Constraint de largura para contentView
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        // Constraint de altura mínima para contentView
        contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        adjustContentSizeForDevice(viewHeight: bounds.height)
    }

    private func adjustContentSizeForDevice(viewHeight: CGFloat) {
        let contentHeight = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        scrollView.contentSize = CGSize(width: bounds.width, height: contentHeight)
        scrollView.isScrollEnabled = contentHeight > viewHeight
    }
}
