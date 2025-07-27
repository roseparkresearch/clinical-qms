class Study < ApplicationRecord
  has_paper_trail
  has_many :patients, dependent: :destroy
  has_many :queries, as: :queryable, dependent: :destroy
  has_many :documents, dependent: :destroy

  validates :name, presence: true
  validates :protocol_number, presence: true, uniqueness: true
  validates :status, inclusion: { in: ['active', 'paused', 'completed', 'terminated'] }

  enum :status, {
    active: 'active',
    paused: 'paused',
    completed: 'completed',
    terminated: 'terminated'
  }
end
