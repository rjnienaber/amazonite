private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
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
  end
end
