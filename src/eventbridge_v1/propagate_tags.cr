private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  enum PropagateTags
    TaskDefinition

    def self.to_json(e : PropagateTags, json : JSON::Builder) : Nil
      value = case e
              when AEB::PropagateTags::TaskDefinition then "TASK_DEFINITION"
              else
                raise Exception.new("unknown enum value for 'PropagateTags' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::PropagateTags
      value = pull.read_string
      case value
      when "TASK_DEFINITION" then AEB::PropagateTags::TaskDefinition
      else
        raise Exception.new("unknown enum value for 'PropagateTags' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::PropagateTags::TaskDefinition then "TASK_DEFINITION"
      else
        raise Exception.new("unknown enum value for 'PropagateTags' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::PropagateTags?
      case key
      when "TASK_DEFINITION" then AEB::PropagateTags::TaskDefinition
      else
        nil
      end
    end
  end
end
