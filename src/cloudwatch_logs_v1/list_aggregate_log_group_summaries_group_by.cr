private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum ListAggregateLogGroupSummariesGroupBy
    DataSourceNameTypeAndFormat
    DataSourceNameAndType

    def self.to_json(e : ListAggregateLogGroupSummariesGroupBy, json : JSON::Builder) : Nil
      value = case e
              when ACWL::ListAggregateLogGroupSummariesGroupBy::DataSourceNameTypeAndFormat then "DATA_SOURCE_NAME_TYPE_AND_FORMAT"
              when ACWL::ListAggregateLogGroupSummariesGroupBy::DataSourceNameAndType       then "DATA_SOURCE_NAME_AND_TYPE"
              else
                raise Exception.new("unknown enum value for 'ListAggregateLogGroupSummariesGroupBy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::ListAggregateLogGroupSummariesGroupBy
      value = pull.read_string
      case value
      when "DATA_SOURCE_NAME_TYPE_AND_FORMAT" then ACWL::ListAggregateLogGroupSummariesGroupBy::DataSourceNameTypeAndFormat
      when "DATA_SOURCE_NAME_AND_TYPE"        then ACWL::ListAggregateLogGroupSummariesGroupBy::DataSourceNameAndType
      else
        raise Exception.new("unknown enum value for 'ListAggregateLogGroupSummariesGroupBy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::ListAggregateLogGroupSummariesGroupBy::DataSourceNameTypeAndFormat then "DATA_SOURCE_NAME_TYPE_AND_FORMAT"
      when ACWL::ListAggregateLogGroupSummariesGroupBy::DataSourceNameAndType       then "DATA_SOURCE_NAME_AND_TYPE"
      else
        raise Exception.new("unknown enum value for 'ListAggregateLogGroupSummariesGroupBy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::ListAggregateLogGroupSummariesGroupBy?
      case key
      when "DATA_SOURCE_NAME_TYPE_AND_FORMAT" then ACWL::ListAggregateLogGroupSummariesGroupBy::DataSourceNameTypeAndFormat
      when "DATA_SOURCE_NAME_AND_TYPE"        then ACWL::ListAggregateLogGroupSummariesGroupBy::DataSourceNameAndType
      else
        nil
      end
    end
  end
end
