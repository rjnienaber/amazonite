private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum ChannelEncryptionType
    Kms

    def self.to_json(e : ChannelEncryptionType, json : JSON::Builder) : Nil
      value = case e
              when AK::ChannelEncryptionType::Kms then "KMS"
              else
                raise Exception.new("unknown enum value for 'ChannelEncryptionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ChannelEncryptionType
      value = pull.read_string
      case value
      when "KMS" then AK::ChannelEncryptionType::Kms
      else
        raise Exception.new("unknown enum value for 'ChannelEncryptionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ChannelEncryptionType::Kms then "KMS"
      else
        raise Exception.new("unknown enum value for 'ChannelEncryptionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ChannelEncryptionType?
      case key
      when "KMS" then AK::ChannelEncryptionType::Kms
      else
        nil
      end
    end
  end
end
