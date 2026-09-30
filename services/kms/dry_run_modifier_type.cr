private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum DryRunModifierType
    IgnoreCiphertext

    def self.to_json(e : DryRunModifierType, json : JSON::Builder) : Nil
      value = case e
              when AK::DryRunModifierType::IgnoreCiphertext then "IGNORE_CIPHERTEXT"
              else
                raise Exception.new("unknown enum value for 'DryRunModifierType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::DryRunModifierType
      value = pull.read_string
      case value
      when "IGNORE_CIPHERTEXT" then AK::DryRunModifierType::IgnoreCiphertext
      else
        raise Exception.new("unknown enum value for 'DryRunModifierType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::DryRunModifierType::IgnoreCiphertext then "IGNORE_CIPHERTEXT"
      else
        raise Exception.new("unknown enum value for 'DryRunModifierType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::DryRunModifierType?
      case key
      when "IGNORE_CIPHERTEXT" then AK::DryRunModifierType::IgnoreCiphertext
      else
        nil
      end
    end
  end
end
