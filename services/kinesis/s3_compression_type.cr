private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum S3CompressionType
    None
    Gzip
    Zstd

    def self.to_json(e : S3CompressionType, json : JSON::Builder) : Nil
      value = case e
              when AK::S3CompressionType::None then "NONE"
              when AK::S3CompressionType::Gzip then "GZIP"
              when AK::S3CompressionType::Zstd then "ZSTD"
              else
                raise Exception.new("unknown enum value for 'S3CompressionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::S3CompressionType
      value = pull.read_string
      case value
      when "NONE" then AK::S3CompressionType::None
      when "GZIP" then AK::S3CompressionType::Gzip
      when "ZSTD" then AK::S3CompressionType::Zstd
      else
        raise Exception.new("unknown enum value for 'S3CompressionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::S3CompressionType::None then "NONE"
      when AK::S3CompressionType::Gzip then "GZIP"
      when AK::S3CompressionType::Zstd then "ZSTD"
      else
        raise Exception.new("unknown enum value for 'S3CompressionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::S3CompressionType?
      case key
      when "NONE" then AK::S3CompressionType::None
      when "GZIP" then AK::S3CompressionType::Gzip
      when "ZSTD" then AK::S3CompressionType::Zstd
      else
        nil
      end
    end
  end
end
