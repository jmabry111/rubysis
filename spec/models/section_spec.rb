require 'spec_helper'

describe Section do
  describe '#days_of_week_string' do
    it 'shows the days of the week in a string format' do
      section = Section.new(semester_id: 1, teacher_id: 1, time_block: "1-2", days_of_week: ['M', 'W'])
      section.days_of_week_string.should eq 'M, W'
    end
  end

  describe 'days of week' do
    it 'removes any blank values before saving' do
      section = Section.new(semester_id: 1, teacher_id: 1, time_block: "1-2", days_of_week: ['M', ''])
      section.save

      section.days_of_week.should =~ ['M']
    end
  end
end
