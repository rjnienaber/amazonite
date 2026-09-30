private alias AEB = Amazonite::EventBridge

module Amazonite::EventBridge
  enum LaunchType
    Ec2
    Fargate
    External

    def self.to_json(e : LaunchType, json : JSON::Builder) : Nil
      value = case e
              when AEB::LaunchType::Ec2      then "EC2"
              when AEB::LaunchType::Fargate  then "FARGATE"
              when AEB::LaunchType::External then "EXTERNAL"
              else
                raise Exception.new("unknown enum value for 'LaunchType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::LaunchType
      value = pull.read_string
      case value
      when "EC2"      then AEB::LaunchType::Ec2
      when "FARGATE"  then AEB::LaunchType::Fargate
      when "EXTERNAL" then AEB::LaunchType::External
      else
        raise Exception.new("unknown enum value for 'LaunchType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::LaunchType::Ec2      then "EC2"
      when AEB::LaunchType::Fargate  then "FARGATE"
      when AEB::LaunchType::External then "EXTERNAL"
      else
        raise Exception.new("unknown enum value for 'LaunchType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::LaunchType?
      case key
      when "EC2"      then AEB::LaunchType::Ec2
      when "FARGATE"  then AEB::LaunchType::Fargate
      when "EXTERNAL" then AEB::LaunchType::External
      else
        nil
      end
    end
  end
end
