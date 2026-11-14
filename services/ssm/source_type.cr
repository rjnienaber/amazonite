private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum SourceType
    AwsEc2Instance
    AwsIoTThing
    AwsSsmManagedInstance
    MicrosoftComputeVirtualMachines
    ComputeGoogleapisComInstance

    def self.to_json(e : SourceType, json : JSON::Builder) : Nil
      value = case e
              when AS::SourceType::AwsEc2Instance                  then "AWS::EC2::Instance"
              when AS::SourceType::AwsIoTThing                     then "AWS::IoT::Thing"
              when AS::SourceType::AwsSsmManagedInstance           then "AWS::SSM::ManagedInstance"
              when AS::SourceType::MicrosoftComputeVirtualMachines then "Microsoft.Compute/virtualMachines"
              when AS::SourceType::ComputeGoogleapisComInstance    then "compute.googleapis.com/Instance"
              else
                raise Exception.new("unknown enum value for 'SourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::SourceType
      value = pull.read_string
      case value
      when "AWS::EC2::Instance"                then AS::SourceType::AwsEc2Instance
      when "AWS::IoT::Thing"                   then AS::SourceType::AwsIoTThing
      when "AWS::SSM::ManagedInstance"         then AS::SourceType::AwsSsmManagedInstance
      when "Microsoft.Compute/virtualMachines" then AS::SourceType::MicrosoftComputeVirtualMachines
      when "compute.googleapis.com/Instance"   then AS::SourceType::ComputeGoogleapisComInstance
      else
        raise Exception.new("unknown enum value for 'SourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::SourceType::AwsEc2Instance                  then "AWS::EC2::Instance"
      when AS::SourceType::AwsIoTThing                     then "AWS::IoT::Thing"
      when AS::SourceType::AwsSsmManagedInstance           then "AWS::SSM::ManagedInstance"
      when AS::SourceType::MicrosoftComputeVirtualMachines then "Microsoft.Compute/virtualMachines"
      when AS::SourceType::ComputeGoogleapisComInstance    then "compute.googleapis.com/Instance"
      else
        raise Exception.new("unknown enum value for 'SourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::SourceType?
      case key
      when "AWS::EC2::Instance"                then AS::SourceType::AwsEc2Instance
      when "AWS::IoT::Thing"                   then AS::SourceType::AwsIoTThing
      when "AWS::SSM::ManagedInstance"         then AS::SourceType::AwsSsmManagedInstance
      when "Microsoft.Compute/virtualMachines" then AS::SourceType::MicrosoftComputeVirtualMachines
      when "compute.googleapis.com/Instance"   then AS::SourceType::ComputeGoogleapisComInstance
      else
        nil
      end
    end
  end
end
