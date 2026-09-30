private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum AlgorithmSpec
    RsaesPkcs1V15
    RsaesOaepSha1
    RsaesOaepSha256
    RsaAesKeyWrapSha1
    RsaAesKeyWrapSha256
    Sm2pke

    def self.to_json(e : AlgorithmSpec, json : JSON::Builder) : Nil
      value = case e
              when AK::AlgorithmSpec::RsaesPkcs1V15       then "RSAES_PKCS1_V1_5"
              when AK::AlgorithmSpec::RsaesOaepSha1       then "RSAES_OAEP_SHA_1"
              when AK::AlgorithmSpec::RsaesOaepSha256     then "RSAES_OAEP_SHA_256"
              when AK::AlgorithmSpec::RsaAesKeyWrapSha1   then "RSA_AES_KEY_WRAP_SHA_1"
              when AK::AlgorithmSpec::RsaAesKeyWrapSha256 then "RSA_AES_KEY_WRAP_SHA_256"
              when AK::AlgorithmSpec::Sm2pke              then "SM2PKE"
              else
                raise Exception.new("unknown enum value for 'AlgorithmSpec' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::AlgorithmSpec
      value = pull.read_string
      case value
      when "RSAES_PKCS1_V1_5"         then AK::AlgorithmSpec::RsaesPkcs1V15
      when "RSAES_OAEP_SHA_1"         then AK::AlgorithmSpec::RsaesOaepSha1
      when "RSAES_OAEP_SHA_256"       then AK::AlgorithmSpec::RsaesOaepSha256
      when "RSA_AES_KEY_WRAP_SHA_1"   then AK::AlgorithmSpec::RsaAesKeyWrapSha1
      when "RSA_AES_KEY_WRAP_SHA_256" then AK::AlgorithmSpec::RsaAesKeyWrapSha256
      when "SM2PKE"                   then AK::AlgorithmSpec::Sm2pke
      else
        raise Exception.new("unknown enum value for 'AlgorithmSpec' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::AlgorithmSpec::RsaesPkcs1V15       then "RSAES_PKCS1_V1_5"
      when AK::AlgorithmSpec::RsaesOaepSha1       then "RSAES_OAEP_SHA_1"
      when AK::AlgorithmSpec::RsaesOaepSha256     then "RSAES_OAEP_SHA_256"
      when AK::AlgorithmSpec::RsaAesKeyWrapSha1   then "RSA_AES_KEY_WRAP_SHA_1"
      when AK::AlgorithmSpec::RsaAesKeyWrapSha256 then "RSA_AES_KEY_WRAP_SHA_256"
      when AK::AlgorithmSpec::Sm2pke              then "SM2PKE"
      else
        raise Exception.new("unknown enum value for 'AlgorithmSpec' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::AlgorithmSpec?
      case key
      when "RSAES_PKCS1_V1_5"         then AK::AlgorithmSpec::RsaesPkcs1V15
      when "RSAES_OAEP_SHA_1"         then AK::AlgorithmSpec::RsaesOaepSha1
      when "RSAES_OAEP_SHA_256"       then AK::AlgorithmSpec::RsaesOaepSha256
      when "RSA_AES_KEY_WRAP_SHA_1"   then AK::AlgorithmSpec::RsaAesKeyWrapSha1
      when "RSA_AES_KEY_WRAP_SHA_256" then AK::AlgorithmSpec::RsaAesKeyWrapSha256
      when "SM2PKE"                   then AK::AlgorithmSpec::Sm2pke
      else
        nil
      end
    end
  end
end
