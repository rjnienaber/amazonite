private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum HookStatus
    HookInProgress
    HookCompleteSucceeded
    HookCompleteFailed
    HookFailed

    def self.to_json(e : HookStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::HookStatus::HookInProgress        then "HOOK_IN_PROGRESS"
              when ACF::HookStatus::HookCompleteSucceeded then "HOOK_COMPLETE_SUCCEEDED"
              when ACF::HookStatus::HookCompleteFailed    then "HOOK_COMPLETE_FAILED"
              when ACF::HookStatus::HookFailed            then "HOOK_FAILED"
              else
                raise Exception.new("unknown enum value for 'HookStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::HookStatus
      value = pull.read_string
      case value
      when "HOOK_IN_PROGRESS"        then ACF::HookStatus::HookInProgress
      when "HOOK_COMPLETE_SUCCEEDED" then ACF::HookStatus::HookCompleteSucceeded
      when "HOOK_COMPLETE_FAILED"    then ACF::HookStatus::HookCompleteFailed
      when "HOOK_FAILED"             then ACF::HookStatus::HookFailed
      else
        raise Exception.new("unknown enum value for 'HookStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::HookStatus::HookInProgress        then "HOOK_IN_PROGRESS"
      when ACF::HookStatus::HookCompleteSucceeded then "HOOK_COMPLETE_SUCCEEDED"
      when ACF::HookStatus::HookCompleteFailed    then "HOOK_COMPLETE_FAILED"
      when ACF::HookStatus::HookFailed            then "HOOK_FAILED"
      else
        raise Exception.new("unknown enum value for 'HookStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::HookStatus?
      case key
      when "HOOK_IN_PROGRESS"        then ACF::HookStatus::HookInProgress
      when "HOOK_COMPLETE_SUCCEEDED" then ACF::HookStatus::HookCompleteSucceeded
      when "HOOK_COMPLETE_FAILED"    then ACF::HookStatus::HookCompleteFailed
      when "HOOK_FAILED"             then ACF::HookStatus::HookFailed
      else
        nil
      end
    end
  end
end
