private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum AutomationExecutionFilterKey
    DocumentNamePrefix
    ExecutionStatus
    ExecutionId
    ParentExecutionId
    CurrentAction
    StartTimeBefore
    StartTimeAfter
    AutomationType
    TagKey
    TargetResourceGroup
    AutomationSubtype
    OpsItemId

    def self.to_json(e : AutomationExecutionFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AutomationExecutionFilterKey
      value = pull.read_string
      case value
      when "DocumentNamePrefix"  then AS::AutomationExecutionFilterKey::DocumentNamePrefix
      when "ExecutionStatus"     then AS::AutomationExecutionFilterKey::ExecutionStatus
      when "ExecutionId"         then AS::AutomationExecutionFilterKey::ExecutionId
      when "ParentExecutionId"   then AS::AutomationExecutionFilterKey::ParentExecutionId
      when "CurrentAction"       then AS::AutomationExecutionFilterKey::CurrentAction
      when "StartTimeBefore"     then AS::AutomationExecutionFilterKey::StartTimeBefore
      when "StartTimeAfter"      then AS::AutomationExecutionFilterKey::StartTimeAfter
      when "AutomationType"      then AS::AutomationExecutionFilterKey::AutomationType
      when "TagKey"              then AS::AutomationExecutionFilterKey::TagKey
      when "TargetResourceGroup" then AS::AutomationExecutionFilterKey::TargetResourceGroup
      when "AutomationSubtype"   then AS::AutomationExecutionFilterKey::AutomationSubtype
      when "OpsItemId"           then AS::AutomationExecutionFilterKey::OpsItemId
      else
        raise Exception.new("unknown enum value for 'AutomationExecutionFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
