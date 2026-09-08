private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcEncryptionControlExclusionStateInput
    Enable
    Disable

    def self.to_json(e : VpcEncryptionControlExclusionStateInput, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcEncryptionControlExclusionStateInput::Enable  then "enable"
              when AEC::VpcEncryptionControlExclusionStateInput::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'VpcEncryptionControlExclusionStateInput' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcEncryptionControlExclusionStateInput
      value = pull.read_string
      case value
      when "enable"  then AEC::VpcEncryptionControlExclusionStateInput::Enable
      when "disable" then AEC::VpcEncryptionControlExclusionStateInput::Disable
      else
        raise Exception.new("unknown enum value for 'VpcEncryptionControlExclusionStateInput' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcEncryptionControlExclusionStateInput::Enable  then "enable"
      when AEC::VpcEncryptionControlExclusionStateInput::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'VpcEncryptionControlExclusionStateInput' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcEncryptionControlExclusionStateInput?
      case key
      when "enable"  then AEC::VpcEncryptionControlExclusionStateInput::Enable
      when "disable" then AEC::VpcEncryptionControlExclusionStateInput::Disable
      else
        nil
      end
    end
  end
end
