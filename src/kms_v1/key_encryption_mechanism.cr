private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum KeyEncryptionMechanism
    RsaesOaepSha256

    def self.to_json(e : KeyEncryptionMechanism, json : JSON::Builder) : Nil
      value = case e
              when AK::KeyEncryptionMechanism::RsaesOaepSha256 then "RSAES_OAEP_SHA_256"
              else
                raise Exception.new("unknown enum value for 'KeyEncryptionMechanism' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::KeyEncryptionMechanism
      value = pull.read_string
      case value
      when "RSAES_OAEP_SHA_256" then AK::KeyEncryptionMechanism::RsaesOaepSha256
      else
        raise Exception.new("unknown enum value for 'KeyEncryptionMechanism' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::KeyEncryptionMechanism::RsaesOaepSha256 then "RSAES_OAEP_SHA_256"
      else
        raise Exception.new("unknown enum value for 'KeyEncryptionMechanism' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::KeyEncryptionMechanism?
      case key
      when "RSAES_OAEP_SHA_256" then AK::KeyEncryptionMechanism::RsaesOaepSha256
      else
        nil
      end
    end
  end
end
