private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum FunctionUrlAuthType
    None
    AwsIam

    def self.to_json(e : FunctionUrlAuthType, json : JSON::Builder) : Nil
      value = case e
              when AL::FunctionUrlAuthType::None   then "NONE"
              when AL::FunctionUrlAuthType::AwsIam then "AWS_IAM"
              else
                raise Exception.new("unknown enum value for 'FunctionUrlAuthType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::FunctionUrlAuthType
      value = pull.read_string
      case value
      when "NONE"    then AL::FunctionUrlAuthType::None
      when "AWS_IAM" then AL::FunctionUrlAuthType::AwsIam
      else
        raise Exception.new("unknown enum value for 'FunctionUrlAuthType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::FunctionUrlAuthType::None   then "NONE"
      when AL::FunctionUrlAuthType::AwsIam then "AWS_IAM"
      else
        raise Exception.new("unknown enum value for 'FunctionUrlAuthType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::FunctionUrlAuthType?
      case key
      when "NONE"    then AL::FunctionUrlAuthType::None
      when "AWS_IAM" then AL::FunctionUrlAuthType::AwsIam
      else
        nil
      end
    end
  end
end
