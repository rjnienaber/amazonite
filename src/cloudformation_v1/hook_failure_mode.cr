private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum HookFailureMode
    Fail
    Warn

    def self.to_json(e : HookFailureMode, json : JSON::Builder) : Nil
      value = case e
              when ACF::HookFailureMode::Fail then "FAIL"
              when ACF::HookFailureMode::Warn then "WARN"
              else
                raise Exception.new("unknown enum value for 'HookFailureMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::HookFailureMode
      value = pull.read_string
      case value
      when "FAIL" then ACF::HookFailureMode::Fail
      when "WARN" then ACF::HookFailureMode::Warn
      else
        raise Exception.new("unknown enum value for 'HookFailureMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::HookFailureMode::Fail then "FAIL"
      when ACF::HookFailureMode::Warn then "WARN"
      else
        raise Exception.new("unknown enum value for 'HookFailureMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::HookFailureMode?
      case key
      when "FAIL" then ACF::HookFailureMode::Fail
      when "WARN" then ACF::HookFailureMode::Warn
      else
        nil
      end
    end
  end
end
