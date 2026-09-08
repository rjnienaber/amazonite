private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ConnectionNotificationState
    Enabled
    Disabled

    def self.to_json(e : ConnectionNotificationState, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ConnectionNotificationState
      value = pull.read_string
      case value
      when "Enabled"  then AEC::ConnectionNotificationState::Enabled
      when "Disabled" then AEC::ConnectionNotificationState::Disabled
      else
        raise Exception.new("unknown enum value for 'ConnectionNotificationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::ConnectionNotificationState?
      case key
      when "Enabled"  then AEC::ConnectionNotificationState::Enabled
      when "Disabled" then AEC::ConnectionNotificationState::Disabled
      else
        nil
      end
    end
  end
end
