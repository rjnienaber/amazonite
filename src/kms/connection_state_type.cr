private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum ConnectionStateType
    Connected
    Connecting
    Failed
    Disconnected
    Disconnecting

    def self.to_json(e : ConnectionStateType, json : JSON::Builder) : Nil
      value = case e
              when AK::ConnectionStateType::Connected     then "CONNECTED"
              when AK::ConnectionStateType::Connecting    then "CONNECTING"
              when AK::ConnectionStateType::Failed        then "FAILED"
              when AK::ConnectionStateType::Disconnected  then "DISCONNECTED"
              when AK::ConnectionStateType::Disconnecting then "DISCONNECTING"
              else
                raise Exception.new("unknown enum value for 'ConnectionStateType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ConnectionStateType
      value = pull.read_string
      case value
      when "CONNECTED"     then AK::ConnectionStateType::Connected
      when "CONNECTING"    then AK::ConnectionStateType::Connecting
      when "FAILED"        then AK::ConnectionStateType::Failed
      when "DISCONNECTED"  then AK::ConnectionStateType::Disconnected
      when "DISCONNECTING" then AK::ConnectionStateType::Disconnecting
      else
        raise Exception.new("unknown enum value for 'ConnectionStateType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ConnectionStateType::Connected     then "CONNECTED"
      when AK::ConnectionStateType::Connecting    then "CONNECTING"
      when AK::ConnectionStateType::Failed        then "FAILED"
      when AK::ConnectionStateType::Disconnected  then "DISCONNECTED"
      when AK::ConnectionStateType::Disconnecting then "DISCONNECTING"
      else
        raise Exception.new("unknown enum value for 'ConnectionStateType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ConnectionStateType?
      case key
      when "CONNECTED"     then AK::ConnectionStateType::Connected
      when "CONNECTING"    then AK::ConnectionStateType::Connecting
      when "FAILED"        then AK::ConnectionStateType::Failed
      when "DISCONNECTED"  then AK::ConnectionStateType::Disconnected
      when "DISCONNECTING" then AK::ConnectionStateType::Disconnecting
      else
        nil
      end
    end
  end
end
