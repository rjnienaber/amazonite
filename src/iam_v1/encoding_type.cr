private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum EncodingType
    Ssh
    Pem

    def self.to_json(e : EncodingType, json : JSON::Builder) : Nil
      value = case e
              when AI::EncodingType::Ssh then "SSH"
              when AI::EncodingType::Pem then "PEM"
              else
                raise Exception.new("unknown enum value for 'EncodingType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::EncodingType
      value = pull.read_string
      case value
      when "SSH" then AI::EncodingType::Ssh
      when "PEM" then AI::EncodingType::Pem
      else
        raise Exception.new("unknown enum value for 'EncodingType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::EncodingType::Ssh then "SSH"
      when AI::EncodingType::Pem then "PEM"
      else
        raise Exception.new("unknown enum value for 'EncodingType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::EncodingType?
      case key
      when "SSH" then AI::EncodingType::Ssh
      when "PEM" then AI::EncodingType::Pem
      else
        nil
      end
    end
  end
end
