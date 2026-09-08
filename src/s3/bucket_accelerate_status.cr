private alias AS = Amazonite::S3

module Amazonite::S3
  enum BucketAccelerateStatus
    Enabled
    Suspended

    def self.to_json(e : BucketAccelerateStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::BucketAccelerateStatus
      value = pull.read_string
      case value
      when "Enabled"   then AS::BucketAccelerateStatus::Enabled
      when "Suspended" then AS::BucketAccelerateStatus::Suspended
      else
        raise Exception.new("unknown enum value for 'BucketAccelerateStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::BucketAccelerateStatus?
      case key
      when "Enabled"   then AS::BucketAccelerateStatus::Enabled
      when "Suspended" then AS::BucketAccelerateStatus::Suspended
      else
        nil
      end
    end
  end
end
