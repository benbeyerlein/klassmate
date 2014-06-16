class Quarter < ActiveRecord::Base

  #belongs_to :package

  has_many :course_schedules #, dependent: :destroy
  has_many :classes #, dependent: :destroy

end
