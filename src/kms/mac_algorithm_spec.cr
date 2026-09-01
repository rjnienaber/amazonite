private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum MacAlgorithmSpec
    HmacSha224
    HmacSha256
    HmacSha384
    HmacSha512

    def self.to_json(e : MacAlgorithmSpec, json : JSON::Builder) : Nil
      value = case e
              when AK::MacAlgorithmSpec::HmacSha224 then "HMAC_SHA_224"
              when AK::MacAlgorithmSpec::HmacSha256 then "HMAC_SHA_256"
              when AK::MacAlgorithmSpec::HmacSha384 then "HMAC_SHA_384"
              when AK::MacAlgorithmSpec::HmacSha512 then "HMAC_SHA_512"
              else
                raise Exception.new("unknown enum value for 'MacAlgorithmSpec' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::MacAlgorithmSpec
      value = pull.read_string
      case value
      when "HMAC_SHA_224" then AK::MacAlgorithmSpec::HmacSha224
      when "HMAC_SHA_256" then AK::MacAlgorithmSpec::HmacSha256
      when "HMAC_SHA_384" then AK::MacAlgorithmSpec::HmacSha384
      when "HMAC_SHA_512" then AK::MacAlgorithmSpec::HmacSha512
      else
        raise Exception.new("unknown enum value for 'MacAlgorithmSpec' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::MacAlgorithmSpec::HmacSha224 then "HMAC_SHA_224"
      when AK::MacAlgorithmSpec::HmacSha256 then "HMAC_SHA_256"
      when AK::MacAlgorithmSpec::HmacSha384 then "HMAC_SHA_384"
      when AK::MacAlgorithmSpec::HmacSha512 then "HMAC_SHA_512"
      else
        raise Exception.new("unknown enum value for 'MacAlgorithmSpec' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::MacAlgorithmSpec?
      case key
      when "HMAC_SHA_224" then AK::MacAlgorithmSpec::HmacSha224
      when "HMAC_SHA_256" then AK::MacAlgorithmSpec::HmacSha256
      when "HMAC_SHA_384" then AK::MacAlgorithmSpec::HmacSha384
      when "HMAC_SHA_512" then AK::MacAlgorithmSpec::HmacSha512
      else
        nil
      end
    end
  end
end
