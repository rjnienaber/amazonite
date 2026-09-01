private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum EvaluationFrequency
    OneMin
    FiveMin
    TenMin
    FifteenMin
    ThirtyMin
    OneHour

    def self.to_json(e : EvaluationFrequency, json : JSON::Builder) : Nil
      value = case e
              when ACWL::EvaluationFrequency::OneMin     then "ONE_MIN"
              when ACWL::EvaluationFrequency::FiveMin    then "FIVE_MIN"
              when ACWL::EvaluationFrequency::TenMin     then "TEN_MIN"
              when ACWL::EvaluationFrequency::FifteenMin then "FIFTEEN_MIN"
              when ACWL::EvaluationFrequency::ThirtyMin  then "THIRTY_MIN"
              when ACWL::EvaluationFrequency::OneHour    then "ONE_HOUR"
              else
                raise Exception.new("unknown enum value for 'EvaluationFrequency' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::EvaluationFrequency
      value = pull.read_string
      case value
      when "ONE_MIN"     then ACWL::EvaluationFrequency::OneMin
      when "FIVE_MIN"    then ACWL::EvaluationFrequency::FiveMin
      when "TEN_MIN"     then ACWL::EvaluationFrequency::TenMin
      when "FIFTEEN_MIN" then ACWL::EvaluationFrequency::FifteenMin
      when "THIRTY_MIN"  then ACWL::EvaluationFrequency::ThirtyMin
      when "ONE_HOUR"    then ACWL::EvaluationFrequency::OneHour
      else
        raise Exception.new("unknown enum value for 'EvaluationFrequency' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::EvaluationFrequency::OneMin     then "ONE_MIN"
      when ACWL::EvaluationFrequency::FiveMin    then "FIVE_MIN"
      when ACWL::EvaluationFrequency::TenMin     then "TEN_MIN"
      when ACWL::EvaluationFrequency::FifteenMin then "FIFTEEN_MIN"
      when ACWL::EvaluationFrequency::ThirtyMin  then "THIRTY_MIN"
      when ACWL::EvaluationFrequency::OneHour    then "ONE_HOUR"
      else
        raise Exception.new("unknown enum value for 'EvaluationFrequency' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::EvaluationFrequency?
      case key
      when "ONE_MIN"     then ACWL::EvaluationFrequency::OneMin
      when "FIVE_MIN"    then ACWL::EvaluationFrequency::FiveMin
      when "TEN_MIN"     then ACWL::EvaluationFrequency::TenMin
      when "FIFTEEN_MIN" then ACWL::EvaluationFrequency::FifteenMin
      when "THIRTY_MIN"  then ACWL::EvaluationFrequency::ThirtyMin
      when "ONE_HOUR"    then ACWL::EvaluationFrequency::OneHour
      else
        nil
      end
    end
  end
end
