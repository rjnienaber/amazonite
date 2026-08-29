private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ConnectionStatus
    Connected
    Notconnected

    def self.to_json(e : ConnectionStatus, json : JSON::Builder) : Nil
      value = case e
              when AS::ConnectionStatus::Connected    then "connected"
              when AS::ConnectionStatus::Notconnected then "notconnected"
              else
                raise Exception.new("unknown enum value for 'ConnectionStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ConnectionStatus
      value = pull.read_string
      case value
      when "connected"    then AS::ConnectionStatus::Connected
      when "notconnected" then AS::ConnectionStatus::Notconnected
      else
        raise Exception.new("unknown enum value for 'ConnectionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ConnectionStatus::Connected    then "connected"
      when AS::ConnectionStatus::Notconnected then "notconnected"
      else
        raise Exception.new("unknown enum value for 'ConnectionStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ConnectionStatus?
      case key
      when "connected"    then AS::ConnectionStatus::Connected
      when "notconnected" then AS::ConnectionStatus::Notconnected
      else
        nil
      end
    end
  end
end
