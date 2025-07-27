class User < ApplicationRecord
  has_many :created_queries, class_name: 'Query', foreign_key: 'created_by_id', dependent: :destroy
  has_many :assigned_queries, class_name: 'Query', foreign_key: 'assigned_to_id', dependent: :nullify
  has_many :uploaded_documents, class_name: 'Document', foreign_key: 'uploaded_by_id', dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :role, inclusion: { in: ['qa_manager', 'clinical_research_coordinator', 'principal_investigator', 'data_manager', 'admin'] }

  enum :role, {
    qa_manager: 'qa_manager',
    clinical_research_coordinator: 'clinical_research_coordinator',
    principal_investigator: 'principal_investigator',
    data_manager: 'data_manager',
    admin: 'admin'
  }

  def can_create_queries?
    qa_manager? || data_manager? || admin?
  end

  def can_close_queries?
    qa_manager? || principal_investigator? || admin?
  end

  def display_name
    name.present? ? name : email
  end
end
