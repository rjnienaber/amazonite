private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NetworkInterfaceType
    Interface
    NatGateway
    Efa
    EfaOnly
    Trunk
    LoadBalancer
    NetworkLoadBalancer
    VpcEndpoint
    Branch
    TransitGateway
    Lambda
    Quicksight
    GlobalAcceleratorManaged
    ApiGatewayManaged
    GatewayLoadBalancer
    GatewayLoadBalancerEndpoint
    IotRulesManaged
    AwsCodestarConnectionsManaged

    def self.to_json(e : NetworkInterfaceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::NetworkInterfaceType::Interface                     then "interface"
              when AEC::NetworkInterfaceType::NatGateway                    then "natGateway"
              when AEC::NetworkInterfaceType::Efa                           then "efa"
              when AEC::NetworkInterfaceType::EfaOnly                       then "efa-only"
              when AEC::NetworkInterfaceType::Trunk                         then "trunk"
              when AEC::NetworkInterfaceType::LoadBalancer                  then "load_balancer"
              when AEC::NetworkInterfaceType::NetworkLoadBalancer           then "network_load_balancer"
              when AEC::NetworkInterfaceType::VpcEndpoint                   then "vpc_endpoint"
              when AEC::NetworkInterfaceType::Branch                        then "branch"
              when AEC::NetworkInterfaceType::TransitGateway                then "transit_gateway"
              when AEC::NetworkInterfaceType::Lambda                        then "lambda"
              when AEC::NetworkInterfaceType::Quicksight                    then "quicksight"
              when AEC::NetworkInterfaceType::GlobalAcceleratorManaged      then "global_accelerator_managed"
              when AEC::NetworkInterfaceType::ApiGatewayManaged             then "api_gateway_managed"
              when AEC::NetworkInterfaceType::GatewayLoadBalancer           then "gateway_load_balancer"
              when AEC::NetworkInterfaceType::GatewayLoadBalancerEndpoint   then "gateway_load_balancer_endpoint"
              when AEC::NetworkInterfaceType::IotRulesManaged               then "iot_rules_managed"
              when AEC::NetworkInterfaceType::AwsCodestarConnectionsManaged then "aws_codestar_connections_managed"
              else
                raise Exception.new("unknown enum value for 'NetworkInterfaceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NetworkInterfaceType
      value = pull.read_string
      case value
      when "interface"                        then AEC::NetworkInterfaceType::Interface
      when "natGateway"                       then AEC::NetworkInterfaceType::NatGateway
      when "efa"                              then AEC::NetworkInterfaceType::Efa
      when "efa-only"                         then AEC::NetworkInterfaceType::EfaOnly
      when "trunk"                            then AEC::NetworkInterfaceType::Trunk
      when "load_balancer"                    then AEC::NetworkInterfaceType::LoadBalancer
      when "network_load_balancer"            then AEC::NetworkInterfaceType::NetworkLoadBalancer
      when "vpc_endpoint"                     then AEC::NetworkInterfaceType::VpcEndpoint
      when "branch"                           then AEC::NetworkInterfaceType::Branch
      when "transit_gateway"                  then AEC::NetworkInterfaceType::TransitGateway
      when "lambda"                           then AEC::NetworkInterfaceType::Lambda
      when "quicksight"                       then AEC::NetworkInterfaceType::Quicksight
      when "global_accelerator_managed"       then AEC::NetworkInterfaceType::GlobalAcceleratorManaged
      when "api_gateway_managed"              then AEC::NetworkInterfaceType::ApiGatewayManaged
      when "gateway_load_balancer"            then AEC::NetworkInterfaceType::GatewayLoadBalancer
      when "gateway_load_balancer_endpoint"   then AEC::NetworkInterfaceType::GatewayLoadBalancerEndpoint
      when "iot_rules_managed"                then AEC::NetworkInterfaceType::IotRulesManaged
      when "aws_codestar_connections_managed" then AEC::NetworkInterfaceType::AwsCodestarConnectionsManaged
      else
        raise Exception.new("unknown enum value for 'NetworkInterfaceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NetworkInterfaceType::Interface                     then "interface"
      when AEC::NetworkInterfaceType::NatGateway                    then "natGateway"
      when AEC::NetworkInterfaceType::Efa                           then "efa"
      when AEC::NetworkInterfaceType::EfaOnly                       then "efa-only"
      when AEC::NetworkInterfaceType::Trunk                         then "trunk"
      when AEC::NetworkInterfaceType::LoadBalancer                  then "load_balancer"
      when AEC::NetworkInterfaceType::NetworkLoadBalancer           then "network_load_balancer"
      when AEC::NetworkInterfaceType::VpcEndpoint                   then "vpc_endpoint"
      when AEC::NetworkInterfaceType::Branch                        then "branch"
      when AEC::NetworkInterfaceType::TransitGateway                then "transit_gateway"
      when AEC::NetworkInterfaceType::Lambda                        then "lambda"
      when AEC::NetworkInterfaceType::Quicksight                    then "quicksight"
      when AEC::NetworkInterfaceType::GlobalAcceleratorManaged      then "global_accelerator_managed"
      when AEC::NetworkInterfaceType::ApiGatewayManaged             then "api_gateway_managed"
      when AEC::NetworkInterfaceType::GatewayLoadBalancer           then "gateway_load_balancer"
      when AEC::NetworkInterfaceType::GatewayLoadBalancerEndpoint   then "gateway_load_balancer_endpoint"
      when AEC::NetworkInterfaceType::IotRulesManaged               then "iot_rules_managed"
      when AEC::NetworkInterfaceType::AwsCodestarConnectionsManaged then "aws_codestar_connections_managed"
      else
        raise Exception.new("unknown enum value for 'NetworkInterfaceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NetworkInterfaceType?
      case key
      when "interface"                        then AEC::NetworkInterfaceType::Interface
      when "natGateway"                       then AEC::NetworkInterfaceType::NatGateway
      when "efa"                              then AEC::NetworkInterfaceType::Efa
      when "efa-only"                         then AEC::NetworkInterfaceType::EfaOnly
      when "trunk"                            then AEC::NetworkInterfaceType::Trunk
      when "load_balancer"                    then AEC::NetworkInterfaceType::LoadBalancer
      when "network_load_balancer"            then AEC::NetworkInterfaceType::NetworkLoadBalancer
      when "vpc_endpoint"                     then AEC::NetworkInterfaceType::VpcEndpoint
      when "branch"                           then AEC::NetworkInterfaceType::Branch
      when "transit_gateway"                  then AEC::NetworkInterfaceType::TransitGateway
      when "lambda"                           then AEC::NetworkInterfaceType::Lambda
      when "quicksight"                       then AEC::NetworkInterfaceType::Quicksight
      when "global_accelerator_managed"       then AEC::NetworkInterfaceType::GlobalAcceleratorManaged
      when "api_gateway_managed"              then AEC::NetworkInterfaceType::ApiGatewayManaged
      when "gateway_load_balancer"            then AEC::NetworkInterfaceType::GatewayLoadBalancer
      when "gateway_load_balancer_endpoint"   then AEC::NetworkInterfaceType::GatewayLoadBalancerEndpoint
      when "iot_rules_managed"                then AEC::NetworkInterfaceType::IotRulesManaged
      when "aws_codestar_connections_managed" then AEC::NetworkInterfaceType::AwsCodestarConnectionsManaged
      else
        nil
      end
    end
  end
end
