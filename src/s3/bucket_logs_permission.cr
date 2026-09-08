private alias AS = Amazonite::S3

module Amazonite::S3
  enum BucketLogsPermission
    FullControl
    Read
    Write

    def self.to_json(e : BucketLogsPermission, json : JSON::Builder) : Nil
      value = case e
              when AS::BucketLogsPermission::FullControl then "FULL_CONTROL"
              when AS::BucketLogsPermission::Read        then "READ"
              when AS::BucketLogsPermission::Write       then "WRITE"
              else
                raise Exception.new("unknown enum value for 'BucketLogsPermission' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::BucketLogsPermission
      value = pull.read_string
      case value
      when "FULL_CONTROL" then AS::BucketLogsPermission::FullControl
      when "READ"         then AS::BucketLogsPermission::Read
      when "WRITE"        then AS::BucketLogsPermission::Write
      else
        raise Exception.new("unknown enum value for 'BucketLogsPermission' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::BucketLogsPermission::FullControl then "FULL_CONTROL"
      when AS::BucketLogsPermission::Read        then "READ"
      when AS::BucketLogsPermission::Write       then "WRITE"
      else
        raise Exception.new("unknown enum value for 'BucketLogsPermission' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::BucketLogsPermission?
      case key
      when "FULL_CONTROL" then AS::BucketLogsPermission::FullControl
      when "READ"         then AS::BucketLogsPermission::Read
      when "WRITE"        then AS::BucketLogsPermission::Write
      else
        nil
      end
    end
  end
end
