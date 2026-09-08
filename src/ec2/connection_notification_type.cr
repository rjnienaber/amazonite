private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ConnectionNotificationType
    Topic

    def self.to_json(e : ConnectionNotificationType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ConnectionNotificationType
      value = pull.read_string
      case value
      when "Topic" then AEC::ConnectionNotificationType::Topic
      else
        raise Exception.new("unknown enum value for 'ConnectionNotificationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::ConnectionNotificationType?
      case key
      when "Topic" then AEC::ConnectionNotificationType::Topic
      else
        nil
      end
    end
  end
end
