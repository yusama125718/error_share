class Master::Middle < ApplicationRecord
  has_many :version, dependent: :destroy, foreign_key: :middle_id
  has_many :error_content, foreign_key: :middle_id

  validates :name, presence: true
  validates :name, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
