private alias AS = Amazonite::S3

module Amazonite::S3
  enum BucketAbacStatus
    Enabled
    Disabled

    def self.to_json(e : BucketAbacStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::BucketAbacStatus
      value = pull.read_string
      case value
      when "Enabled"  then AS::BucketAbacStatus::Enabled
      when "Disabled" then AS::BucketAbacStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'BucketAbacStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::BucketAbacStatus?
      case key
      when "Enabled"  then AS::BucketAbacStatus::Enabled
      when "Disabled" then AS::BucketAbacStatus::Disabled
      else
        nil
      end
    end
  end
end
