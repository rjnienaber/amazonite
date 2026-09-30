private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
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

    def to_json_object_key : String
      case self
      when ADDB::InputCompressionType::Gzip then "GZIP"
      when ADDB::InputCompressionType::Zstd then "ZSTD"
      when ADDB::InputCompressionType::None then "NONE"
      else
        raise Exception.new("unknown enum value for 'InputCompressionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::InputCompressionType?
      case key
      when "GZIP" then ADDB::InputCompressionType::Gzip
      when "ZSTD" then ADDB::InputCompressionType::Zstd
      when "NONE" then ADDB::InputCompressionType::None
      else
        nil
      end
    end
  end
end
