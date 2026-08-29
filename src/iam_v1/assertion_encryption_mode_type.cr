private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum AssertionEncryptionModeType
    Required
    Allowed

    def self.to_json(e : AssertionEncryptionModeType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AI::AssertionEncryptionModeType
      value = pull.read_string
      case value
      when "Required" then AI::AssertionEncryptionModeType::Required
      when "Allowed"  then AI::AssertionEncryptionModeType::Allowed
      else
        raise Exception.new("unknown enum value for 'AssertionEncryptionModeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AI::AssertionEncryptionModeType?
      case key
      when "Required" then AI::AssertionEncryptionModeType::Required
      when "Allowed"  then AI::AssertionEncryptionModeType::Allowed
      else
        nil
      end
    end
  end
end
