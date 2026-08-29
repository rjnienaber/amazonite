private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum HookInvocationPoint
    PreProvision

    def self.to_json(e : HookInvocationPoint, json : JSON::Builder) : Nil
      value = case e
              when ACF::HookInvocationPoint::PreProvision then "PRE_PROVISION"
              else
                raise Exception.new("unknown enum value for 'HookInvocationPoint' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::HookInvocationPoint
      value = pull.read_string
      case value
      when "PRE_PROVISION" then ACF::HookInvocationPoint::PreProvision
      else
        raise Exception.new("unknown enum value for 'HookInvocationPoint' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::HookInvocationPoint::PreProvision then "PRE_PROVISION"
      else
        raise Exception.new("unknown enum value for 'HookInvocationPoint' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::HookInvocationPoint?
      case key
      when "PRE_PROVISION" then ACF::HookInvocationPoint::PreProvision
      else
        nil
      end
    end
  end
end
