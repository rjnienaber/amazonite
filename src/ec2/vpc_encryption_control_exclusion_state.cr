private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcEncryptionControlExclusionState
    Enabling
    Enabled
    Disabling
    Disabled

    def self.to_json(e : VpcEncryptionControlExclusionState, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcEncryptionControlExclusionState::Enabling  then "enabling"
              when AEC::VpcEncryptionControlExclusionState::Enabled   then "enabled"
              when AEC::VpcEncryptionControlExclusionState::Disabling then "disabling"
              when AEC::VpcEncryptionControlExclusionState::Disabled  then "disabled"
              else
                raise Exception.new("unknown enum value for 'VpcEncryptionControlExclusionState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcEncryptionControlExclusionState
      value = pull.read_string
      case value
      when "enabling"  then AEC::VpcEncryptionControlExclusionState::Enabling
      when "enabled"   then AEC::VpcEncryptionControlExclusionState::Enabled
      when "disabling" then AEC::VpcEncryptionControlExclusionState::Disabling
      when "disabled"  then AEC::VpcEncryptionControlExclusionState::Disabled
      else
        raise Exception.new("unknown enum value for 'VpcEncryptionControlExclusionState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcEncryptionControlExclusionState::Enabling  then "enabling"
      when AEC::VpcEncryptionControlExclusionState::Enabled   then "enabled"
      when AEC::VpcEncryptionControlExclusionState::Disabling then "disabling"
      when AEC::VpcEncryptionControlExclusionState::Disabled  then "disabled"
      else
        raise Exception.new("unknown enum value for 'VpcEncryptionControlExclusionState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcEncryptionControlExclusionState?
      case key
      when "enabling"  then AEC::VpcEncryptionControlExclusionState::Enabling
      when "enabled"   then AEC::VpcEncryptionControlExclusionState::Enabled
      when "disabling" then AEC::VpcEncryptionControlExclusionState::Disabling
      when "disabled"  then AEC::VpcEncryptionControlExclusionState::Disabled
      else
        nil
      end
    end
  end
end
