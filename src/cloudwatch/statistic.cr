private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  enum Statistic
    SampleCount
    Average
    Sum
    Minimum
    Maximum

    def self.to_json(e : Statistic, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::Statistic
      value = pull.read_string
      case value
      when "SampleCount" then ACW::Statistic::SampleCount
      when "Average"     then ACW::Statistic::Average
      when "Sum"         then ACW::Statistic::Sum
      when "Minimum"     then ACW::Statistic::Minimum
      when "Maximum"     then ACW::Statistic::Maximum
      else
        raise Exception.new("unknown enum value for 'Statistic' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACW::Statistic?
      case key
      when "SampleCount" then ACW::Statistic::SampleCount
      when "Average"     then ACW::Statistic::Average
      when "Sum"         then ACW::Statistic::Sum
      when "Minimum"     then ACW::Statistic::Minimum
      when "Maximum"     then ACW::Statistic::Maximum
      else
        nil
      end
    end
  end
end
