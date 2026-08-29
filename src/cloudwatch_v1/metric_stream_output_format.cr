private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  enum MetricStreamOutputFormat
    Json
    Opentelemetry07
    Opentelemetry10

    def self.to_json(e : MetricStreamOutputFormat, json : JSON::Builder) : Nil
      value = case e
              when ACW::MetricStreamOutputFormat::Json            then "json"
              when ACW::MetricStreamOutputFormat::Opentelemetry07 then "opentelemetry0.7"
              when ACW::MetricStreamOutputFormat::Opentelemetry10 then "opentelemetry1.0"
              else
                raise Exception.new("unknown enum value for 'MetricStreamOutputFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::MetricStreamOutputFormat
      value = pull.read_string
      case value
      when "json"             then ACW::MetricStreamOutputFormat::Json
      when "opentelemetry0.7" then ACW::MetricStreamOutputFormat::Opentelemetry07
      when "opentelemetry1.0" then ACW::MetricStreamOutputFormat::Opentelemetry10
      else
        raise Exception.new("unknown enum value for 'MetricStreamOutputFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACW::MetricStreamOutputFormat::Json            then "json"
      when ACW::MetricStreamOutputFormat::Opentelemetry07 then "opentelemetry0.7"
      when ACW::MetricStreamOutputFormat::Opentelemetry10 then "opentelemetry1.0"
      else
        raise Exception.new("unknown enum value for 'MetricStreamOutputFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACW::MetricStreamOutputFormat?
      case key
      when "json"             then ACW::MetricStreamOutputFormat::Json
      when "opentelemetry0.7" then ACW::MetricStreamOutputFormat::Opentelemetry07
      when "opentelemetry1.0" then ACW::MetricStreamOutputFormat::Opentelemetry10
      else
        nil
      end
    end
  end
end
