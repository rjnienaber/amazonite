private alias AS = Amazonite::S3

module Amazonite::S3
  enum CompressionType
    None
    Gzip
    Bzip2

    def self.to_json(e : CompressionType, json : JSON::Builder) : Nil
      value = case e
              when AS::CompressionType::None  then "NONE"
              when AS::CompressionType::Gzip  then "GZIP"
              when AS::CompressionType::Bzip2 then "BZIP2"
              else
                raise Exception.new("unknown enum value for 'CompressionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::CompressionType
      value = pull.read_string
      case value
      when "NONE"  then AS::CompressionType::None
      when "GZIP"  then AS::CompressionType::Gzip
      when "BZIP2" then AS::CompressionType::Bzip2
      else
        raise Exception.new("unknown enum value for 'CompressionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::CompressionType::None  then "NONE"
      when AS::CompressionType::Gzip  then "GZIP"
      when AS::CompressionType::Bzip2 then "BZIP2"
      else
        raise Exception.new("unknown enum value for 'CompressionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::CompressionType?
      case key
      when "NONE"  then AS::CompressionType::None
      when "GZIP"  then AS::CompressionType::Gzip
      when "BZIP2" then AS::CompressionType::Bzip2
      else
        nil
      end
    end
  end
end
