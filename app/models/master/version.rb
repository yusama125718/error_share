class Master::Version < ApplicationRecord
  has_many :error_content, foreign_key: :version_id
  belongs_to :middle

  validates :name, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["middle"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "middle_id"]
  end
end
