private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ClientVpnConnectionStatusCode
    Active
    FailedToTerminate
    Terminating
    Terminated

    def self.to_json(e : ClientVpnConnectionStatusCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::ClientVpnConnectionStatusCode::Active            then "active"
              when AEC::ClientVpnConnectionStatusCode::FailedToTerminate then "failed-to-terminate"
              when AEC::ClientVpnConnectionStatusCode::Terminating       then "terminating"
              when AEC::ClientVpnConnectionStatusCode::Terminated        then "terminated"
              else
                raise Exception.new("unknown enum value for 'ClientVpnConnectionStatusCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ClientVpnConnectionStatusCode
      value = pull.read_string
      case value
      when "active"              then AEC::ClientVpnConnectionStatusCode::Active
      when "failed-to-terminate" then AEC::ClientVpnConnectionStatusCode::FailedToTerminate
      when "terminating"         then AEC::ClientVpnConnectionStatusCode::Terminating
      when "terminated"          then AEC::ClientVpnConnectionStatusCode::Terminated
      else
        raise Exception.new("unknown enum value for 'ClientVpnConnectionStatusCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ClientVpnConnectionStatusCode::Active            then "active"
      when AEC::ClientVpnConnectionStatusCode::FailedToTerminate then "failed-to-terminate"
      when AEC::ClientVpnConnectionStatusCode::Terminating       then "terminating"
      when AEC::ClientVpnConnectionStatusCode::Terminated        then "terminated"
      else
        raise Exception.new("unknown enum value for 'ClientVpnConnectionStatusCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ClientVpnConnectionStatusCode?
      case key
      when "active"              then AEC::ClientVpnConnectionStatusCode::Active
      when "failed-to-terminate" then AEC::ClientVpnConnectionStatusCode::FailedToTerminate
      when "terminating"         then AEC::ClientVpnConnectionStatusCode::Terminating
      when "terminated"          then AEC::ClientVpnConnectionStatusCode::Terminated
      else
        nil
      end
    end
  end
end
