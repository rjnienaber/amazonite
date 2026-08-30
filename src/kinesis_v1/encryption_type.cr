private alias AK = Amazonite::KinesisV1

module Amazonite::KinesisV1
  enum EncryptionType
    None
    Kms

    def self.to_json(e : EncryptionType, json : JSON::Builder) : Nil
      value = case e
              when AK::EncryptionType::None then "NONE"
              when AK::EncryptionType::Kms  then "KMS"
              else
                raise Exception.new("unknown enum value for 'EncryptionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::EncryptionType
      value = pull.read_string
      case value
      when "NONE" then AK::EncryptionType::None
      when "KMS"  then AK::EncryptionType::Kms
      else
        raise Exception.new("unknown enum value for 'EncryptionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::EncryptionType::None then "NONE"
      when AK::EncryptionType::Kms  then "KMS"
      else
        raise Exception.new("unknown enum value for 'EncryptionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::EncryptionType?
      case key
      when "NONE" then AK::EncryptionType::None
      when "KMS"  then AK::EncryptionType::Kms
      else
        nil
      end
    end
  end
end
