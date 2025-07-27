class Patient < ApplicationRecord
  has_paper_trail
  belongs_to :study
  has_many :visits, dependent: :destroy
  has_many :adverse_events, dependent: :destroy
  has_many :deviations, dependent: :destroy
  has_many :queries, as: :queryable, dependent: :destroy

  validates :patient_id, presence: true, uniqueness: { scope: :study_id }
  validates :status, inclusion: { in: ['screening', 'enrolled', 'active', 'completed', 'withdrawn', 'terminated'] }

  enum :status, {
    screening: 'screening',
    enrolled: 'enrolled',
    active: 'active',
    completed: 'completed',
    withdrawn: 'withdrawn',
    terminated: 'terminated'
  }
end
