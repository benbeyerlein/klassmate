# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Quarter.delete_all
CSV.foreach("#{Rails.root}/lib/seed_data/Quarters.csv", :headers => :first_row) do |row|
    if row[0] != nil
      Quarter.create!(:term => row[0], :academic_year => row[1], :start_date => row[2], :end_date => row[3])
    end
    #puts "Quarter model seeded"
end

Course.delete_all
CSV.foreach("#{Rails.root}/lib/seed_data/Courses.csv", :headers => :first_row) do |row|
    if row[0] != nil
      Course.create!(:school_course_id => row[0], :title => row[1], :status => row[2], :effective_start_quarter_id => row[3], :effective_end_quarter_id => row[4], :school_url => row[5], :credits => row[6])
    end
    #puts "Course model seeded"
end

