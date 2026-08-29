private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum OriginType
    AwsKms
    External
    AwsCloudhsm
    ExternalKeyStore

    def self.to_json(e : OriginType, json : JSON::Builder) : Nil
      value = case e
              when AK::OriginType::AwsKms           then "AWS_KMS"
              when AK::OriginType::External         then "EXTERNAL"
              when AK::OriginType::AwsCloudhsm      then "AWS_CLOUDHSM"
              when AK::OriginType::ExternalKeyStore then "EXTERNAL_KEY_STORE"
              else
                raise Exception.new("unknown enum value for 'OriginType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::OriginType
      value = pull.read_string
      case value
      when "AWS_KMS"            then AK::OriginType::AwsKms
      when "EXTERNAL"           then AK::OriginType::External
      when "AWS_CLOUDHSM"       then AK::OriginType::AwsCloudhsm
      when "EXTERNAL_KEY_STORE" then AK::OriginType::ExternalKeyStore
      else
        raise Exception.new("unknown enum value for 'OriginType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::OriginType::AwsKms           then "AWS_KMS"
      when AK::OriginType::External         then "EXTERNAL"
      when AK::OriginType::AwsCloudhsm      then "AWS_CLOUDHSM"
      when AK::OriginType::ExternalKeyStore then "EXTERNAL_KEY_STORE"
      else
        raise Exception.new("unknown enum value for 'OriginType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::OriginType?
      case key
      when "AWS_KMS"            then AK::OriginType::AwsKms
      when "EXTERNAL"           then AK::OriginType::External
      when "AWS_CLOUDHSM"       then AK::OriginType::AwsCloudhsm
      when "EXTERNAL_KEY_STORE" then AK::OriginType::ExternalKeyStore
      else
        nil
      end
    end
  end
end
