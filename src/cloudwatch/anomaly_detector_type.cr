private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  enum AnomalyDetectorType
    SingleMetric
    MetricMath

    def self.to_json(e : AnomalyDetectorType, json : JSON::Builder) : Nil
      value = case e
              when ACW::AnomalyDetectorType::SingleMetric then "SINGLE_METRIC"
              when ACW::AnomalyDetectorType::MetricMath   then "METRIC_MATH"
              else
                raise Exception.new("unknown enum value for 'AnomalyDetectorType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::AnomalyDetectorType
      value = pull.read_string
      case value
      when "SINGLE_METRIC" then ACW::AnomalyDetectorType::SingleMetric
      when "METRIC_MATH"   then ACW::AnomalyDetectorType::MetricMath
      else
        raise Exception.new("unknown enum value for 'AnomalyDetectorType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACW::AnomalyDetectorType::SingleMetric then "SINGLE_METRIC"
      when ACW::AnomalyDetectorType::MetricMath   then "METRIC_MATH"
      else
        raise Exception.new("unknown enum value for 'AnomalyDetectorType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACW::AnomalyDetectorType?
      case key
      when "SINGLE_METRIC" then ACW::AnomalyDetectorType::SingleMetric
      when "METRIC_MATH"   then ACW::AnomalyDetectorType::MetricMath
      else
        nil
      end
    end
  end
end
