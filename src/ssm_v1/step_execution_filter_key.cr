private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum StepExecutionFilterKey
    StartTimeBefore
    StartTimeAfter
    StepExecutionStatus
    StepExecutionId
    StepName
    Action

    def self.to_json(e : StepExecutionFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::StepExecutionFilterKey
      value = pull.read_string
      case value
      when "StartTimeBefore"     then AS::StepExecutionFilterKey::StartTimeBefore
      when "StartTimeAfter"      then AS::StepExecutionFilterKey::StartTimeAfter
      when "StepExecutionStatus" then AS::StepExecutionFilterKey::StepExecutionStatus
      when "StepExecutionId"     then AS::StepExecutionFilterKey::StepExecutionId
      when "StepName"            then AS::StepExecutionFilterKey::StepName
      when "Action"              then AS::StepExecutionFilterKey::Action
      else
        raise Exception.new("unknown enum value for 'StepExecutionFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
