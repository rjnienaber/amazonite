private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum S3StorageClass
    Standard
    IntelligentTiering
    GlacierIr

    def self.to_json(e : S3StorageClass, json : JSON::Builder) : Nil
      value = case e
              when AK::S3StorageClass::Standard           then "STANDARD"
              when AK::S3StorageClass::IntelligentTiering then "INTELLIGENT_TIERING"
              when AK::S3StorageClass::GlacierIr          then "GLACIER_IR"
              else
                raise Exception.new("unknown enum value for 'S3StorageClass' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::S3StorageClass
      value = pull.read_string
      case value
      when "STANDARD"            then AK::S3StorageClass::Standard
      when "INTELLIGENT_TIERING" then AK::S3StorageClass::IntelligentTiering
      when "GLACIER_IR"          then AK::S3StorageClass::GlacierIr
      else
        raise Exception.new("unknown enum value for 'S3StorageClass' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::S3StorageClass::Standard           then "STANDARD"
      when AK::S3StorageClass::IntelligentTiering then "INTELLIGENT_TIERING"
      when AK::S3StorageClass::GlacierIr          then "GLACIER_IR"
      else
        raise Exception.new("unknown enum value for 'S3StorageClass' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::S3StorageClass?
      case key
      when "STANDARD"            then AK::S3StorageClass::Standard
      when "INTELLIGENT_TIERING" then AK::S3StorageClass::IntelligentTiering
      when "GLACIER_IR"          then AK::S3StorageClass::GlacierIr
      else
        nil
      end
    end
  end
end
