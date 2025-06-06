class Master::Middle < ApplicationRecord
  validates :name, presence: {}

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
