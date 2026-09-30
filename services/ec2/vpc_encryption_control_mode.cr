private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcEncryptionControlMode
    Monitor
    Enforce

    def self.to_json(e : VpcEncryptionControlMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcEncryptionControlMode::Monitor then "monitor"
              when AEC::VpcEncryptionControlMode::Enforce then "enforce"
              else
                raise Exception.new("unknown enum value for 'VpcEncryptionControlMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcEncryptionControlMode
      value = pull.read_string
      case value
      when "monitor" then AEC::VpcEncryptionControlMode::Monitor
      when "enforce" then AEC::VpcEncryptionControlMode::Enforce
      else
        raise Exception.new("unknown enum value for 'VpcEncryptionControlMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcEncryptionControlMode::Monitor then "monitor"
      when AEC::VpcEncryptionControlMode::Enforce then "enforce"
      else
        raise Exception.new("unknown enum value for 'VpcEncryptionControlMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcEncryptionControlMode?
      case key
      when "monitor" then AEC::VpcEncryptionControlMode::Monitor
      when "enforce" then AEC::VpcEncryptionControlMode::Enforce
      else
        nil
      end
    end
  end
end
