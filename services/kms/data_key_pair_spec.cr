private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum DataKeyPairSpec
    Rsa2048
    Rsa3072
    Rsa4096
    EccNistP256
    EccNistP384
    EccNistP521
    EccSecgP256k1
    Sm2
    EccNistEdwards25519

    def self.to_json(e : DataKeyPairSpec, json : JSON::Builder) : Nil
      value = case e
              when AK::DataKeyPairSpec::Rsa2048             then "RSA_2048"
              when AK::DataKeyPairSpec::Rsa3072             then "RSA_3072"
              when AK::DataKeyPairSpec::Rsa4096             then "RSA_4096"
              when AK::DataKeyPairSpec::EccNistP256         then "ECC_NIST_P256"
              when AK::DataKeyPairSpec::EccNistP384         then "ECC_NIST_P384"
              when AK::DataKeyPairSpec::EccNistP521         then "ECC_NIST_P521"
              when AK::DataKeyPairSpec::EccSecgP256k1       then "ECC_SECG_P256K1"
              when AK::DataKeyPairSpec::Sm2                 then "SM2"
              when AK::DataKeyPairSpec::EccNistEdwards25519 then "ECC_NIST_EDWARDS25519"
              else
                raise Exception.new("unknown enum value for 'DataKeyPairSpec' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::DataKeyPairSpec
      value = pull.read_string
      case value
      when "RSA_2048"              then AK::DataKeyPairSpec::Rsa2048
      when "RSA_3072"              then AK::DataKeyPairSpec::Rsa3072
      when "RSA_4096"              then AK::DataKeyPairSpec::Rsa4096
      when "ECC_NIST_P256"         then AK::DataKeyPairSpec::EccNistP256
      when "ECC_NIST_P384"         then AK::DataKeyPairSpec::EccNistP384
      when "ECC_NIST_P521"         then AK::DataKeyPairSpec::EccNistP521
      when "ECC_SECG_P256K1"       then AK::DataKeyPairSpec::EccSecgP256k1
      when "SM2"                   then AK::DataKeyPairSpec::Sm2
      when "ECC_NIST_EDWARDS25519" then AK::DataKeyPairSpec::EccNistEdwards25519
      else
        raise Exception.new("unknown enum value for 'DataKeyPairSpec' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::DataKeyPairSpec::Rsa2048             then "RSA_2048"
      when AK::DataKeyPairSpec::Rsa3072             then "RSA_3072"
      when AK::DataKeyPairSpec::Rsa4096             then "RSA_4096"
      when AK::DataKeyPairSpec::EccNistP256         then "ECC_NIST_P256"
      when AK::DataKeyPairSpec::EccNistP384         then "ECC_NIST_P384"
      when AK::DataKeyPairSpec::EccNistP521         then "ECC_NIST_P521"
      when AK::DataKeyPairSpec::EccSecgP256k1       then "ECC_SECG_P256K1"
      when AK::DataKeyPairSpec::Sm2                 then "SM2"
      when AK::DataKeyPairSpec::EccNistEdwards25519 then "ECC_NIST_EDWARDS25519"
      else
        raise Exception.new("unknown enum value for 'DataKeyPairSpec' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::DataKeyPairSpec?
      case key
      when "RSA_2048"              then AK::DataKeyPairSpec::Rsa2048
      when "RSA_3072"              then AK::DataKeyPairSpec::Rsa3072
      when "RSA_4096"              then AK::DataKeyPairSpec::Rsa4096
      when "ECC_NIST_P256"         then AK::DataKeyPairSpec::EccNistP256
      when "ECC_NIST_P384"         then AK::DataKeyPairSpec::EccNistP384
      when "ECC_NIST_P521"         then AK::DataKeyPairSpec::EccNistP521
      when "ECC_SECG_P256K1"       then AK::DataKeyPairSpec::EccSecgP256k1
      when "SM2"                   then AK::DataKeyPairSpec::Sm2
      when "ECC_NIST_EDWARDS25519" then AK::DataKeyPairSpec::EccNistEdwards25519
      else
        nil
      end
    end
  end
end
