private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum InputCompressionType
    Gzip
    Zstd
    None

    def self.to_json(e : InputCompressionType, json : JSON::Builder) : Nil
      value = case e
              when ADDB::InputCompressionType::Gzip then "GZIP"
              when ADDB::InputCompressionType::Zstd then "ZSTD"
              when ADDB::InputCompressionType::None then "NONE"
              else
                raise Exception.new("unknown enum value for 'InputCompressionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::InputCompressionType
      value = pull.read_string
      case value
      when "GZIP" then ADDB::InputCompressionType::Gzip
      when "ZSTD" then ADDB::InputCompressionType::Zstd
      when "NONE" then ADDB::InputCompressionType::None
      else
        raise Exception.new("unknown enum value for 'InputCompressionType' when deserializing from json: '#{value}'")
      end
    end
  end
end
