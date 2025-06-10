class ErrorContent < ApplicationRecord
  has_many :failure, dependent: :destroy, foreign_key: :error_id
  has_many :solution, dependent: :destroy, foreign_key: :error_id

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "content", "resolved", "created_at"]
  end
end
