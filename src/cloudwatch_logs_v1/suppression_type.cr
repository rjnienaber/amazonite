private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum SuppressionType
    Limited
    Infinite

    def self.to_json(e : SuppressionType, json : JSON::Builder) : Nil
      value = case e
              when ACWL::SuppressionType::Limited  then "LIMITED"
              when ACWL::SuppressionType::Infinite then "INFINITE"
              else
                raise Exception.new("unknown enum value for 'SuppressionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::SuppressionType
      value = pull.read_string
      case value
      when "LIMITED"  then ACWL::SuppressionType::Limited
      when "INFINITE" then ACWL::SuppressionType::Infinite
      else
        raise Exception.new("unknown enum value for 'SuppressionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::SuppressionType::Limited  then "LIMITED"
      when ACWL::SuppressionType::Infinite then "INFINITE"
      else
        raise Exception.new("unknown enum value for 'SuppressionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::SuppressionType?
      case key
      when "LIMITED"  then ACWL::SuppressionType::Limited
      when "INFINITE" then ACWL::SuppressionType::Infinite
      else
        nil
      end
    end
  end
end
