private alias AS = Amazonite::S3

module Amazonite::S3
  enum EncryptionType
    None
    SseC

    def self.to_json(e : EncryptionType, json : JSON::Builder) : Nil
      value = case e
              when AS::EncryptionType::None then "NONE"
              when AS::EncryptionType::SseC then "SSE-C"
              else
                raise Exception.new("unknown enum value for 'EncryptionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::EncryptionType
      value = pull.read_string
      case value
      when "NONE"  then AS::EncryptionType::None
      when "SSE-C" then AS::EncryptionType::SseC
      else
        raise Exception.new("unknown enum value for 'EncryptionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::EncryptionType::None then "NONE"
      when AS::EncryptionType::SseC then "SSE-C"
      else
        raise Exception.new("unknown enum value for 'EncryptionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::EncryptionType?
      case key
      when "NONE"  then AS::EncryptionType::None
      when "SSE-C" then AS::EncryptionType::SseC
      else
        nil
      end
    end
  end
end
