collection @projects
attributes :Name__c, :Id
child :project_members do
  attributes :Name__c
end
