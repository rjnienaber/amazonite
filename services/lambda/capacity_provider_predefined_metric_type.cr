private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum CapacityProviderPredefinedMetricType
    LambdaCapacityProviderAverageCpuUtilization
    LambdaCapacityProviderAverageGpuUtilization

    def self.to_json(e : CapacityProviderPredefinedMetricType, json : JSON::Builder) : Nil
      value = case e
              when AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageCpuUtilization then "LambdaCapacityProviderAverageCPUUtilization"
              when AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageGpuUtilization then "LambdaCapacityProviderAverageGPUUtilization"
              else
                raise Exception.new("unknown enum value for 'CapacityProviderPredefinedMetricType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::CapacityProviderPredefinedMetricType
      value = pull.read_string
      case value
      when "LambdaCapacityProviderAverageCPUUtilization" then AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageCpuUtilization
      when "LambdaCapacityProviderAverageGPUUtilization" then AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageGpuUtilization
      else
        raise Exception.new("unknown enum value for 'CapacityProviderPredefinedMetricType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageCpuUtilization then "LambdaCapacityProviderAverageCPUUtilization"
      when AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageGpuUtilization then "LambdaCapacityProviderAverageGPUUtilization"
      else
        raise Exception.new("unknown enum value for 'CapacityProviderPredefinedMetricType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::CapacityProviderPredefinedMetricType?
      case key
      when "LambdaCapacityProviderAverageCPUUtilization" then AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageCpuUtilization
      when "LambdaCapacityProviderAverageGPUUtilization" then AL::CapacityProviderPredefinedMetricType::LambdaCapacityProviderAverageGpuUtilization
      else
        nil
      end
    end
  end
end
