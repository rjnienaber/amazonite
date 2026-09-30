private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EkPubKeyType
    Rsa2048
    EccSecP384

    def self.to_json(e : EkPubKeyType, json : JSON::Builder) : Nil
      value = case e
              when AEC::EkPubKeyType::Rsa2048    then "rsa-2048"
              when AEC::EkPubKeyType::EccSecP384 then "ecc-sec-p384"
              else
                raise Exception.new("unknown enum value for 'EkPubKeyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EkPubKeyType
      value = pull.read_string
      case value
      when "rsa-2048"     then AEC::EkPubKeyType::Rsa2048
      when "ecc-sec-p384" then AEC::EkPubKeyType::EccSecP384
      else
        raise Exception.new("unknown enum value for 'EkPubKeyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EkPubKeyType::Rsa2048    then "rsa-2048"
      when AEC::EkPubKeyType::EccSecP384 then "ecc-sec-p384"
      else
        raise Exception.new("unknown enum value for 'EkPubKeyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EkPubKeyType?
      case key
      when "rsa-2048"     then AEC::EkPubKeyType::Rsa2048
      when "ecc-sec-p384" then AEC::EkPubKeyType::EccSecP384
      else
        nil
      end
    end
  end
end
