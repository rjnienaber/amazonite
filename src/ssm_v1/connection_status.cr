private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ConnectionStatus
    Connected
    NotConnected

    def self.to_json(e : ConnectionStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ConnectionStatus
      value = pull.read_string
      case value
      when "Connected"    then AS::ConnectionStatus::Connected
      when "NotConnected" then AS::ConnectionStatus::NotConnected
      else
        raise Exception.new("unknown enum value for 'ConnectionStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
