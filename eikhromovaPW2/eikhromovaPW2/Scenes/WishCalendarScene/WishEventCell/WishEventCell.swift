import UIKit

// MARK: - WishEventCell
class WishEventCell: UICollectionViewCell {
    
    // MARK: - Properties
    internal let wrapView: UIView = UIView()
    internal let titleLabel: UILabel = UILabel()
    internal let descriptionLabel: UILabel = UILabel()
    internal let startDateLabel: UILabel = UILabel()
    internal let endDateLabel: UILabel = UILabel()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureWrap()
        configureTitleLabel()
        configureDescriptionLabel()
        configureStartDateLabel()
        configureEndDateLabel()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorText)
    }
    
    // MARK: - Configuration
    func configure(with event: WishEventModel) {
        // MARK: - Date Formatting
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        formatter.timeZone = .current
        
        titleLabel.text = event.title
        descriptionLabel.text = event.description
        let formattedStartDate = formatter.string(from: event.startDate)
        let formattedEndDate = formatter.string(from: event.endDate)
        startDateLabel.text = "Start Date: \(formattedStartDate)"
        endDateLabel.text = "End Date: \(formattedEndDate)"
    }
}
