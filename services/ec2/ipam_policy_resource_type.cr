private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPolicyResourceType
    Alb
    Eip
    Rds
    Rnat
    LambdaNetworkConnector
    IgwFirewall

    def self.to_json(e : IpamPolicyResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPolicyResourceType::Alb                    then "alb"
              when AEC::IpamPolicyResourceType::Eip                    then "eip"
              when AEC::IpamPolicyResourceType::Rds                    then "rds"
              when AEC::IpamPolicyResourceType::Rnat                   then "rnat"
              when AEC::IpamPolicyResourceType::LambdaNetworkConnector then "lambda-network-connector"
              when AEC::IpamPolicyResourceType::IgwFirewall            then "igw-firewall"
              else
                raise Exception.new("unknown enum value for 'IpamPolicyResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPolicyResourceType
      value = pull.read_string
      case value
      when "alb"                      then AEC::IpamPolicyResourceType::Alb
      when "eip"                      then AEC::IpamPolicyResourceType::Eip
      when "rds"                      then AEC::IpamPolicyResourceType::Rds
      when "rnat"                     then AEC::IpamPolicyResourceType::Rnat
      when "lambda-network-connector" then AEC::IpamPolicyResourceType::LambdaNetworkConnector
      when "igw-firewall"             then AEC::IpamPolicyResourceType::IgwFirewall
      else
        raise Exception.new("unknown enum value for 'IpamPolicyResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPolicyResourceType::Alb                    then "alb"
      when AEC::IpamPolicyResourceType::Eip                    then "eip"
      when AEC::IpamPolicyResourceType::Rds                    then "rds"
      when AEC::IpamPolicyResourceType::Rnat                   then "rnat"
      when AEC::IpamPolicyResourceType::LambdaNetworkConnector then "lambda-network-connector"
      when AEC::IpamPolicyResourceType::IgwFirewall            then "igw-firewall"
      else
        raise Exception.new("unknown enum value for 'IpamPolicyResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPolicyResourceType?
      case key
      when "alb"                      then AEC::IpamPolicyResourceType::Alb
      when "eip"                      then AEC::IpamPolicyResourceType::Eip
      when "rds"                      then AEC::IpamPolicyResourceType::Rds
      when "rnat"                     then AEC::IpamPolicyResourceType::Rnat
      when "lambda-network-connector" then AEC::IpamPolicyResourceType::LambdaNetworkConnector
      when "igw-firewall"             then AEC::IpamPolicyResourceType::IgwFirewall
      else
        nil
      end
    end
  end
end
