private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ResetImageAttributeName
    LaunchPermission

    def self.to_json(e : ResetImageAttributeName, json : JSON::Builder) : Nil
      value = case e
              when AEC::ResetImageAttributeName::LaunchPermission then "launchPermission"
              else
                raise Exception.new("unknown enum value for 'ResetImageAttributeName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ResetImageAttributeName
      value = pull.read_string
      case value
      when "launchPermission" then AEC::ResetImageAttributeName::LaunchPermission
      else
        raise Exception.new("unknown enum value for 'ResetImageAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ResetImageAttributeName::LaunchPermission then "launchPermission"
      else
        raise Exception.new("unknown enum value for 'ResetImageAttributeName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ResetImageAttributeName?
      case key
      when "launchPermission" then AEC::ResetImageAttributeName::LaunchPermission
      else
        nil
      end
    end
  end
end
