module OpenOrgBase
class TaskGraphDefinitionsController < InheritedResources::Base
  belongs_to :organization, :shallow => true
end
end
