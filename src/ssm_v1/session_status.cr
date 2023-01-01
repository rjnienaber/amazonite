private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum SessionStatus
    Connected
    Connecting
    Disconnected
    Terminated
    Terminating
    Failed

    def self.to_json(e : SessionStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::SessionStatus
      value = pull.read_string
      case value
      when "Connected"    then AS::SessionStatus::Connected
      when "Connecting"   then AS::SessionStatus::Connecting
      when "Disconnected" then AS::SessionStatus::Disconnected
      when "Terminated"   then AS::SessionStatus::Terminated
      when "Terminating"  then AS::SessionStatus::Terminating
      when "Failed"       then AS::SessionStatus::Failed
      else
        raise Exception.new("unknown enum value for 'SessionStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
