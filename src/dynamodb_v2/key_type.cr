private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum KeyType
    Hash
    Range

    def self.to_json(e : KeyType, json : JSON::Builder) : Nil
      value = case e
              when ADDB::KeyType::Hash  then "HASH"
              when ADDB::KeyType::Range then "RANGE"
              else
                raise Exception.new("unknown enum value for 'KeyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::KeyType
      value = pull.read_string
      case value
      when "HASH"  then ADDB::KeyType::Hash
      when "RANGE" then ADDB::KeyType::Range
      else
        raise Exception.new("unknown enum value for 'KeyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::KeyType::Hash  then "HASH"
      when ADDB::KeyType::Range then "RANGE"
      else
        raise Exception.new("unknown enum value for 'KeyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::KeyType?
      case key
      when "HASH"  then ADDB::KeyType::Hash
      when "RANGE" then ADDB::KeyType::Range
      else
        nil
      end
    end
  end
end
