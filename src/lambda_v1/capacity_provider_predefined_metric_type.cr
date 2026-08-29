private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum CapacityProviderPredefinedMetricType
    LambdaCapacityProviderAverageCpuUtilization

    def self.to_json(e : CapacityProviderPredefinedMetricType, json : JSON::Builder) : Nil
      value = case e
              when AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageCpuUtilization then "LambdaCapacityProviderAverageCPUUtilization"
              else
                raise Exception.new("unknown enum value for 'CapacityProviderPredefinedMetricType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::CapacityProviderPredefinedMetricType
      value = pull.read_string
      case value
      when "LambdaCapacityProviderAverageCPUUtilization" then AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageCpuUtilization
      else
        raise Exception.new("unknown enum value for 'CapacityProviderPredefinedMetricType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageCpuUtilization then "LambdaCapacityProviderAverageCPUUtilization"
      else
        raise Exception.new("unknown enum value for 'CapacityProviderPredefinedMetricType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::CapacityProviderPredefinedMetricType?
      case key
      when "LambdaCapacityProviderAverageCPUUtilization" then AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageCpuUtilization
      else
        nil
      end
    end
  end
end
