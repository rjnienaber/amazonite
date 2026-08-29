private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum KeySpec
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
    MlDsa44
    MlDsa65
    MlDsa87
    EccNistEdwards25519

    def self.to_json(e : KeySpec, json : JSON::Builder) : Nil
      value = case e
              when AK::KeySpec::Rsa2048             then "RSA_2048"
              when AK::KeySpec::Rsa3072             then "RSA_3072"
              when AK::KeySpec::Rsa4096             then "RSA_4096"
              when AK::KeySpec::EccNistP256         then "ECC_NIST_P256"
              when AK::KeySpec::EccNistP384         then "ECC_NIST_P384"
              when AK::KeySpec::EccNistP521         then "ECC_NIST_P521"
              when AK::KeySpec::EccSecgP256k1       then "ECC_SECG_P256K1"
              when AK::KeySpec::SymmetricDefault    then "SYMMETRIC_DEFAULT"
              when AK::KeySpec::Hmac224             then "HMAC_224"
              when AK::KeySpec::Hmac256             then "HMAC_256"
              when AK::KeySpec::Hmac384             then "HMAC_384"
              when AK::KeySpec::Hmac512             then "HMAC_512"
              when AK::KeySpec::Sm2                 then "SM2"
              when AK::KeySpec::MlDsa44             then "ML_DSA_44"
              when AK::KeySpec::MlDsa65             then "ML_DSA_65"
              when AK::KeySpec::MlDsa87             then "ML_DSA_87"
              when AK::KeySpec::EccNistEdwards25519 then "ECC_NIST_EDWARDS25519"
              else
                raise Exception.new("unknown enum value for 'KeySpec' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::KeySpec
      value = pull.read_string
      case value
      when "RSA_2048"              then AK::KeySpec::Rsa2048
      when "RSA_3072"              then AK::KeySpec::Rsa3072
      when "RSA_4096"              then AK::KeySpec::Rsa4096
      when "ECC_NIST_P256"         then AK::KeySpec::EccNistP256
      when "ECC_NIST_P384"         then AK::KeySpec::EccNistP384
      when "ECC_NIST_P521"         then AK::KeySpec::EccNistP521
      when "ECC_SECG_P256K1"       then AK::KeySpec::EccSecgP256k1
      when "SYMMETRIC_DEFAULT"     then AK::KeySpec::SymmetricDefault
      when "HMAC_224"              then AK::KeySpec::Hmac224
      when "HMAC_256"              then AK::KeySpec::Hmac256
      when "HMAC_384"              then AK::KeySpec::Hmac384
      when "HMAC_512"              then AK::KeySpec::Hmac512
      when "SM2"                   then AK::KeySpec::Sm2
      when "ML_DSA_44"             then AK::KeySpec::MlDsa44
      when "ML_DSA_65"             then AK::KeySpec::MlDsa65
      when "ML_DSA_87"             then AK::KeySpec::MlDsa87
      when "ECC_NIST_EDWARDS25519" then AK::KeySpec::EccNistEdwards25519
      else
        raise Exception.new("unknown enum value for 'KeySpec' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::KeySpec::Rsa2048             then "RSA_2048"
      when AK::KeySpec::Rsa3072             then "RSA_3072"
      when AK::KeySpec::Rsa4096             then "RSA_4096"
      when AK::KeySpec::EccNistP256         then "ECC_NIST_P256"
      when AK::KeySpec::EccNistP384         then "ECC_NIST_P384"
      when AK::KeySpec::EccNistP521         then "ECC_NIST_P521"
      when AK::KeySpec::EccSecgP256k1       then "ECC_SECG_P256K1"
      when AK::KeySpec::SymmetricDefault    then "SYMMETRIC_DEFAULT"
      when AK::KeySpec::Hmac224             then "HMAC_224"
      when AK::KeySpec::Hmac256             then "HMAC_256"
      when AK::KeySpec::Hmac384             then "HMAC_384"
      when AK::KeySpec::Hmac512             then "HMAC_512"
      when AK::KeySpec::Sm2                 then "SM2"
      when AK::KeySpec::MlDsa44             then "ML_DSA_44"
      when AK::KeySpec::MlDsa65             then "ML_DSA_65"
      when AK::KeySpec::MlDsa87             then "ML_DSA_87"
      when AK::KeySpec::EccNistEdwards25519 then "ECC_NIST_EDWARDS25519"
      else
        raise Exception.new("unknown enum value for 'KeySpec' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::KeySpec?
      case key
      when "RSA_2048"              then AK::KeySpec::Rsa2048
      when "RSA_3072"              then AK::KeySpec::Rsa3072
      when "RSA_4096"              then AK::KeySpec::Rsa4096
      when "ECC_NIST_P256"         then AK::KeySpec::EccNistP256
      when "ECC_NIST_P384"         then AK::KeySpec::EccNistP384
      when "ECC_NIST_P521"         then AK::KeySpec::EccNistP521
      when "ECC_SECG_P256K1"       then AK::KeySpec::EccSecgP256k1
      when "SYMMETRIC_DEFAULT"     then AK::KeySpec::SymmetricDefault
      when "HMAC_224"              then AK::KeySpec::Hmac224
      when "HMAC_256"              then AK::KeySpec::Hmac256
      when "HMAC_384"              then AK::KeySpec::Hmac384
      when "HMAC_512"              then AK::KeySpec::Hmac512
      when "SM2"                   then AK::KeySpec::Sm2
      when "ML_DSA_44"             then AK::KeySpec::MlDsa44
      when "ML_DSA_65"             then AK::KeySpec::MlDsa65
      when "ML_DSA_87"             then AK::KeySpec::MlDsa87
      when "ECC_NIST_EDWARDS25519" then AK::KeySpec::EccNistEdwards25519
      else
        nil
      end
    end
  end
end
