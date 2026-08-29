private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum SigningAlgorithmSpec
    RsassaPssSha256
    RsassaPssSha384
    RsassaPssSha512
    RsassaPkcs1V15Sha256
    RsassaPkcs1V15Sha384
    RsassaPkcs1V15Sha512
    EcdsaSha256
    EcdsaSha384
    EcdsaSha512
    Sm2dsa
    MlDsaShake256
    Ed25519Sha512
    Ed25519PhSha512

    def self.to_json(e : SigningAlgorithmSpec, json : JSON::Builder) : Nil
      value = case e
              when AK::SigningAlgorithmSpec::RsassaPssSha256      then "RSASSA_PSS_SHA_256"
              when AK::SigningAlgorithmSpec::RsassaPssSha384      then "RSASSA_PSS_SHA_384"
              when AK::SigningAlgorithmSpec::RsassaPssSha512      then "RSASSA_PSS_SHA_512"
              when AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha256 then "RSASSA_PKCS1_V1_5_SHA_256"
              when AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha384 then "RSASSA_PKCS1_V1_5_SHA_384"
              when AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha512 then "RSASSA_PKCS1_V1_5_SHA_512"
              when AK::SigningAlgorithmSpec::EcdsaSha256          then "ECDSA_SHA_256"
              when AK::SigningAlgorithmSpec::EcdsaSha384          then "ECDSA_SHA_384"
              when AK::SigningAlgorithmSpec::EcdsaSha512          then "ECDSA_SHA_512"
              when AK::SigningAlgorithmSpec::Sm2dsa               then "SM2DSA"
              when AK::SigningAlgorithmSpec::MlDsaShake256        then "ML_DSA_SHAKE_256"
              when AK::SigningAlgorithmSpec::Ed25519Sha512        then "ED25519_SHA_512"
              when AK::SigningAlgorithmSpec::Ed25519PhSha512      then "ED25519_PH_SHA_512"
              else
                raise Exception.new("unknown enum value for 'SigningAlgorithmSpec' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::SigningAlgorithmSpec
      value = pull.read_string
      case value
      when "RSASSA_PSS_SHA_256"        then AK::SigningAlgorithmSpec::RsassaPssSha256
      when "RSASSA_PSS_SHA_384"        then AK::SigningAlgorithmSpec::RsassaPssSha384
      when "RSASSA_PSS_SHA_512"        then AK::SigningAlgorithmSpec::RsassaPssSha512
      when "RSASSA_PKCS1_V1_5_SHA_256" then AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha256
      when "RSASSA_PKCS1_V1_5_SHA_384" then AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha384
      when "RSASSA_PKCS1_V1_5_SHA_512" then AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha512
      when "ECDSA_SHA_256"             then AK::SigningAlgorithmSpec::EcdsaSha256
      when "ECDSA_SHA_384"             then AK::SigningAlgorithmSpec::EcdsaSha384
      when "ECDSA_SHA_512"             then AK::SigningAlgorithmSpec::EcdsaSha512
      when "SM2DSA"                    then AK::SigningAlgorithmSpec::Sm2dsa
      when "ML_DSA_SHAKE_256"          then AK::SigningAlgorithmSpec::MlDsaShake256
      when "ED25519_SHA_512"           then AK::SigningAlgorithmSpec::Ed25519Sha512
      when "ED25519_PH_SHA_512"        then AK::SigningAlgorithmSpec::Ed25519PhSha512
      else
        raise Exception.new("unknown enum value for 'SigningAlgorithmSpec' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::SigningAlgorithmSpec::RsassaPssSha256      then "RSASSA_PSS_SHA_256"
      when AK::SigningAlgorithmSpec::RsassaPssSha384      then "RSASSA_PSS_SHA_384"
      when AK::SigningAlgorithmSpec::RsassaPssSha512      then "RSASSA_PSS_SHA_512"
      when AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha256 then "RSASSA_PKCS1_V1_5_SHA_256"
      when AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha384 then "RSASSA_PKCS1_V1_5_SHA_384"
      when AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha512 then "RSASSA_PKCS1_V1_5_SHA_512"
      when AK::SigningAlgorithmSpec::EcdsaSha256          then "ECDSA_SHA_256"
      when AK::SigningAlgorithmSpec::EcdsaSha384          then "ECDSA_SHA_384"
      when AK::SigningAlgorithmSpec::EcdsaSha512          then "ECDSA_SHA_512"
      when AK::SigningAlgorithmSpec::Sm2dsa               then "SM2DSA"
      when AK::SigningAlgorithmSpec::MlDsaShake256        then "ML_DSA_SHAKE_256"
      when AK::SigningAlgorithmSpec::Ed25519Sha512        then "ED25519_SHA_512"
      when AK::SigningAlgorithmSpec::Ed25519PhSha512      then "ED25519_PH_SHA_512"
      else
        raise Exception.new("unknown enum value for 'SigningAlgorithmSpec' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::SigningAlgorithmSpec?
      case key
      when "RSASSA_PSS_SHA_256"        then AK::SigningAlgorithmSpec::RsassaPssSha256
      when "RSASSA_PSS_SHA_384"        then AK::SigningAlgorithmSpec::RsassaPssSha384
      when "RSASSA_PSS_SHA_512"        then AK::SigningAlgorithmSpec::RsassaPssSha512
      when "RSASSA_PKCS1_V1_5_SHA_256" then AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha256
      when "RSASSA_PKCS1_V1_5_SHA_384" then AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha384
      when "RSASSA_PKCS1_V1_5_SHA_512" then AK::SigningAlgorithmSpec::RsassaPkcs1V15Sha512
      when "ECDSA_SHA_256"             then AK::SigningAlgorithmSpec::EcdsaSha256
      when "ECDSA_SHA_384"             then AK::SigningAlgorithmSpec::EcdsaSha384
      when "ECDSA_SHA_512"             then AK::SigningAlgorithmSpec::EcdsaSha512
      when "SM2DSA"                    then AK::SigningAlgorithmSpec::Sm2dsa
      when "ML_DSA_SHAKE_256"          then AK::SigningAlgorithmSpec::MlDsaShake256
      when "ED25519_SHA_512"           then AK::SigningAlgorithmSpec::Ed25519Sha512
      when "ED25519_PH_SHA_512"        then AK::SigningAlgorithmSpec::Ed25519PhSha512
      else
        nil
      end
    end
  end
end
