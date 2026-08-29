private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum KeyLastUsageTrackingOperation
    Decrypt
    DeriveSharedSecret
    Encrypt
    GenerateDataKey
    GenerateDataKeyPair
    GenerateDataKeyPairWithoutPlaintext
    GenerateDataKeyWithoutPlaintext
    GenerateMac
    ReEncrypt
    Sign
    Verify
    VerifyMac

    def self.to_json(e : KeyLastUsageTrackingOperation, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AK::KeyLastUsageTrackingOperation
      value = pull.read_string
      case value
      when "Decrypt"                             then AK::KeyLastUsageTrackingOperation::Decrypt
      when "DeriveSharedSecret"                  then AK::KeyLastUsageTrackingOperation::DeriveSharedSecret
      when "Encrypt"                             then AK::KeyLastUsageTrackingOperation::Encrypt
      when "GenerateDataKey"                     then AK::KeyLastUsageTrackingOperation::GenerateDataKey
      when "GenerateDataKeyPair"                 then AK::KeyLastUsageTrackingOperation::GenerateDataKeyPair
      when "GenerateDataKeyPairWithoutPlaintext" then AK::KeyLastUsageTrackingOperation::GenerateDataKeyPairWithoutPlaintext
      when "GenerateDataKeyWithoutPlaintext"     then AK::KeyLastUsageTrackingOperation::GenerateDataKeyWithoutPlaintext
      when "GenerateMac"                         then AK::KeyLastUsageTrackingOperation::GenerateMac
      when "ReEncrypt"                           then AK::KeyLastUsageTrackingOperation::ReEncrypt
      when "Sign"                                then AK::KeyLastUsageTrackingOperation::Sign
      when "Verify"                              then AK::KeyLastUsageTrackingOperation::Verify
      when "VerifyMac"                           then AK::KeyLastUsageTrackingOperation::VerifyMac
      else
        raise Exception.new("unknown enum value for 'KeyLastUsageTrackingOperation' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AK::KeyLastUsageTrackingOperation?
      case key
      when "Decrypt"                             then AK::KeyLastUsageTrackingOperation::Decrypt
      when "DeriveSharedSecret"                  then AK::KeyLastUsageTrackingOperation::DeriveSharedSecret
      when "Encrypt"                             then AK::KeyLastUsageTrackingOperation::Encrypt
      when "GenerateDataKey"                     then AK::KeyLastUsageTrackingOperation::GenerateDataKey
      when "GenerateDataKeyPair"                 then AK::KeyLastUsageTrackingOperation::GenerateDataKeyPair
      when "GenerateDataKeyPairWithoutPlaintext" then AK::KeyLastUsageTrackingOperation::GenerateDataKeyPairWithoutPlaintext
      when "GenerateDataKeyWithoutPlaintext"     then AK::KeyLastUsageTrackingOperation::GenerateDataKeyWithoutPlaintext
      when "GenerateMac"                         then AK::KeyLastUsageTrackingOperation::GenerateMac
      when "ReEncrypt"                           then AK::KeyLastUsageTrackingOperation::ReEncrypt
      when "Sign"                                then AK::KeyLastUsageTrackingOperation::Sign
      when "Verify"                              then AK::KeyLastUsageTrackingOperation::Verify
      when "VerifyMac"                           then AK::KeyLastUsageTrackingOperation::VerifyMac
      else
        nil
      end
    end
  end
end
