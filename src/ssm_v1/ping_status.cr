private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum PingStatus
    Online
    ConnectionLost
    Inactive

    def self.to_json(e : PingStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PingStatus
      value = pull.read_string
      case value
      when "Online"         then AS::PingStatus::Online
      when "ConnectionLost" then AS::PingStatus::ConnectionLost
      when "Inactive"       then AS::PingStatus::Inactive
      else
        raise Exception.new("unknown enum value for 'PingStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
