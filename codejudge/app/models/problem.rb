class Problem < ApplicationRecord
  has_many :test_cases, dependent: :destroy
  accepts_nested_attributes_for :test_cases, reject_if: :all_blank, allow_destroy: true
  has_many :attempts, dependent: :destroy

  def visible_test_cases(problem, role)
    role == :student.to_s ? problem.test_cases.where(example: true) : problem.test_cases
  end
end
