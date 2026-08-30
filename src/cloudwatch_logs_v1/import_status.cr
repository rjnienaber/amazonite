private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum ImportStatus
    InProgress
    Cancelled
    Completed
    Failed

    def self.to_json(e : ImportStatus, json : JSON::Builder) : Nil
      value = case e
              when ACWL::ImportStatus::InProgress then "IN_PROGRESS"
              when ACWL::ImportStatus::Cancelled  then "CANCELLED"
              when ACWL::ImportStatus::Completed  then "COMPLETED"
              when ACWL::ImportStatus::Failed     then "FAILED"
              else
                raise Exception.new("unknown enum value for 'ImportStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::ImportStatus
      value = pull.read_string
      case value
      when "IN_PROGRESS" then ACWL::ImportStatus::InProgress
      when "CANCELLED"   then ACWL::ImportStatus::Cancelled
      when "COMPLETED"   then ACWL::ImportStatus::Completed
      when "FAILED"      then ACWL::ImportStatus::Failed
      else
        raise Exception.new("unknown enum value for 'ImportStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::ImportStatus::InProgress then "IN_PROGRESS"
      when ACWL::ImportStatus::Cancelled  then "CANCELLED"
      when ACWL::ImportStatus::Completed  then "COMPLETED"
      when ACWL::ImportStatus::Failed     then "FAILED"
      else
        raise Exception.new("unknown enum value for 'ImportStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::ImportStatus?
      case key
      when "IN_PROGRESS" then ACWL::ImportStatus::InProgress
      when "CANCELLED"   then ACWL::ImportStatus::Cancelled
      when "COMPLETED"   then ACWL::ImportStatus::Completed
      when "FAILED"      then ACWL::ImportStatus::Failed
      else
        nil
      end
    end
  end
end
