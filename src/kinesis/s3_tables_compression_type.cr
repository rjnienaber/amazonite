private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum S3TablesCompressionType
    None
    Zstd
    Snappy

    def self.to_json(e : S3TablesCompressionType, json : JSON::Builder) : Nil
      value = case e
              when AK::S3TablesCompressionType::None   then "NONE"
              when AK::S3TablesCompressionType::Zstd   then "ZSTD"
              when AK::S3TablesCompressionType::Snappy then "SNAPPY"
              else
                raise Exception.new("unknown enum value for 'S3TablesCompressionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::S3TablesCompressionType
      value = pull.read_string
      case value
      when "NONE"   then AK::S3TablesCompressionType::None
      when "ZSTD"   then AK::S3TablesCompressionType::Zstd
      when "SNAPPY" then AK::S3TablesCompressionType::Snappy
      else
        raise Exception.new("unknown enum value for 'S3TablesCompressionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::S3TablesCompressionType::None   then "NONE"
      when AK::S3TablesCompressionType::Zstd   then "ZSTD"
      when AK::S3TablesCompressionType::Snappy then "SNAPPY"
      else
        raise Exception.new("unknown enum value for 'S3TablesCompressionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::S3TablesCompressionType?
      case key
      when "NONE"   then AK::S3TablesCompressionType::None
      when "ZSTD"   then AK::S3TablesCompressionType::Zstd
      when "SNAPPY" then AK::S3TablesCompressionType::Snappy
      else
        nil
      end
    end
  end
end
