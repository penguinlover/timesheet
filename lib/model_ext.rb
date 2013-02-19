module ModelExtension
  class Project_Member
    attr_reader :Name__c, :Total_Hour_Worked__c
    def initialize name, wh
      @Name__c = name
      @Total_Hour_Worked__c = wh
    end
  end

  module ProjectExtension
    def project_members
      [Project_Member.new('Kevin Lucifer', 32), 
       Project_Member.new('Robert Half', 48)]
    end
  end
end
