class Document < ApplicationRecord
  belongs_to :uploaded_by, class_name: 'User'
  has_many :queries, as: :queryable, dependent: :destroy

  validates :title, presence: true
  validates :document_type, inclusion: { in: ['protocol', 'informed_consent', 'investigator_brochure', 'sop', 'regulatory', 'other'] }
  validates :status, inclusion: { in: ['draft', 'active', 'superseded', 'archived'] }
  validates :version, presence: true

  enum :document_type, {
    protocol: 'protocol',
    informed_consent: 'informed_consent',
    investigator_brochure: 'investigator_brochure',
    sop: 'sop',
    regulatory: 'regulatory',
    other: 'other'
  }

  enum :status, {
    draft: 'draft',
    active: 'active',
    superseded: 'superseded',
    archived: 'archived'
  }

  scope :current, -> { where(status: 'active') }
  scope :by_type, ->(type) { where(document_type: type) }
end
