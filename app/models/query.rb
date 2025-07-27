class Query < ApplicationRecord
  has_paper_trail
  belongs_to :queryable, polymorphic: true
  belongs_to :assigned_to, class_name: "User"
  belongs_to :created_by, class_name: "User"

  validates :query_number, presence: true, uniqueness: true
  validates :title, presence: true
  validates :description, presence: true
  validates :query_type, inclusion: { in: ['clarification', 'missing_data', 'inconsistency', 'protocol_deviation', 'data_quality', 'other'] }
  validates :priority, inclusion: { in: ['low', 'medium', 'high', 'critical'] }
  validates :status, inclusion: { in: ['open', 'answered', 'closed', 'cancelled'] }

  enum :query_type, {
    clarification: 'clarification',
    missing_data: 'missing_data',
    inconsistency: 'inconsistency',
    protocol_deviation: 'protocol_deviation',
    data_quality: 'data_quality',
    other: 'other'
  }

  enum :priority, {
    low: 'low',
    medium: 'medium',
    high: 'high',
    critical: 'critical'
  }

  enum :status, {
    open: 'open',
    answered: 'answered',
    closed: 'closed',
    cancelled: 'cancelled'
  }

  before_validation :generate_query_number, on: :create
  before_save :set_resolved_at

  scope :overdue, -> { where('due_date < ? AND status IN (?)', Time.current, ['open', 'answered']) }
  scope :critical_overdue, -> { overdue.where(priority: 'critical') }
  scope :by_priority, -> { order(:priority, :due_date) }
  scope :recent, -> { order(created_at: :desc) }

  def overdue?
    due_date.present? && due_date < Time.current && !resolved?
  end

  def resolved?
    closed? || cancelled?
  end

  def response_time
    return nil unless resolved_at.present?
    resolved_at - created_at
  end

  def days_overdue
    return 0 unless overdue?
    ((Time.current - due_date) / 1.day).ceil
  end

  private

  def generate_query_number
    return if query_number.present?
    
    prefix = queryable_type.present? ? queryable_type.first(3).upcase : "QRY"
    sequence = Query.where("query_number LIKE ?", "#{prefix}%").count + 1
    self.query_number = "#{prefix}#{Date.current.strftime('%Y%m%d')}#{sequence.to_s.rjust(3, '0')}"
  end

  def set_resolved_at
    if status_changed? && resolved?
      self.resolved_at = Time.current
    elsif status_changed? && !resolved?
      self.resolved_at = nil
    end
  end
end
