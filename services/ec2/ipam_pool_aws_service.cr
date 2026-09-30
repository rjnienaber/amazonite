private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPoolAwsService
    Ec2
    GlobalServices

    def self.to_json(e : IpamPoolAwsService, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPoolAwsService::Ec2            then "ec2"
              when AEC::IpamPoolAwsService::GlobalServices then "global-services"
              else
                raise Exception.new("unknown enum value for 'IpamPoolAwsService' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPoolAwsService
      value = pull.read_string
      case value
      when "ec2"             then AEC::IpamPoolAwsService::Ec2
      when "global-services" then AEC::IpamPoolAwsService::GlobalServices
      else
        raise Exception.new("unknown enum value for 'IpamPoolAwsService' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPoolAwsService::Ec2            then "ec2"
      when AEC::IpamPoolAwsService::GlobalServices then "global-services"
      else
        raise Exception.new("unknown enum value for 'IpamPoolAwsService' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPoolAwsService?
      case key
      when "ec2"             then AEC::IpamPoolAwsService::Ec2
      when "global-services" then AEC::IpamPoolAwsService::GlobalServices
      else
        nil
      end
    end
  end
end
