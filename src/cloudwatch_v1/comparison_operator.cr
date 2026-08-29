private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  enum ComparisonOperator
    GreaterThanOrEqualToThreshold
    GreaterThanThreshold
    LessThanThreshold
    LessThanOrEqualToThreshold
    LessThanLowerOrGreaterThanUpperThreshold
    LessThanLowerThreshold
    GreaterThanUpperThreshold

    def self.to_json(e : ComparisonOperator, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::ComparisonOperator
      value = pull.read_string
      case value
      when "GreaterThanOrEqualToThreshold"            then ACW::ComparisonOperator::GreaterThanOrEqualToThreshold
      when "GreaterThanThreshold"                     then ACW::ComparisonOperator::GreaterThanThreshold
      when "LessThanThreshold"                        then ACW::ComparisonOperator::LessThanThreshold
      when "LessThanOrEqualToThreshold"               then ACW::ComparisonOperator::LessThanOrEqualToThreshold
      when "LessThanLowerOrGreaterThanUpperThreshold" then ACW::ComparisonOperator::LessThanLowerOrGreaterThanUpperThreshold
      when "LessThanLowerThreshold"                   then ACW::ComparisonOperator::LessThanLowerThreshold
      when "GreaterThanUpperThreshold"                then ACW::ComparisonOperator::GreaterThanUpperThreshold
      else
        raise Exception.new("unknown enum value for 'ComparisonOperator' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACW::ComparisonOperator?
      case key
      when "GreaterThanOrEqualToThreshold"            then ACW::ComparisonOperator::GreaterThanOrEqualToThreshold
      when "GreaterThanThreshold"                     then ACW::ComparisonOperator::GreaterThanThreshold
      when "LessThanThreshold"                        then ACW::ComparisonOperator::LessThanThreshold
      when "LessThanOrEqualToThreshold"               then ACW::ComparisonOperator::LessThanOrEqualToThreshold
      when "LessThanLowerOrGreaterThanUpperThreshold" then ACW::ComparisonOperator::LessThanLowerOrGreaterThanUpperThreshold
      when "LessThanLowerThreshold"                   then ACW::ComparisonOperator::LessThanLowerThreshold
      when "GreaterThanUpperThreshold"                then ACW::ComparisonOperator::GreaterThanUpperThreshold
      else
        nil
      end
    end
  end
end
