class AdverseEvent < ApplicationRecord
  has_paper_trail
  belongs_to :patient
  belongs_to :visit, optional: true
  has_many :queries, as: :queryable, dependent: :destroy

  validates :severity, inclusion: { in: ['mild', 'moderate', 'severe'] }
  validates :causality, inclusion: { in: ['unrelated', 'unlikely', 'possible', 'probable', 'definite'] }
  validates :outcome, inclusion: { in: ['recovered', 'recovering', 'not_recovered', 'sequelae', 'fatal', 'unknown'] }
  validates :description, presence: true
  validates :start_date, presence: true

  enum :severity, {
    mild: 'mild',
    moderate: 'moderate',
    severe: 'severe'
  }

  enum :causality, {
    unrelated: 'unrelated',
    unlikely: 'unlikely',
    possible: 'possible',
    probable: 'probable',
    definite: 'definite'
  }

  enum :outcome, {
    recovered: 'recovered',
    recovering: 'recovering',
    not_recovered: 'not_recovered',
    sequelae: 'sequelae',
    fatal: 'fatal',
    unknown: 'unknown'
  }

  scope :serious, -> { where(serious: true) }
  scope :ongoing, -> { where(end_date: nil) }
end
