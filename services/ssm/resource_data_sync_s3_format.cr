private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum ResourceDataSyncS3Format
    JsonSerDe

    def self.to_json(e : ResourceDataSyncS3Format, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ResourceDataSyncS3Format
      value = pull.read_string
      case value
      when "JsonSerDe" then AS::ResourceDataSyncS3Format::JsonSerDe
      else
        raise Exception.new("unknown enum value for 'ResourceDataSyncS3Format' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::ResourceDataSyncS3Format?
      case key
      when "JsonSerDe" then AS::ResourceDataSyncS3Format::JsonSerDe
      else
        nil
      end
    end
  end
end
