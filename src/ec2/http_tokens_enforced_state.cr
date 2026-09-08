private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum HttpTokensEnforcedState
    Disabled
    Enabled

    def self.to_json(e : HttpTokensEnforcedState, json : JSON::Builder) : Nil
      value = case e
              when AEC::HttpTokensEnforcedState::Disabled then "disabled"
              when AEC::HttpTokensEnforcedState::Enabled  then "enabled"
              else
                raise Exception.new("unknown enum value for 'HttpTokensEnforcedState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::HttpTokensEnforcedState
      value = pull.read_string
      case value
      when "disabled" then AEC::HttpTokensEnforcedState::Disabled
      when "enabled"  then AEC::HttpTokensEnforcedState::Enabled
      else
        raise Exception.new("unknown enum value for 'HttpTokensEnforcedState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::HttpTokensEnforcedState::Disabled then "disabled"
      when AEC::HttpTokensEnforcedState::Enabled  then "enabled"
      else
        raise Exception.new("unknown enum value for 'HttpTokensEnforcedState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::HttpTokensEnforcedState?
      case key
      when "disabled" then AEC::HttpTokensEnforcedState::Disabled
      when "enabled"  then AEC::HttpTokensEnforcedState::Enabled
      else
        nil
      end
    end
  end
end
