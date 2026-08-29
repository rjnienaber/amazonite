private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum CustomerMasterKeySpec
    Rsa2048
    Rsa3072
    Rsa4096
    EccNistP256
    EccNistP384
    EccNistP521
    EccSecgP256k1
    SymmetricDefault
    Hmac224
    Hmac256
    Hmac384
    Hmac512
    Sm2

    def self.to_json(e : CustomerMasterKeySpec, json : JSON::Builder) : Nil
      value = case e
              when AK::CustomerMasterKeySpec::Rsa2048          then "RSA_2048"
              when AK::CustomerMasterKeySpec::Rsa3072          then "RSA_3072"
              when AK::CustomerMasterKeySpec::Rsa4096          then "RSA_4096"
              when AK::CustomerMasterKeySpec::EccNistP256      then "ECC_NIST_P256"
              when AK::CustomerMasterKeySpec::EccNistP384      then "ECC_NIST_P384"
              when AK::CustomerMasterKeySpec::EccNistP521      then "ECC_NIST_P521"
              when AK::CustomerMasterKeySpec::EccSecgP256k1    then "ECC_SECG_P256K1"
              when AK::CustomerMasterKeySpec::SymmetricDefault then "SYMMETRIC_DEFAULT"
              when AK::CustomerMasterKeySpec::Hmac224          then "HMAC_224"
              when AK::CustomerMasterKeySpec::Hmac256          then "HMAC_256"
              when AK::CustomerMasterKeySpec::Hmac384          then "HMAC_384"
              when AK::CustomerMasterKeySpec::Hmac512          then "HMAC_512"
              when AK::CustomerMasterKeySpec::Sm2              then "SM2"
              else
                raise Exception.new("unknown enum value for 'CustomerMasterKeySpec' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::CustomerMasterKeySpec
      value = pull.read_string
      case value
      when "RSA_2048"          then AK::CustomerMasterKeySpec::Rsa2048
      when "RSA_3072"          then AK::CustomerMasterKeySpec::Rsa3072
      when "RSA_4096"          then AK::CustomerMasterKeySpec::Rsa4096
      when "ECC_NIST_P256"     then AK::CustomerMasterKeySpec::EccNistP256
      when "ECC_NIST_P384"     then AK::CustomerMasterKeySpec::EccNistP384
      when "ECC_NIST_P521"     then AK::CustomerMasterKeySpec::EccNistP521
      when "ECC_SECG_P256K1"   then AK::CustomerMasterKeySpec::EccSecgP256k1
      when "SYMMETRIC_DEFAULT" then AK::CustomerMasterKeySpec::SymmetricDefault
      when "HMAC_224"          then AK::CustomerMasterKeySpec::Hmac224
      when "HMAC_256"          then AK::CustomerMasterKeySpec::Hmac256
      when "HMAC_384"          then AK::CustomerMasterKeySpec::Hmac384
      when "HMAC_512"          then AK::CustomerMasterKeySpec::Hmac512
      when "SM2"               then AK::CustomerMasterKeySpec::Sm2
      else
        raise Exception.new("unknown enum value for 'CustomerMasterKeySpec' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::CustomerMasterKeySpec::Rsa2048          then "RSA_2048"
      when AK::CustomerMasterKeySpec::Rsa3072          then "RSA_3072"
      when AK::CustomerMasterKeySpec::Rsa4096          then "RSA_4096"
      when AK::CustomerMasterKeySpec::EccNistP256      then "ECC_NIST_P256"
      when AK::CustomerMasterKeySpec::EccNistP384      then "ECC_NIST_P384"
      when AK::CustomerMasterKeySpec::EccNistP521      then "ECC_NIST_P521"
      when AK::CustomerMasterKeySpec::EccSecgP256k1    then "ECC_SECG_P256K1"
      when AK::CustomerMasterKeySpec::SymmetricDefault then "SYMMETRIC_DEFAULT"
      when AK::CustomerMasterKeySpec::Hmac224          then "HMAC_224"
      when AK::CustomerMasterKeySpec::Hmac256          then "HMAC_256"
      when AK::CustomerMasterKeySpec::Hmac384          then "HMAC_384"
      when AK::CustomerMasterKeySpec::Hmac512          then "HMAC_512"
      when AK::CustomerMasterKeySpec::Sm2              then "SM2"
      else
        raise Exception.new("unknown enum value for 'CustomerMasterKeySpec' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::CustomerMasterKeySpec?
      case key
      when "RSA_2048"          then AK::CustomerMasterKeySpec::Rsa2048
      when "RSA_3072"          then AK::CustomerMasterKeySpec::Rsa3072
      when "RSA_4096"          then AK::CustomerMasterKeySpec::Rsa4096
      when "ECC_NIST_P256"     then AK::CustomerMasterKeySpec::EccNistP256
      when "ECC_NIST_P384"     then AK::CustomerMasterKeySpec::EccNistP384
      when "ECC_NIST_P521"     then AK::CustomerMasterKeySpec::EccNistP521
      when "ECC_SECG_P256K1"   then AK::CustomerMasterKeySpec::EccSecgP256k1
      when "SYMMETRIC_DEFAULT" then AK::CustomerMasterKeySpec::SymmetricDefault
      when "HMAC_224"          then AK::CustomerMasterKeySpec::Hmac224
      when "HMAC_256"          then AK::CustomerMasterKeySpec::Hmac256
      when "HMAC_384"          then AK::CustomerMasterKeySpec::Hmac384
      when "HMAC_512"          then AK::CustomerMasterKeySpec::Hmac512
      when "SM2"               then AK::CustomerMasterKeySpec::Sm2
      else
        nil
      end
    end
  end
end
