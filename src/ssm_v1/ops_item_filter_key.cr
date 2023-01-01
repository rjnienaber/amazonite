private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum OpsItemFilterKey
    Status
    CreatedBy
    Source
    Priority
    Title
    OpsItemId
    CreatedTime
    LastModifiedTime
    ActualStartTime
    ActualEndTime
    PlannedStartTime
    PlannedEndTime
    OperationalData
    OperationalDataKey
    OperationalDataValue
    ResourceId
    AutomationId
    Category
    Severity
    OpsItemType
    ChangeRequestByRequesterArn
    ChangeRequestByRequesterName
    ChangeRequestByApproverArn
    ChangeRequestByApproverName
    ChangeRequestByTemplate
    ChangeRequestByTargetsResourceGroup
    InsightByType

    def self.to_json(e : OpsItemFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OpsItemFilterKey
      value = pull.read_string
      case value
      when "Status"                              then AS::OpsItemFilterKey::Status
      when "CreatedBy"                           then AS::OpsItemFilterKey::CreatedBy
      when "Source"                              then AS::OpsItemFilterKey::Source
      when "Priority"                            then AS::OpsItemFilterKey::Priority
      when "Title"                               then AS::OpsItemFilterKey::Title
      when "OpsItemId"                           then AS::OpsItemFilterKey::OpsItemId
      when "CreatedTime"                         then AS::OpsItemFilterKey::CreatedTime
      when "LastModifiedTime"                    then AS::OpsItemFilterKey::LastModifiedTime
      when "ActualStartTime"                     then AS::OpsItemFilterKey::ActualStartTime
      when "ActualEndTime"                       then AS::OpsItemFilterKey::ActualEndTime
      when "PlannedStartTime"                    then AS::OpsItemFilterKey::PlannedStartTime
      when "PlannedEndTime"                      then AS::OpsItemFilterKey::PlannedEndTime
      when "OperationalData"                     then AS::OpsItemFilterKey::OperationalData
      when "OperationalDataKey"                  then AS::OpsItemFilterKey::OperationalDataKey
      when "OperationalDataValue"                then AS::OpsItemFilterKey::OperationalDataValue
      when "ResourceId"                          then AS::OpsItemFilterKey::ResourceId
      when "AutomationId"                        then AS::OpsItemFilterKey::AutomationId
      when "Category"                            then AS::OpsItemFilterKey::Category
      when "Severity"                            then AS::OpsItemFilterKey::Severity
      when "OpsItemType"                         then AS::OpsItemFilterKey::OpsItemType
      when "ChangeRequestByRequesterArn"         then AS::OpsItemFilterKey::ChangeRequestByRequesterArn
      when "ChangeRequestByRequesterName"        then AS::OpsItemFilterKey::ChangeRequestByRequesterName
      when "ChangeRequestByApproverArn"          then AS::OpsItemFilterKey::ChangeRequestByApproverArn
      when "ChangeRequestByApproverName"         then AS::OpsItemFilterKey::ChangeRequestByApproverName
      when "ChangeRequestByTemplate"             then AS::OpsItemFilterKey::ChangeRequestByTemplate
      when "ChangeRequestByTargetsResourceGroup" then AS::OpsItemFilterKey::ChangeRequestByTargetsResourceGroup
      when "InsightByType"                       then AS::OpsItemFilterKey::InsightByType
      else
        raise Exception.new("unknown enum value for 'OpsItemFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
