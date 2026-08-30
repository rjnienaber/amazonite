private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum SuppressionUnit
    Seconds
    Minutes
    Hours

    def self.to_json(e : SuppressionUnit, json : JSON::Builder) : Nil
      value = case e
              when ACWL::SuppressionUnit::Seconds then "SECONDS"
              when ACWL::SuppressionUnit::Minutes then "MINUTES"
              when ACWL::SuppressionUnit::Hours   then "HOURS"
              else
                raise Exception.new("unknown enum value for 'SuppressionUnit' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::SuppressionUnit
      value = pull.read_string
      case value
      when "SECONDS" then ACWL::SuppressionUnit::Seconds
      when "MINUTES" then ACWL::SuppressionUnit::Minutes
      when "HOURS"   then ACWL::SuppressionUnit::Hours
      else
        raise Exception.new("unknown enum value for 'SuppressionUnit' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::SuppressionUnit::Seconds then "SECONDS"
      when ACWL::SuppressionUnit::Minutes then "MINUTES"
      when ACWL::SuppressionUnit::Hours   then "HOURS"
      else
        raise Exception.new("unknown enum value for 'SuppressionUnit' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::SuppressionUnit?
      case key
      when "SECONDS" then ACWL::SuppressionUnit::Seconds
      when "MINUTES" then ACWL::SuppressionUnit::Minutes
      when "HOURS"   then ACWL::SuppressionUnit::Hours
      else
        nil
      end
    end
  end
end
