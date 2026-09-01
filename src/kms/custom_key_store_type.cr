private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum CustomKeyStoreType
    AwsCloudhsm
    ExternalKeyStore

    def self.to_json(e : CustomKeyStoreType, json : JSON::Builder) : Nil
      value = case e
              when AK::CustomKeyStoreType::AwsCloudhsm      then "AWS_CLOUDHSM"
              when AK::CustomKeyStoreType::ExternalKeyStore then "EXTERNAL_KEY_STORE"
              else
                raise Exception.new("unknown enum value for 'CustomKeyStoreType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::CustomKeyStoreType
      value = pull.read_string
      case value
      when "AWS_CLOUDHSM"       then AK::CustomKeyStoreType::AwsCloudhsm
      when "EXTERNAL_KEY_STORE" then AK::CustomKeyStoreType::ExternalKeyStore
      else
        raise Exception.new("unknown enum value for 'CustomKeyStoreType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::CustomKeyStoreType::AwsCloudhsm      then "AWS_CLOUDHSM"
      when AK::CustomKeyStoreType::ExternalKeyStore then "EXTERNAL_KEY_STORE"
      else
        raise Exception.new("unknown enum value for 'CustomKeyStoreType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::CustomKeyStoreType?
      case key
      when "AWS_CLOUDHSM"       then AK::CustomKeyStoreType::AwsCloudhsm
      when "EXTERNAL_KEY_STORE" then AK::CustomKeyStoreType::ExternalKeyStore
      else
        nil
      end
    end
  end
end
