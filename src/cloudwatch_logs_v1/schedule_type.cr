private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum ScheduleType
    CustomerManaged
    AwsManaged

    def self.to_json(e : ScheduleType, json : JSON::Builder) : Nil
      value = case e
              when ACWL::ScheduleType::CustomerManaged then "CUSTOMER_MANAGED"
              when ACWL::ScheduleType::AwsManaged      then "AWS_MANAGED"
              else
                raise Exception.new("unknown enum value for 'ScheduleType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::ScheduleType
      value = pull.read_string
      case value
      when "CUSTOMER_MANAGED" then ACWL::ScheduleType::CustomerManaged
      when "AWS_MANAGED"      then ACWL::ScheduleType::AwsManaged
      else
        raise Exception.new("unknown enum value for 'ScheduleType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::ScheduleType::CustomerManaged then "CUSTOMER_MANAGED"
      when ACWL::ScheduleType::AwsManaged      then "AWS_MANAGED"
      else
        raise Exception.new("unknown enum value for 'ScheduleType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::ScheduleType?
      case key
      when "CUSTOMER_MANAGED" then ACWL::ScheduleType::CustomerManaged
      when "AWS_MANAGED"      then ACWL::ScheduleType::AwsManaged
      else
        nil
      end
    end
  end
end
