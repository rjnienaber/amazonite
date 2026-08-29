private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum KeyUsageType
    SignVerify
    EncryptDecrypt
    GenerateVerifyMac
    KeyAgreement

    def self.to_json(e : KeyUsageType, json : JSON::Builder) : Nil
      value = case e
              when AK::KeyUsageType::SignVerify        then "SIGN_VERIFY"
              when AK::KeyUsageType::EncryptDecrypt    then "ENCRYPT_DECRYPT"
              when AK::KeyUsageType::GenerateVerifyMac then "GENERATE_VERIFY_MAC"
              when AK::KeyUsageType::KeyAgreement      then "KEY_AGREEMENT"
              else
                raise Exception.new("unknown enum value for 'KeyUsageType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::KeyUsageType
      value = pull.read_string
      case value
      when "SIGN_VERIFY"         then AK::KeyUsageType::SignVerify
      when "ENCRYPT_DECRYPT"     then AK::KeyUsageType::EncryptDecrypt
      when "GENERATE_VERIFY_MAC" then AK::KeyUsageType::GenerateVerifyMac
      when "KEY_AGREEMENT"       then AK::KeyUsageType::KeyAgreement
      else
        raise Exception.new("unknown enum value for 'KeyUsageType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::KeyUsageType::SignVerify        then "SIGN_VERIFY"
      when AK::KeyUsageType::EncryptDecrypt    then "ENCRYPT_DECRYPT"
      when AK::KeyUsageType::GenerateVerifyMac then "GENERATE_VERIFY_MAC"
      when AK::KeyUsageType::KeyAgreement      then "KEY_AGREEMENT"
      else
        raise Exception.new("unknown enum value for 'KeyUsageType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::KeyUsageType?
      case key
      when "SIGN_VERIFY"         then AK::KeyUsageType::SignVerify
      when "ENCRYPT_DECRYPT"     then AK::KeyUsageType::EncryptDecrypt
      when "GENERATE_VERIFY_MAC" then AK::KeyUsageType::GenerateVerifyMac
      when "KEY_AGREEMENT"       then AK::KeyUsageType::KeyAgreement
      else
        nil
      end
    end
  end
end
