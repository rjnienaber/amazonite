private alias AS = Amazonite::S3

module Amazonite::S3
  enum BucketType
    Directory

    def self.to_json(e : BucketType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::BucketType
      value = pull.read_string
      case value
      when "Directory" then AS::BucketType::Directory
      else
        raise Exception.new("unknown enum value for 'BucketType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::BucketType?
      case key
      when "Directory" then AS::BucketType::Directory
      else
        nil
      end
    end
  end
end
