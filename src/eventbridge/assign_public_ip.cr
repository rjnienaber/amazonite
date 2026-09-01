private alias AEB = Amazonite::EventBridge

module Amazonite::EventBridge
  enum AssignPublicIp
    Enabled
    Disabled

    def self.to_json(e : AssignPublicIp, json : JSON::Builder) : Nil
      value = case e
              when AEB::AssignPublicIp::Enabled  then "ENABLED"
              when AEB::AssignPublicIp::Disabled then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'AssignPublicIp' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::AssignPublicIp
      value = pull.read_string
      case value
      when "ENABLED"  then AEB::AssignPublicIp::Enabled
      when "DISABLED" then AEB::AssignPublicIp::Disabled
      else
        raise Exception.new("unknown enum value for 'AssignPublicIp' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::AssignPublicIp::Enabled  then "ENABLED"
      when AEB::AssignPublicIp::Disabled then "DISABLED"
      else
        raise Exception.new("unknown enum value for 'AssignPublicIp' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::AssignPublicIp?
      case key
      when "ENABLED"  then AEB::AssignPublicIp::Enabled
      when "DISABLED" then AEB::AssignPublicIp::Disabled
      else
        nil
      end
    end
  end
end
