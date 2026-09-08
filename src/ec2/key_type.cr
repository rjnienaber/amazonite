private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum KeyType
    Rsa
    Ed25519

    def self.to_json(e : KeyType, json : JSON::Builder) : Nil
      value = case e
              when AEC::KeyType::Rsa     then "rsa"
              when AEC::KeyType::Ed25519 then "ed25519"
              else
                raise Exception.new("unknown enum value for 'KeyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::KeyType
      value = pull.read_string
      case value
      when "rsa"     then AEC::KeyType::Rsa
      when "ed25519" then AEC::KeyType::Ed25519
      else
        raise Exception.new("unknown enum value for 'KeyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::KeyType::Rsa     then "rsa"
      when AEC::KeyType::Ed25519 then "ed25519"
      else
        raise Exception.new("unknown enum value for 'KeyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::KeyType?
      case key
      when "rsa"     then AEC::KeyType::Rsa
      when "ed25519" then AEC::KeyType::Ed25519
      else
        nil
      end
    end
  end
end
