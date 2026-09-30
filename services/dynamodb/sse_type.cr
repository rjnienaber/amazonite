private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum SSEType
    Aes256
    Kms

    def self.to_json(e : SSEType, json : JSON::Builder) : Nil
      value = case e
              when ADDB::SSEType::Aes256 then "AES256"
              when ADDB::SSEType::Kms    then "KMS"
              else
                raise Exception.new("unknown enum value for 'SSEType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::SSEType
      value = pull.read_string
      case value
      when "AES256" then ADDB::SSEType::Aes256
      when "KMS"    then ADDB::SSEType::Kms
      else
        raise Exception.new("unknown enum value for 'SSEType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::SSEType::Aes256 then "AES256"
      when ADDB::SSEType::Kms    then "KMS"
      else
        raise Exception.new("unknown enum value for 'SSEType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::SSEType?
      case key
      when "AES256" then ADDB::SSEType::Aes256
      when "KMS"    then ADDB::SSEType::Kms
      else
        nil
      end
    end
  end
end
