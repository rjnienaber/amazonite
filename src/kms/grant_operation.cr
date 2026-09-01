private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum GrantOperation
    Decrypt
    Encrypt
    GenerateDataKey
    GenerateDataKeyWithoutPlaintext
    ReEncryptFrom
    ReEncryptTo
    Sign
    Verify
    GetPublicKey
    CreateGrant
    RetireGrant
    DescribeKey
    GenerateDataKeyPair
    GenerateDataKeyPairWithoutPlaintext
    GenerateMac
    VerifyMac
    DeriveSharedSecret

    def self.to_json(e : GrantOperation, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AK::GrantOperation
      value = pull.read_string
      case value
      when "Decrypt"                             then AK::GrantOperation::Decrypt
      when "Encrypt"                             then AK::GrantOperation::Encrypt
      when "GenerateDataKey"                     then AK::GrantOperation::GenerateDataKey
      when "GenerateDataKeyWithoutPlaintext"     then AK::GrantOperation::GenerateDataKeyWithoutPlaintext
      when "ReEncryptFrom"                       then AK::GrantOperation::ReEncryptFrom
      when "ReEncryptTo"                         then AK::GrantOperation::ReEncryptTo
      when "Sign"                                then AK::GrantOperation::Sign
      when "Verify"                              then AK::GrantOperation::Verify
      when "GetPublicKey"                        then AK::GrantOperation::GetPublicKey
      when "CreateGrant"                         then AK::GrantOperation::CreateGrant
      when "RetireGrant"                         then AK::GrantOperation::RetireGrant
      when "DescribeKey"                         then AK::GrantOperation::DescribeKey
      when "GenerateDataKeyPair"                 then AK::GrantOperation::GenerateDataKeyPair
      when "GenerateDataKeyPairWithoutPlaintext" then AK::GrantOperation::GenerateDataKeyPairWithoutPlaintext
      when "GenerateMac"                         then AK::GrantOperation::GenerateMac
      when "VerifyMac"                           then AK::GrantOperation::VerifyMac
      when "DeriveSharedSecret"                  then AK::GrantOperation::DeriveSharedSecret
      else
        raise Exception.new("unknown enum value for 'GrantOperation' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AK::GrantOperation?
      case key
      when "Decrypt"                             then AK::GrantOperation::Decrypt
      when "Encrypt"                             then AK::GrantOperation::Encrypt
      when "GenerateDataKey"                     then AK::GrantOperation::GenerateDataKey
      when "GenerateDataKeyWithoutPlaintext"     then AK::GrantOperation::GenerateDataKeyWithoutPlaintext
      when "ReEncryptFrom"                       then AK::GrantOperation::ReEncryptFrom
      when "ReEncryptTo"                         then AK::GrantOperation::ReEncryptTo
      when "Sign"                                then AK::GrantOperation::Sign
      when "Verify"                              then AK::GrantOperation::Verify
      when "GetPublicKey"                        then AK::GrantOperation::GetPublicKey
      when "CreateGrant"                         then AK::GrantOperation::CreateGrant
      when "RetireGrant"                         then AK::GrantOperation::RetireGrant
      when "DescribeKey"                         then AK::GrantOperation::DescribeKey
      when "GenerateDataKeyPair"                 then AK::GrantOperation::GenerateDataKeyPair
      when "GenerateDataKeyPairWithoutPlaintext" then AK::GrantOperation::GenerateDataKeyPairWithoutPlaintext
      when "GenerateMac"                         then AK::GrantOperation::GenerateMac
      when "VerifyMac"                           then AK::GrantOperation::VerifyMac
      when "DeriveSharedSecret"                  then AK::GrantOperation::DeriveSharedSecret
      else
        nil
      end
    end
  end
end
