class AttendanceFiller
  
   def initialize(attendances)
     @attendances = attendances
   end
   
   def insert_missed_attendances
      missing ||= get_missing_dates
      @attendances.each do |student_section_enrollment, attendances|
        unless missing.count == 0
          missing.each do |day|
            Attendance.create(student_section_enrollment_id: student_section_enrollment.id, day: day, status: "")
          end
        end
      end
    end

    def get_missing_dates
      expected_range = get_valid_date_range
      existing_range = get_dates_from_attendances
      missing = expected_range - existing_range
    end

    def get_dates_from_attendances
      @days = []
      @attendances.each do |student_section_enrollment, attendances|
        attendances.each do |attendance|
          @days << attendance.day
        end
      end
      @days
    end

    def get_valid_date_range
      dates = [*Date.today-11...Date.today+1]
      dates.delete_if{|date| date.strftime('%a') == "Sat" || date.strftime('%a') == "Sun"}
    end
  
  
end