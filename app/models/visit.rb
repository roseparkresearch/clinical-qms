class Visit < ApplicationRecord
  belongs_to :patient
  has_many :adverse_events, dependent: :destroy
  has_many :deviations, dependent: :destroy
  has_many :queries, as: :queryable, dependent: :destroy

  validates :visit_number, presence: true, uniqueness: { scope: :patient_id }
  validates :visit_name, presence: true
  validates :status, inclusion: { in: ['scheduled', 'in_progress', 'completed', 'missed', 'cancelled'] }

  enum :status, {
    scheduled: 'scheduled',
    in_progress: 'in_progress',
    completed: 'completed',
    missed: 'missed',
    cancelled: 'cancelled'
  }

  scope :overdue, -> { where('visit_window_end < ?', Date.current) }
  scope :upcoming, -> { where('visit_window_start <= ? AND visit_window_end >= ?', Date.current, Date.current) }
end
