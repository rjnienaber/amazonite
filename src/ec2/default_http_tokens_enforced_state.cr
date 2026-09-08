private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DefaultHttpTokensEnforcedState
    Disabled
    Enabled
    NoPreference

    def self.to_json(e : DefaultHttpTokensEnforcedState, json : JSON::Builder) : Nil
      value = case e
              when AEC::DefaultHttpTokensEnforcedState::Disabled     then "disabled"
              when AEC::DefaultHttpTokensEnforcedState::Enabled      then "enabled"
              when AEC::DefaultHttpTokensEnforcedState::NoPreference then "no-preference"
              else
                raise Exception.new("unknown enum value for 'DefaultHttpTokensEnforcedState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DefaultHttpTokensEnforcedState
      value = pull.read_string
      case value
      when "disabled"      then AEC::DefaultHttpTokensEnforcedState::Disabled
      when "enabled"       then AEC::DefaultHttpTokensEnforcedState::Enabled
      when "no-preference" then AEC::DefaultHttpTokensEnforcedState::NoPreference
      else
        raise Exception.new("unknown enum value for 'DefaultHttpTokensEnforcedState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DefaultHttpTokensEnforcedState::Disabled     then "disabled"
      when AEC::DefaultHttpTokensEnforcedState::Enabled      then "enabled"
      when AEC::DefaultHttpTokensEnforcedState::NoPreference then "no-preference"
      else
        raise Exception.new("unknown enum value for 'DefaultHttpTokensEnforcedState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DefaultHttpTokensEnforcedState?
      case key
      when "disabled"      then AEC::DefaultHttpTokensEnforcedState::Disabled
      when "enabled"       then AEC::DefaultHttpTokensEnforcedState::Enabled
      when "no-preference" then AEC::DefaultHttpTokensEnforcedState::NoPreference
      else
        nil
      end
    end
  end
end
