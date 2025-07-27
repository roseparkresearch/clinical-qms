class Deviation < ApplicationRecord
  belongs_to :patient
  belongs_to :visit, optional: true
  has_many :queries, as: :queryable, dependent: :destroy

  validates :deviation_type, inclusion: { in: ['inclusion_exclusion', 'protocol_procedure', 'informed_consent', 'medication', 'visit_window', 'other'] }
  validates :severity, inclusion: { in: ['minor', 'major', 'critical'] }
  validates :description, presence: true
  validates :detected_date, presence: true

  enum :deviation_type, {
    inclusion_exclusion: 'inclusion_exclusion',
    protocol_procedure: 'protocol_procedure',
    informed_consent: 'informed_consent',
    medication: 'medication',
    visit_window: 'visit_window',
    other: 'other'
  }

  enum :severity, {
    minor: 'minor',
    major: 'major',
    critical: 'critical'
  }

  scope :unresolved, -> { where(resolved_date: nil) }
  scope :by_severity, -> { order(:severity, :detected_date) }
end
