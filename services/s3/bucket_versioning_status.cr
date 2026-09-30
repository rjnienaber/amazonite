private alias AS = Amazonite::S3

module Amazonite::S3
  enum BucketVersioningStatus
    Enabled
    Suspended

    def self.to_json(e : BucketVersioningStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::BucketVersioningStatus
      value = pull.read_string
      case value
      when "Enabled"   then AS::BucketVersioningStatus::Enabled
      when "Suspended" then AS::BucketVersioningStatus::Suspended
      else
        raise Exception.new("unknown enum value for 'BucketVersioningStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::BucketVersioningStatus?
      case key
      when "Enabled"   then AS::BucketVersioningStatus::Enabled
      when "Suspended" then AS::BucketVersioningStatus::Suspended
      else
        nil
      end
    end
  end
end
