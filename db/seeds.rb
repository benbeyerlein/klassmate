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

      puts "*****FOR COURSE:  #{row}*****"

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
      if course_exists != nil && quarter_exists != nil

        #first class after quarter start date and DOW
        start_dow = quarter_exists.start_date.strftime('%a')
        dow_offset = 0
        first_class_date = quarter_exists.start_date
        until row[4][0..2] == start_dow
           first_class_date = quarter_exists.start_date + dow_offset
           dow_offset +=1;
           start_dow = first_class_date.strftime('%a')
           if dow_offset >= 7
             break
           end
        end

        # puts "quarter start: #{quarter_exists.start_date}, #{quarter_exists.start_date.strftime('%a')}"
        # puts "course start: #{first_class_date}, #{first_class_date.strftime('%a')}, offset #{dow_offset-1}"
        # puts ""

        #last class before quarter end date and DOW
        end_dow = quarter_exists.end_date.strftime('%a')
        dow_offset = 0
        last_class_date = quarter_exists.end_date
        until row[4].reverse[0..2].reverse == end_dow
           last_class_date = quarter_exists.end_date + dow_offset
           dow_offset -=1;
           end_dow = last_class_date.strftime('%a')
           if dow_offset <= -7
             break
           end
           #puts "dow_offset for last date: #{dow_offset}"
        end

        # puts "quarter end: #{quarter_exists.end_date}, #{quarter_exists.end_date.strftime('%a')}"
        # puts "course end: #{last_class_date}, #{last_class_date.strftime('%a')}, offset #{dow_offset+1}"
        # puts ""

# sleep 3

      end

      CourseSchedule.create!(:course_id => course_id, :quarter_id => quarter_id, :section_id => row[2], :instructor_id => instructor_id, :day_of_week => row[4], :time_of_day => row[5], :campus => row[6], :location => row[7], :first_class_date => first_class_date, :last_class_date => last_class_date)
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
