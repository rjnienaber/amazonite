private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum ScheduledQueryState
    Enabled
    Disabled

    def self.to_json(e : ScheduledQueryState, json : JSON::Builder) : Nil
      value = case e
              when ACWL::ScheduledQueryState::Enabled  then "ENABLED"
              when ACWL::ScheduledQueryState::Disabled then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'ScheduledQueryState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::ScheduledQueryState
      value = pull.read_string
      case value
      when "ENABLED"  then ACWL::ScheduledQueryState::Enabled
      when "DISABLED" then ACWL::ScheduledQueryState::Disabled
      else
        raise Exception.new("unknown enum value for 'ScheduledQueryState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::ScheduledQueryState::Enabled  then "ENABLED"
      when ACWL::ScheduledQueryState::Disabled then "DISABLED"
      else
        raise Exception.new("unknown enum value for 'ScheduledQueryState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::ScheduledQueryState?
      case key
      when "ENABLED"  then ACWL::ScheduledQueryState::Enabled
      when "DISABLED" then ACWL::ScheduledQueryState::Disabled
      else
        nil
      end
    end
  end
end
