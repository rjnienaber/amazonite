private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum EventType
    StackEvent
    ProgressEvent
    ValidationError
    ProvisioningError
    HookInvocationError

    def self.to_json(e : EventType, json : JSON::Builder) : Nil
      value = case e
              when ACF::EventType::StackEvent          then "STACK_EVENT"
              when ACF::EventType::ProgressEvent       then "PROGRESS_EVENT"
              when ACF::EventType::ValidationError     then "VALIDATION_ERROR"
              when ACF::EventType::ProvisioningError   then "PROVISIONING_ERROR"
              when ACF::EventType::HookInvocationError then "HOOK_INVOCATION_ERROR"
              else
                raise Exception.new("unknown enum value for 'EventType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::EventType
      value = pull.read_string
      case value
      when "STACK_EVENT"           then ACF::EventType::StackEvent
      when "PROGRESS_EVENT"        then ACF::EventType::ProgressEvent
      when "VALIDATION_ERROR"      then ACF::EventType::ValidationError
      when "PROVISIONING_ERROR"    then ACF::EventType::ProvisioningError
      when "HOOK_INVOCATION_ERROR" then ACF::EventType::HookInvocationError
      else
        raise Exception.new("unknown enum value for 'EventType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::EventType::StackEvent          then "STACK_EVENT"
      when ACF::EventType::ProgressEvent       then "PROGRESS_EVENT"
      when ACF::EventType::ValidationError     then "VALIDATION_ERROR"
      when ACF::EventType::ProvisioningError   then "PROVISIONING_ERROR"
      when ACF::EventType::HookInvocationError then "HOOK_INVOCATION_ERROR"
      else
        raise Exception.new("unknown enum value for 'EventType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::EventType?
      case key
      when "STACK_EVENT"           then ACF::EventType::StackEvent
      when "PROGRESS_EVENT"        then ACF::EventType::ProgressEvent
      when "VALIDATION_ERROR"      then ACF::EventType::ValidationError
      when "PROVISIONING_ERROR"    then ACF::EventType::ProvisioningError
      when "HOOK_INVOCATION_ERROR" then ACF::EventType::HookInvocationError
      else
        nil
      end
    end
  end
end
