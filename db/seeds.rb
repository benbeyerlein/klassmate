# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# Quarter.delete_all
# CSV.foreach("#{Rails.root}/lib/seed_data/Quarters.csv", :headers => :first_row) do |row|
#     if row[0] != nil
#       Quarter.create!(:term => row[0], :academic_year => row[1], :start_date => row[2], :end_date => row[3])
#     end
#     #puts "Quarter model seeded"
# end

# credits for variable credit courses are imported as 0.99 credits
# Course.delete_all
# CSV.foreach("#{Rails.root}/lib/seed_data/Courses.csv", :headers => :first_row) do |row|
#     if row[0] != nil
#       Course.create!(:school_course_id => row[0], :title => row[1], :status => row[2], :effective_start_quarter_id => row[3], :effective_end_quarter_id => row[4], :school_url => row[5], :credits => row[6])
#     end
#     #puts "Course model seeded"
# end

# Student.delete_all
# CSV.foreach("#{Rails.root}/lib/seed_data/Students-MECN-441.csv", :headers => :first_row) do |row|
#     if row[0] != nil
#       Student.create!(:first_name => row[0], :last_name => row[1], :school_userid => row[2], :school_username => row[3], :school_email => row[4], :profile_url => row[5], :avatar_url => row[6])
#     end
#     #puts "Student model seeded"
# end

CourseSchedule.delete_all
CSV.foreach("#{Rails.root}/lib/seed_data/CourseSchedule.csv", :headers => :first_row) do |row|
    if row[0] != nil


      #error handling if cannot locate match
      course_exists = Course.where(:school_course_id => row[0]).first
      if course_exists != nil
        course_id = course_exists.id
#        puts "Course ID is #{course_id}"
      else
        course_id = nil
        puts "Could not find Course ID for #{row[0]}"
      end

      quarter_exists = Quarter.where(:term => row[1]).first
      if quarter_exists != nil
        quarter_id = quarter_exists.id
#        puts "Quarter ID is #{quarter_id}"
      else
        quarter_id = nil
        puts "Could not find Quarter ID for #{row[0]}"
      end

      instructor_first_name = row[3].split(',')[1].strip
      instructor_last_name = row[3].split(',')[0].strip

      instructor_exists = Instructor.where(:first_name => instructor_first_name, :last_name => instructor_last_name).first
      if instructor_exists != nil
        instructor_id = instructor_exists.id
        puts "Instructor ID is #{instructor_id}"
      else
        instructor_id = nil
        puts "Could not find Instructor ID for #{row[0]}"
      end

      #now that we have quarter, find the first and last date of the class
      dow_offset = {:Mon => 0, :Tue => 1, :Wed => 2, :Thu => 3, :Fri => 4, :Sat => 5, :Sun => 6}
      puts dow_offset

      #first class after quarter start date and DOW

      if course_exists != nil && quarter_exists != nil

        first_class_date = quarter_exists.start_date + dow_offset[row[4][0..2].to_sym]

        last_class_date = quarter_exists.end_date + dow_offset[row[4][4..7].to_sym] - 7

      end


      #last class before quarter end date and DOW


      #CourseSchedule.create!(:first_name => row[0], :last_name => row[1], :school_userid => row[2], :school_username => row[3], :school_email => row[4], :profile_url => row[5], :avatar_url => row[6])
    end
    #puts "CourseSchedule model seeded"
end


    # t.integer  "course_id"
    # t.integer  "quarter_id"
    # t.integer  "section_id"
    # t.integer  "instructor_id"
    # t.string   "day_of_week"
    # t.time     "time_of_day"
    # t.string   "campus"
    # t.string   "location"
    # t.date     "first_class_date"
    # t.date     "last_class_date"
