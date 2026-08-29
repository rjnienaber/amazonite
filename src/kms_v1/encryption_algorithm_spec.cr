private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum EncryptionAlgorithmSpec
    SymmetricDefault
    RsaesOaepSha1
    RsaesOaepSha256
    Sm2pke

    def self.to_json(e : EncryptionAlgorithmSpec, json : JSON::Builder) : Nil
      value = case e
              when AK::EncryptionAlgorithmSpec::SymmetricDefault then "SYMMETRIC_DEFAULT"
              when AK::EncryptionAlgorithmSpec::RsaesOaepSha1    then "RSAES_OAEP_SHA_1"
              when AK::EncryptionAlgorithmSpec::RsaesOaepSha256  then "RSAES_OAEP_SHA_256"
              when AK::EncryptionAlgorithmSpec::Sm2pke           then "SM2PKE"
              else
                raise Exception.new("unknown enum value for 'EncryptionAlgorithmSpec' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::EncryptionAlgorithmSpec
      value = pull.read_string
      case value
      when "SYMMETRIC_DEFAULT"  then AK::EncryptionAlgorithmSpec::SymmetricDefault
      when "RSAES_OAEP_SHA_1"   then AK::EncryptionAlgorithmSpec::RsaesOaepSha1
      when "RSAES_OAEP_SHA_256" then AK::EncryptionAlgorithmSpec::RsaesOaepSha256
      when "SM2PKE"             then AK::EncryptionAlgorithmSpec::Sm2pke
      else
        raise Exception.new("unknown enum value for 'EncryptionAlgorithmSpec' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::EncryptionAlgorithmSpec::SymmetricDefault then "SYMMETRIC_DEFAULT"
      when AK::EncryptionAlgorithmSpec::RsaesOaepSha1    then "RSAES_OAEP_SHA_1"
      when AK::EncryptionAlgorithmSpec::RsaesOaepSha256  then "RSAES_OAEP_SHA_256"
      when AK::EncryptionAlgorithmSpec::Sm2pke           then "SM2PKE"
      else
        raise Exception.new("unknown enum value for 'EncryptionAlgorithmSpec' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::EncryptionAlgorithmSpec?
      case key
      when "SYMMETRIC_DEFAULT"  then AK::EncryptionAlgorithmSpec::SymmetricDefault
      when "RSAES_OAEP_SHA_1"   then AK::EncryptionAlgorithmSpec::RsaesOaepSha1
      when "RSAES_OAEP_SHA_256" then AK::EncryptionAlgorithmSpec::RsaesOaepSha256
      when "SM2PKE"             then AK::EncryptionAlgorithmSpec::Sm2pke
      else
        nil
      end
    end
  end
end
