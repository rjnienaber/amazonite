private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum SourceType
    AwsEc2Instance
    AwsIoTThing
    AwsSsmManagedInstance

    def self.to_json(e : SourceType, json : JSON::Builder) : Nil
      value = case e
              when AS::SourceType::AwsEc2Instance        then "AWS::EC2::Instance"
              when AS::SourceType::AwsIoTThing           then "AWS::IoT::Thing"
              when AS::SourceType::AwsSsmManagedInstance then "AWS::SSM::ManagedInstance"
              else
                raise Exception.new("unknown enum value for 'SourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::SourceType
      value = pull.read_string
      case value
      when "AWS::EC2::Instance"        then AS::SourceType::AwsEc2Instance
      when "AWS::IoT::Thing"           then AS::SourceType::AwsIoTThing
      when "AWS::SSM::ManagedInstance" then AS::SourceType::AwsSsmManagedInstance
      else
        raise Exception.new("unknown enum value for 'SourceType' when deserializing from json: '#{value}'")
      end
    end
  end
end
