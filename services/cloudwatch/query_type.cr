private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  enum QueryType
    Promql
    Sql
    MetricMath

    def self.to_json(e : QueryType, json : JSON::Builder) : Nil
      value = case e
              when ACW::QueryType::Promql     then "PROMQL"
              when ACW::QueryType::Sql        then "SQL"
              when ACW::QueryType::MetricMath then "METRIC_MATH"
              else
                raise Exception.new("unknown enum value for 'QueryType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::QueryType
      value = pull.read_string
      case value
      when "PROMQL"      then ACW::QueryType::Promql
      when "SQL"         then ACW::QueryType::Sql
      when "METRIC_MATH" then ACW::QueryType::MetricMath
      else
        raise Exception.new("unknown enum value for 'QueryType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACW::QueryType::Promql     then "PROMQL"
      when ACW::QueryType::Sql        then "SQL"
      when ACW::QueryType::MetricMath then "METRIC_MATH"
      else
        raise Exception.new("unknown enum value for 'QueryType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACW::QueryType?
      case key
      when "PROMQL"      then ACW::QueryType::Promql
      when "SQL"         then ACW::QueryType::Sql
      when "METRIC_MATH" then ACW::QueryType::MetricMath
      else
        nil
      end
    end
  end
end
