private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AccountVpcEncryptionControlMode
    Unmanaged
    AttemptMonitor
    AttemptEnforce

    def self.to_json(e : AccountVpcEncryptionControlMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::AccountVpcEncryptionControlMode::Unmanaged      then "unmanaged"
              when AEC::AccountVpcEncryptionControlMode::AttemptMonitor then "attempt-monitor"
              when AEC::AccountVpcEncryptionControlMode::AttemptEnforce then "attempt-enforce"
              else
                raise Exception.new("unknown enum value for 'AccountVpcEncryptionControlMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AccountVpcEncryptionControlMode
      value = pull.read_string
      case value
      when "unmanaged"       then AEC::AccountVpcEncryptionControlMode::Unmanaged
      when "attempt-monitor" then AEC::AccountVpcEncryptionControlMode::AttemptMonitor
      when "attempt-enforce" then AEC::AccountVpcEncryptionControlMode::AttemptEnforce
      else
        raise Exception.new("unknown enum value for 'AccountVpcEncryptionControlMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AccountVpcEncryptionControlMode::Unmanaged      then "unmanaged"
      when AEC::AccountVpcEncryptionControlMode::AttemptMonitor then "attempt-monitor"
      when AEC::AccountVpcEncryptionControlMode::AttemptEnforce then "attempt-enforce"
      else
        raise Exception.new("unknown enum value for 'AccountVpcEncryptionControlMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AccountVpcEncryptionControlMode?
      case key
      when "unmanaged"       then AEC::AccountVpcEncryptionControlMode::Unmanaged
      when "attempt-monitor" then AEC::AccountVpcEncryptionControlMode::AttemptMonitor
      when "attempt-enforce" then AEC::AccountVpcEncryptionControlMode::AttemptEnforce
      else
        nil
      end
    end
  end
end
