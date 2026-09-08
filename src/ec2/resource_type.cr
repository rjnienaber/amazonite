private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ResourceType
    CapacityReservation
    ClientVpnEndpoint
    CustomerGateway
    CarrierGateway
    CoipPool
    DeclarativePoliciesReport
    DedicatedHost
    DhcpOptions
    EgressOnlyInternetGateway
    ElasticIp
    ElasticGpu
    ExportImageTask
    ExportInstanceTask
    Fleet
    FpgaImage
    HostReservation
    Image
    ImageUsageReport
    ImportImageTask
    ImportSnapshotTask
    Instance
    InstanceEventWindow
    InternetGateway
    Ipam
    IpamPool
    IpamScope
    Ipv4poolEc2
    Ipv6poolEc2
    KeyPair
    LaunchTemplate
    LocalGateway
    LocalGatewayRouteTable
    LocalGatewayVirtualInterface
    LocalGatewayVirtualInterfaceGroup
    LocalGatewayRouteTableVpcAssociation
    LocalGatewayRouteTableVirtualInterfaceGroupAssociation
    Natgateway
    NetworkAcl
    NetworkInterface
    NetworkInsightsAnalysis
    NetworkInsightsPath
    NetworkInsightsAccessScope
    NetworkInsightsAccessScopeAnalysis
    OutpostLag
    PlacementGroup
    PrefixList
    ReplaceRootVolumeTask
    ReservedInstances
    RouteTable
    SecurityGroup
    SecurityGroupRule
    ServiceLinkVirtualInterface
    Snapshot
    SpotFleetRequest
    SpotInstancesRequest
    Subnet
    SubnetCidrReservation
    TrafficMirrorFilter
    TrafficMirrorSession
    TrafficMirrorTarget
    TransitGateway
    TransitGatewayAttachment
    TransitGatewayConnectPeer
    TransitGatewayMulticastDomain
    TransitGatewayPolicyTable
    TransitGatewayMeteringPolicy
    TransitGatewayRouteTable
    TransitGatewayRouteTableAnnouncement
    Volume
    Vpc
    VpcEndpoint
    VpcEndpointConnection
    VpcEndpointService
    VpcEndpointServicePermission
    VpcPeeringConnection
    VpnConnection
    VpnGateway
    VpcFlowLog
    CapacityReservationFleet
    TrafficMirrorFilterRule
    VpcEndpointConnectionDeviceType
    VerifiedAccessInstance
    VerifiedAccessGroup
    VerifiedAccessEndpoint
    VerifiedAccessPolicy
    VerifiedAccessTrustProvider
    VpnConnectionDeviceType
    VpcBlockPublicAccessExclusion
    VpcEncryptionControl
    RouteServer
    RouteServerEndpoint
    RouteServerPeer
    IpamResourceDiscovery
    IpamResourceDiscoveryAssociation
    InstanceConnectEndpoint
    VerifiedAccessEndpointTarget
    IpamExternalResourceVerificationToken
    CapacityBlock
    MacModificationTask
    IpamPrefixListResolver
    IpamPolicy
    IpamPrefixListResolverTarget
    IpamInternetRegistryAssociation
    SecondaryInterface
    SecondaryNetwork
    SecondarySubnet
    CapacityManagerDataExport
    VpnConcentrator
    IpamPoolAllocation
    CapacityReservationCancellationQuote
    ApplicationStatusCheck

    def self.to_json(e : ResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::ResourceType::CapacityReservation                                    then "capacity-reservation"
              when AEC::ResourceType::ClientVpnEndpoint                                      then "client-vpn-endpoint"
              when AEC::ResourceType::CustomerGateway                                        then "customer-gateway"
              when AEC::ResourceType::CarrierGateway                                         then "carrier-gateway"
              when AEC::ResourceType::CoipPool                                               then "coip-pool"
              when AEC::ResourceType::DeclarativePoliciesReport                              then "declarative-policies-report"
              when AEC::ResourceType::DedicatedHost                                          then "dedicated-host"
              when AEC::ResourceType::DhcpOptions                                            then "dhcp-options"
              when AEC::ResourceType::EgressOnlyInternetGateway                              then "egress-only-internet-gateway"
              when AEC::ResourceType::ElasticIp                                              then "elastic-ip"
              when AEC::ResourceType::ElasticGpu                                             then "elastic-gpu"
              when AEC::ResourceType::ExportImageTask                                        then "export-image-task"
              when AEC::ResourceType::ExportInstanceTask                                     then "export-instance-task"
              when AEC::ResourceType::Fleet                                                  then "fleet"
              when AEC::ResourceType::FpgaImage                                              then "fpga-image"
              when AEC::ResourceType::HostReservation                                        then "host-reservation"
              when AEC::ResourceType::Image                                                  then "image"
              when AEC::ResourceType::ImageUsageReport                                       then "image-usage-report"
              when AEC::ResourceType::ImportImageTask                                        then "import-image-task"
              when AEC::ResourceType::ImportSnapshotTask                                     then "import-snapshot-task"
              when AEC::ResourceType::Instance                                               then "instance"
              when AEC::ResourceType::InstanceEventWindow                                    then "instance-event-window"
              when AEC::ResourceType::InternetGateway                                        then "internet-gateway"
              when AEC::ResourceType::Ipam                                                   then "ipam"
              when AEC::ResourceType::IpamPool                                               then "ipam-pool"
              when AEC::ResourceType::IpamScope                                              then "ipam-scope"
              when AEC::ResourceType::Ipv4poolEc2                                            then "ipv4pool-ec2"
              when AEC::ResourceType::Ipv6poolEc2                                            then "ipv6pool-ec2"
              when AEC::ResourceType::KeyPair                                                then "key-pair"
              when AEC::ResourceType::LaunchTemplate                                         then "launch-template"
              when AEC::ResourceType::LocalGateway                                           then "local-gateway"
              when AEC::ResourceType::LocalGatewayRouteTable                                 then "local-gateway-route-table"
              when AEC::ResourceType::LocalGatewayVirtualInterface                           then "local-gateway-virtual-interface"
              when AEC::ResourceType::LocalGatewayVirtualInterfaceGroup                      then "local-gateway-virtual-interface-group"
              when AEC::ResourceType::LocalGatewayRouteTableVpcAssociation                   then "local-gateway-route-table-vpc-association"
              when AEC::ResourceType::LocalGatewayRouteTableVirtualInterfaceGroupAssociation then "local-gateway-route-table-virtual-interface-group-association"
              when AEC::ResourceType::Natgateway                                             then "natgateway"
              when AEC::ResourceType::NetworkAcl                                             then "network-acl"
              when AEC::ResourceType::NetworkInterface                                       then "network-interface"
              when AEC::ResourceType::NetworkInsightsAnalysis                                then "network-insights-analysis"
              when AEC::ResourceType::NetworkInsightsPath                                    then "network-insights-path"
              when AEC::ResourceType::NetworkInsightsAccessScope                             then "network-insights-access-scope"
              when AEC::ResourceType::NetworkInsightsAccessScopeAnalysis                     then "network-insights-access-scope-analysis"
              when AEC::ResourceType::OutpostLag                                             then "outpost-lag"
              when AEC::ResourceType::PlacementGroup                                         then "placement-group"
              when AEC::ResourceType::PrefixList                                             then "prefix-list"
              when AEC::ResourceType::ReplaceRootVolumeTask                                  then "replace-root-volume-task"
              when AEC::ResourceType::ReservedInstances                                      then "reserved-instances"
              when AEC::ResourceType::RouteTable                                             then "route-table"
              when AEC::ResourceType::SecurityGroup                                          then "security-group"
              when AEC::ResourceType::SecurityGroupRule                                      then "security-group-rule"
              when AEC::ResourceType::ServiceLinkVirtualInterface                            then "service-link-virtual-interface"
              when AEC::ResourceType::Snapshot                                               then "snapshot"
              when AEC::ResourceType::SpotFleetRequest                                       then "spot-fleet-request"
              when AEC::ResourceType::SpotInstancesRequest                                   then "spot-instances-request"
              when AEC::ResourceType::Subnet                                                 then "subnet"
              when AEC::ResourceType::SubnetCidrReservation                                  then "subnet-cidr-reservation"
              when AEC::ResourceType::TrafficMirrorFilter                                    then "traffic-mirror-filter"
              when AEC::ResourceType::TrafficMirrorSession                                   then "traffic-mirror-session"
              when AEC::ResourceType::TrafficMirrorTarget                                    then "traffic-mirror-target"
              when AEC::ResourceType::TransitGateway                                         then "transit-gateway"
              when AEC::ResourceType::TransitGatewayAttachment                               then "transit-gateway-attachment"
              when AEC::ResourceType::TransitGatewayConnectPeer                              then "transit-gateway-connect-peer"
              when AEC::ResourceType::TransitGatewayMulticastDomain                          then "transit-gateway-multicast-domain"
              when AEC::ResourceType::TransitGatewayPolicyTable                              then "transit-gateway-policy-table"
              when AEC::ResourceType::TransitGatewayMeteringPolicy                           then "transit-gateway-metering-policy"
              when AEC::ResourceType::TransitGatewayRouteTable                               then "transit-gateway-route-table"
              when AEC::ResourceType::TransitGatewayRouteTableAnnouncement                   then "transit-gateway-route-table-announcement"
              when AEC::ResourceType::Volume                                                 then "volume"
              when AEC::ResourceType::Vpc                                                    then "vpc"
              when AEC::ResourceType::VpcEndpoint                                            then "vpc-endpoint"
              when AEC::ResourceType::VpcEndpointConnection                                  then "vpc-endpoint-connection"
              when AEC::ResourceType::VpcEndpointService                                     then "vpc-endpoint-service"
              when AEC::ResourceType::VpcEndpointServicePermission                           then "vpc-endpoint-service-permission"
              when AEC::ResourceType::VpcPeeringConnection                                   then "vpc-peering-connection"
              when AEC::ResourceType::VpnConnection                                          then "vpn-connection"
              when AEC::ResourceType::VpnGateway                                             then "vpn-gateway"
              when AEC::ResourceType::VpcFlowLog                                             then "vpc-flow-log"
              when AEC::ResourceType::CapacityReservationFleet                               then "capacity-reservation-fleet"
              when AEC::ResourceType::TrafficMirrorFilterRule                                then "traffic-mirror-filter-rule"
              when AEC::ResourceType::VpcEndpointConnectionDeviceType                        then "vpc-endpoint-connection-device-type"
              when AEC::ResourceType::VerifiedAccessInstance                                 then "verified-access-instance"
              when AEC::ResourceType::VerifiedAccessGroup                                    then "verified-access-group"
              when AEC::ResourceType::VerifiedAccessEndpoint                                 then "verified-access-endpoint"
              when AEC::ResourceType::VerifiedAccessPolicy                                   then "verified-access-policy"
              when AEC::ResourceType::VerifiedAccessTrustProvider                            then "verified-access-trust-provider"
              when AEC::ResourceType::VpnConnectionDeviceType                                then "vpn-connection-device-type"
              when AEC::ResourceType::VpcBlockPublicAccessExclusion                          then "vpc-block-public-access-exclusion"
              when AEC::ResourceType::VpcEncryptionControl                                   then "vpc-encryption-control"
              when AEC::ResourceType::RouteServer                                            then "route-server"
              when AEC::ResourceType::RouteServerEndpoint                                    then "route-server-endpoint"
              when AEC::ResourceType::RouteServerPeer                                        then "route-server-peer"
              when AEC::ResourceType::IpamResourceDiscovery                                  then "ipam-resource-discovery"
              when AEC::ResourceType::IpamResourceDiscoveryAssociation                       then "ipam-resource-discovery-association"
              when AEC::ResourceType::InstanceConnectEndpoint                                then "instance-connect-endpoint"
              when AEC::ResourceType::VerifiedAccessEndpointTarget                           then "verified-access-endpoint-target"
              when AEC::ResourceType::IpamExternalResourceVerificationToken                  then "ipam-external-resource-verification-token"
              when AEC::ResourceType::CapacityBlock                                          then "capacity-block"
              when AEC::ResourceType::MacModificationTask                                    then "mac-modification-task"
              when AEC::ResourceType::IpamPrefixListResolver                                 then "ipam-prefix-list-resolver"
              when AEC::ResourceType::IpamPolicy                                             then "ipam-policy"
              when AEC::ResourceType::IpamPrefixListResolverTarget                           then "ipam-prefix-list-resolver-target"
              when AEC::ResourceType::IpamInternetRegistryAssociation                        then "ipam-internet-registry-association"
              when AEC::ResourceType::SecondaryInterface                                     then "secondary-interface"
              when AEC::ResourceType::SecondaryNetwork                                       then "secondary-network"
              when AEC::ResourceType::SecondarySubnet                                        then "secondary-subnet"
              when AEC::ResourceType::CapacityManagerDataExport                              then "capacity-manager-data-export"
              when AEC::ResourceType::VpnConcentrator                                        then "vpn-concentrator"
              when AEC::ResourceType::IpamPoolAllocation                                     then "ipam-pool-allocation"
              when AEC::ResourceType::CapacityReservationCancellationQuote                   then "capacity-reservation-cancellation-quote"
              when AEC::ResourceType::ApplicationStatusCheck                                 then "application-status-check"
              else
                raise Exception.new("unknown enum value for 'ResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ResourceType
      value = pull.read_string
      case value
      when "capacity-reservation"                                          then AEC::ResourceType::CapacityReservation
      when "client-vpn-endpoint"                                           then AEC::ResourceType::ClientVpnEndpoint
      when "customer-gateway"                                              then AEC::ResourceType::CustomerGateway
      when "carrier-gateway"                                               then AEC::ResourceType::CarrierGateway
      when "coip-pool"                                                     then AEC::ResourceType::CoipPool
      when "declarative-policies-report"                                   then AEC::ResourceType::DeclarativePoliciesReport
      when "dedicated-host"                                                then AEC::ResourceType::DedicatedHost
      when "dhcp-options"                                                  then AEC::ResourceType::DhcpOptions
      when "egress-only-internet-gateway"                                  then AEC::ResourceType::EgressOnlyInternetGateway
      when "elastic-ip"                                                    then AEC::ResourceType::ElasticIp
      when "elastic-gpu"                                                   then AEC::ResourceType::ElasticGpu
      when "export-image-task"                                             then AEC::ResourceType::ExportImageTask
      when "export-instance-task"                                          then AEC::ResourceType::ExportInstanceTask
      when "fleet"                                                         then AEC::ResourceType::Fleet
      when "fpga-image"                                                    then AEC::ResourceType::FpgaImage
      when "host-reservation"                                              then AEC::ResourceType::HostReservation
      when "image"                                                         then AEC::ResourceType::Image
      when "image-usage-report"                                            then AEC::ResourceType::ImageUsageReport
      when "import-image-task"                                             then AEC::ResourceType::ImportImageTask
      when "import-snapshot-task"                                          then AEC::ResourceType::ImportSnapshotTask
      when "instance"                                                      then AEC::ResourceType::Instance
      when "instance-event-window"                                         then AEC::ResourceType::InstanceEventWindow
      when "internet-gateway"                                              then AEC::ResourceType::InternetGateway
      when "ipam"                                                          then AEC::ResourceType::Ipam
      when "ipam-pool"                                                     then AEC::ResourceType::IpamPool
      when "ipam-scope"                                                    then AEC::ResourceType::IpamScope
      when "ipv4pool-ec2"                                                  then AEC::ResourceType::Ipv4poolEc2
      when "ipv6pool-ec2"                                                  then AEC::ResourceType::Ipv6poolEc2
      when "key-pair"                                                      then AEC::ResourceType::KeyPair
      when "launch-template"                                               then AEC::ResourceType::LaunchTemplate
      when "local-gateway"                                                 then AEC::ResourceType::LocalGateway
      when "local-gateway-route-table"                                     then AEC::ResourceType::LocalGatewayRouteTable
      when "local-gateway-virtual-interface"                               then AEC::ResourceType::LocalGatewayVirtualInterface
      when "local-gateway-virtual-interface-group"                         then AEC::ResourceType::LocalGatewayVirtualInterfaceGroup
      when "local-gateway-route-table-vpc-association"                     then AEC::ResourceType::LocalGatewayRouteTableVpcAssociation
      when "local-gateway-route-table-virtual-interface-group-association" then AEC::ResourceType::LocalGatewayRouteTableVirtualInterfaceGroupAssociation
      when "natgateway"                                                    then AEC::ResourceType::Natgateway
      when "network-acl"                                                   then AEC::ResourceType::NetworkAcl
      when "network-interface"                                             then AEC::ResourceType::NetworkInterface
      when "network-insights-analysis"                                     then AEC::ResourceType::NetworkInsightsAnalysis
      when "network-insights-path"                                         then AEC::ResourceType::NetworkInsightsPath
      when "network-insights-access-scope"                                 then AEC::ResourceType::NetworkInsightsAccessScope
      when "network-insights-access-scope-analysis"                        then AEC::ResourceType::NetworkInsightsAccessScopeAnalysis
      when "outpost-lag"                                                   then AEC::ResourceType::OutpostLag
      when "placement-group"                                               then AEC::ResourceType::PlacementGroup
      when "prefix-list"                                                   then AEC::ResourceType::PrefixList
      when "replace-root-volume-task"                                      then AEC::ResourceType::ReplaceRootVolumeTask
      when "reserved-instances"                                            then AEC::ResourceType::ReservedInstances
      when "route-table"                                                   then AEC::ResourceType::RouteTable
      when "security-group"                                                then AEC::ResourceType::SecurityGroup
      when "security-group-rule"                                           then AEC::ResourceType::SecurityGroupRule
      when "service-link-virtual-interface"                                then AEC::ResourceType::ServiceLinkVirtualInterface
      when "snapshot"                                                      then AEC::ResourceType::Snapshot
      when "spot-fleet-request"                                            then AEC::ResourceType::SpotFleetRequest
      when "spot-instances-request"                                        then AEC::ResourceType::SpotInstancesRequest
      when "subnet"                                                        then AEC::ResourceType::Subnet
      when "subnet-cidr-reservation"                                       then AEC::ResourceType::SubnetCidrReservation
      when "traffic-mirror-filter"                                         then AEC::ResourceType::TrafficMirrorFilter
      when "traffic-mirror-session"                                        then AEC::ResourceType::TrafficMirrorSession
      when "traffic-mirror-target"                                         then AEC::ResourceType::TrafficMirrorTarget
      when "transit-gateway"                                               then AEC::ResourceType::TransitGateway
      when "transit-gateway-attachment"                                    then AEC::ResourceType::TransitGatewayAttachment
      when "transit-gateway-connect-peer"                                  then AEC::ResourceType::TransitGatewayConnectPeer
      when "transit-gateway-multicast-domain"                              then AEC::ResourceType::TransitGatewayMulticastDomain
      when "transit-gateway-policy-table"                                  then AEC::ResourceType::TransitGatewayPolicyTable
      when "transit-gateway-metering-policy"                               then AEC::ResourceType::TransitGatewayMeteringPolicy
      when "transit-gateway-route-table"                                   then AEC::ResourceType::TransitGatewayRouteTable
      when "transit-gateway-route-table-announcement"                      then AEC::ResourceType::TransitGatewayRouteTableAnnouncement
      when "volume"                                                        then AEC::ResourceType::Volume
      when "vpc"                                                           then AEC::ResourceType::Vpc
      when "vpc-endpoint"                                                  then AEC::ResourceType::VpcEndpoint
      when "vpc-endpoint-connection"                                       then AEC::ResourceType::VpcEndpointConnection
      when "vpc-endpoint-service"                                          then AEC::ResourceType::VpcEndpointService
      when "vpc-endpoint-service-permission"                               then AEC::ResourceType::VpcEndpointServicePermission
      when "vpc-peering-connection"                                        then AEC::ResourceType::VpcPeeringConnection
      when "vpn-connection"                                                then AEC::ResourceType::VpnConnection
      when "vpn-gateway"                                                   then AEC::ResourceType::VpnGateway
      when "vpc-flow-log"                                                  then AEC::ResourceType::VpcFlowLog
      when "capacity-reservation-fleet"                                    then AEC::ResourceType::CapacityReservationFleet
      when "traffic-mirror-filter-rule"                                    then AEC::ResourceType::TrafficMirrorFilterRule
      when "vpc-endpoint-connection-device-type"                           then AEC::ResourceType::VpcEndpointConnectionDeviceType
      when "verified-access-instance"                                      then AEC::ResourceType::VerifiedAccessInstance
      when "verified-access-group"                                         then AEC::ResourceType::VerifiedAccessGroup
      when "verified-access-endpoint"                                      then AEC::ResourceType::VerifiedAccessEndpoint
      when "verified-access-policy"                                        then AEC::ResourceType::VerifiedAccessPolicy
      when "verified-access-trust-provider"                                then AEC::ResourceType::VerifiedAccessTrustProvider
      when "vpn-connection-device-type"                                    then AEC::ResourceType::VpnConnectionDeviceType
      when "vpc-block-public-access-exclusion"                             then AEC::ResourceType::VpcBlockPublicAccessExclusion
      when "vpc-encryption-control"                                        then AEC::ResourceType::VpcEncryptionControl
      when "route-server"                                                  then AEC::ResourceType::RouteServer
      when "route-server-endpoint"                                         then AEC::ResourceType::RouteServerEndpoint
      when "route-server-peer"                                             then AEC::ResourceType::RouteServerPeer
      when "ipam-resource-discovery"                                       then AEC::ResourceType::IpamResourceDiscovery
      when "ipam-resource-discovery-association"                           then AEC::ResourceType::IpamResourceDiscoveryAssociation
      when "instance-connect-endpoint"                                     then AEC::ResourceType::InstanceConnectEndpoint
      when "verified-access-endpoint-target"                               then AEC::ResourceType::VerifiedAccessEndpointTarget
      when "ipam-external-resource-verification-token"                     then AEC::ResourceType::IpamExternalResourceVerificationToken
      when "capacity-block"                                                then AEC::ResourceType::CapacityBlock
      when "mac-modification-task"                                         then AEC::ResourceType::MacModificationTask
      when "ipam-prefix-list-resolver"                                     then AEC::ResourceType::IpamPrefixListResolver
      when "ipam-policy"                                                   then AEC::ResourceType::IpamPolicy
      when "ipam-prefix-list-resolver-target"                              then AEC::ResourceType::IpamPrefixListResolverTarget
      when "ipam-internet-registry-association"                            then AEC::ResourceType::IpamInternetRegistryAssociation
      when "secondary-interface"                                           then AEC::ResourceType::SecondaryInterface
      when "secondary-network"                                             then AEC::ResourceType::SecondaryNetwork
      when "secondary-subnet"                                              then AEC::ResourceType::SecondarySubnet
      when "capacity-manager-data-export"                                  then AEC::ResourceType::CapacityManagerDataExport
      when "vpn-concentrator"                                              then AEC::ResourceType::VpnConcentrator
      when "ipam-pool-allocation"                                          then AEC::ResourceType::IpamPoolAllocation
      when "capacity-reservation-cancellation-quote"                       then AEC::ResourceType::CapacityReservationCancellationQuote
      when "application-status-check"                                      then AEC::ResourceType::ApplicationStatusCheck
      else
        raise Exception.new("unknown enum value for 'ResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ResourceType::CapacityReservation                                    then "capacity-reservation"
      when AEC::ResourceType::ClientVpnEndpoint                                      then "client-vpn-endpoint"
      when AEC::ResourceType::CustomerGateway                                        then "customer-gateway"
      when AEC::ResourceType::CarrierGateway                                         then "carrier-gateway"
      when AEC::ResourceType::CoipPool                                               then "coip-pool"
      when AEC::ResourceType::DeclarativePoliciesReport                              then "declarative-policies-report"
      when AEC::ResourceType::DedicatedHost                                          then "dedicated-host"
      when AEC::ResourceType::DhcpOptions                                            then "dhcp-options"
      when AEC::ResourceType::EgressOnlyInternetGateway                              then "egress-only-internet-gateway"
      when AEC::ResourceType::ElasticIp                                              then "elastic-ip"
      when AEC::ResourceType::ElasticGpu                                             then "elastic-gpu"
      when AEC::ResourceType::ExportImageTask                                        then "export-image-task"
      when AEC::ResourceType::ExportInstanceTask                                     then "export-instance-task"
      when AEC::ResourceType::Fleet                                                  then "fleet"
      when AEC::ResourceType::FpgaImage                                              then "fpga-image"
      when AEC::ResourceType::HostReservation                                        then "host-reservation"
      when AEC::ResourceType::Image                                                  then "image"
      when AEC::ResourceType::ImageUsageReport                                       then "image-usage-report"
      when AEC::ResourceType::ImportImageTask                                        then "import-image-task"
      when AEC::ResourceType::ImportSnapshotTask                                     then "import-snapshot-task"
      when AEC::ResourceType::Instance                                               then "instance"
      when AEC::ResourceType::InstanceEventWindow                                    then "instance-event-window"
      when AEC::ResourceType::InternetGateway                                        then "internet-gateway"
      when AEC::ResourceType::Ipam                                                   then "ipam"
      when AEC::ResourceType::IpamPool                                               then "ipam-pool"
      when AEC::ResourceType::IpamScope                                              then "ipam-scope"
      when AEC::ResourceType::Ipv4poolEc2                                            then "ipv4pool-ec2"
      when AEC::ResourceType::Ipv6poolEc2                                            then "ipv6pool-ec2"
      when AEC::ResourceType::KeyPair                                                then "key-pair"
      when AEC::ResourceType::LaunchTemplate                                         then "launch-template"
      when AEC::ResourceType::LocalGateway                                           then "local-gateway"
      when AEC::ResourceType::LocalGatewayRouteTable                                 then "local-gateway-route-table"
      when AEC::ResourceType::LocalGatewayVirtualInterface                           then "local-gateway-virtual-interface"
      when AEC::ResourceType::LocalGatewayVirtualInterfaceGroup                      then "local-gateway-virtual-interface-group"
      when AEC::ResourceType::LocalGatewayRouteTableVpcAssociation                   then "local-gateway-route-table-vpc-association"
      when AEC::ResourceType::LocalGatewayRouteTableVirtualInterfaceGroupAssociation then "local-gateway-route-table-virtual-interface-group-association"
      when AEC::ResourceType::Natgateway                                             then "natgateway"
      when AEC::ResourceType::NetworkAcl                                             then "network-acl"
      when AEC::ResourceType::NetworkInterface                                       then "network-interface"
      when AEC::ResourceType::NetworkInsightsAnalysis                                then "network-insights-analysis"
      when AEC::ResourceType::NetworkInsightsPath                                    then "network-insights-path"
      when AEC::ResourceType::NetworkInsightsAccessScope                             then "network-insights-access-scope"
      when AEC::ResourceType::NetworkInsightsAccessScopeAnalysis                     then "network-insights-access-scope-analysis"
      when AEC::ResourceType::OutpostLag                                             then "outpost-lag"
      when AEC::ResourceType::PlacementGroup                                         then "placement-group"
      when AEC::ResourceType::PrefixList                                             then "prefix-list"
      when AEC::ResourceType::ReplaceRootVolumeTask                                  then "replace-root-volume-task"
      when AEC::ResourceType::ReservedInstances                                      then "reserved-instances"
      when AEC::ResourceType::RouteTable                                             then "route-table"
      when AEC::ResourceType::SecurityGroup                                          then "security-group"
      when AEC::ResourceType::SecurityGroupRule                                      then "security-group-rule"
      when AEC::ResourceType::ServiceLinkVirtualInterface                            then "service-link-virtual-interface"
      when AEC::ResourceType::Snapshot                                               then "snapshot"
      when AEC::ResourceType::SpotFleetRequest                                       then "spot-fleet-request"
      when AEC::ResourceType::SpotInstancesRequest                                   then "spot-instances-request"
      when AEC::ResourceType::Subnet                                                 then "subnet"
      when AEC::ResourceType::SubnetCidrReservation                                  then "subnet-cidr-reservation"
      when AEC::ResourceType::TrafficMirrorFilter                                    then "traffic-mirror-filter"
      when AEC::ResourceType::TrafficMirrorSession                                   then "traffic-mirror-session"
      when AEC::ResourceType::TrafficMirrorTarget                                    then "traffic-mirror-target"
      when AEC::ResourceType::TransitGateway                                         then "transit-gateway"
      when AEC::ResourceType::TransitGatewayAttachment                               then "transit-gateway-attachment"
      when AEC::ResourceType::TransitGatewayConnectPeer                              then "transit-gateway-connect-peer"
      when AEC::ResourceType::TransitGatewayMulticastDomain                          then "transit-gateway-multicast-domain"
      when AEC::ResourceType::TransitGatewayPolicyTable                              then "transit-gateway-policy-table"
      when AEC::ResourceType::TransitGatewayMeteringPolicy                           then "transit-gateway-metering-policy"
      when AEC::ResourceType::TransitGatewayRouteTable                               then "transit-gateway-route-table"
      when AEC::ResourceType::TransitGatewayRouteTableAnnouncement                   then "transit-gateway-route-table-announcement"
      when AEC::ResourceType::Volume                                                 then "volume"
      when AEC::ResourceType::Vpc                                                    then "vpc"
      when AEC::ResourceType::VpcEndpoint                                            then "vpc-endpoint"
      when AEC::ResourceType::VpcEndpointConnection                                  then "vpc-endpoint-connection"
      when AEC::ResourceType::VpcEndpointService                                     then "vpc-endpoint-service"
      when AEC::ResourceType::VpcEndpointServicePermission                           then "vpc-endpoint-service-permission"
      when AEC::ResourceType::VpcPeeringConnection                                   then "vpc-peering-connection"
      when AEC::ResourceType::VpnConnection                                          then "vpn-connection"
      when AEC::ResourceType::VpnGateway                                             then "vpn-gateway"
      when AEC::ResourceType::VpcFlowLog                                             then "vpc-flow-log"
      when AEC::ResourceType::CapacityReservationFleet                               then "capacity-reservation-fleet"
      when AEC::ResourceType::TrafficMirrorFilterRule                                then "traffic-mirror-filter-rule"
      when AEC::ResourceType::VpcEndpointConnectionDeviceType                        then "vpc-endpoint-connection-device-type"
      when AEC::ResourceType::VerifiedAccessInstance                                 then "verified-access-instance"
      when AEC::ResourceType::VerifiedAccessGroup                                    then "verified-access-group"
      when AEC::ResourceType::VerifiedAccessEndpoint                                 then "verified-access-endpoint"
      when AEC::ResourceType::VerifiedAccessPolicy                                   then "verified-access-policy"
      when AEC::ResourceType::VerifiedAccessTrustProvider                            then "verified-access-trust-provider"
      when AEC::ResourceType::VpnConnectionDeviceType                                then "vpn-connection-device-type"
      when AEC::ResourceType::VpcBlockPublicAccessExclusion                          then "vpc-block-public-access-exclusion"
      when AEC::ResourceType::VpcEncryptionControl                                   then "vpc-encryption-control"
      when AEC::ResourceType::RouteServer                                            then "route-server"
      when AEC::ResourceType::RouteServerEndpoint                                    then "route-server-endpoint"
      when AEC::ResourceType::RouteServerPeer                                        then "route-server-peer"
      when AEC::ResourceType::IpamResourceDiscovery                                  then "ipam-resource-discovery"
      when AEC::ResourceType::IpamResourceDiscoveryAssociation                       then "ipam-resource-discovery-association"
      when AEC::ResourceType::InstanceConnectEndpoint                                then "instance-connect-endpoint"
      when AEC::ResourceType::VerifiedAccessEndpointTarget                           then "verified-access-endpoint-target"
      when AEC::ResourceType::IpamExternalResourceVerificationToken                  then "ipam-external-resource-verification-token"
      when AEC::ResourceType::CapacityBlock                                          then "capacity-block"
      when AEC::ResourceType::MacModificationTask                                    then "mac-modification-task"
      when AEC::ResourceType::IpamPrefixListResolver                                 then "ipam-prefix-list-resolver"
      when AEC::ResourceType::IpamPolicy                                             then "ipam-policy"
      when AEC::ResourceType::IpamPrefixListResolverTarget                           then "ipam-prefix-list-resolver-target"
      when AEC::ResourceType::IpamInternetRegistryAssociation                        then "ipam-internet-registry-association"
      when AEC::ResourceType::SecondaryInterface                                     then "secondary-interface"
      when AEC::ResourceType::SecondaryNetwork                                       then "secondary-network"
      when AEC::ResourceType::SecondarySubnet                                        then "secondary-subnet"
      when AEC::ResourceType::CapacityManagerDataExport                              then "capacity-manager-data-export"
      when AEC::ResourceType::VpnConcentrator                                        then "vpn-concentrator"
      when AEC::ResourceType::IpamPoolAllocation                                     then "ipam-pool-allocation"
      when AEC::ResourceType::CapacityReservationCancellationQuote                   then "capacity-reservation-cancellation-quote"
      when AEC::ResourceType::ApplicationStatusCheck                                 then "application-status-check"
      else
        raise Exception.new("unknown enum value for 'ResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ResourceType?
      case key
      when "capacity-reservation"                                          then AEC::ResourceType::CapacityReservation
      when "client-vpn-endpoint"                                           then AEC::ResourceType::ClientVpnEndpoint
      when "customer-gateway"                                              then AEC::ResourceType::CustomerGateway
      when "carrier-gateway"                                               then AEC::ResourceType::CarrierGateway
      when "coip-pool"                                                     then AEC::ResourceType::CoipPool
      when "declarative-policies-report"                                   then AEC::ResourceType::DeclarativePoliciesReport
      when "dedicated-host"                                                then AEC::ResourceType::DedicatedHost
      when "dhcp-options"                                                  then AEC::ResourceType::DhcpOptions
      when "egress-only-internet-gateway"                                  then AEC::ResourceType::EgressOnlyInternetGateway
      when "elastic-ip"                                                    then AEC::ResourceType::ElasticIp
      when "elastic-gpu"                                                   then AEC::ResourceType::ElasticGpu
      when "export-image-task"                                             then AEC::ResourceType::ExportImageTask
      when "export-instance-task"                                          then AEC::ResourceType::ExportInstanceTask
      when "fleet"                                                         then AEC::ResourceType::Fleet
      when "fpga-image"                                                    then AEC::ResourceType::FpgaImage
      when "host-reservation"                                              then AEC::ResourceType::HostReservation
      when "image"                                                         then AEC::ResourceType::Image
      when "image-usage-report"                                            then AEC::ResourceType::ImageUsageReport
      when "import-image-task"                                             then AEC::ResourceType::ImportImageTask
      when "import-snapshot-task"                                          then AEC::ResourceType::ImportSnapshotTask
      when "instance"                                                      then AEC::ResourceType::Instance
      when "instance-event-window"                                         then AEC::ResourceType::InstanceEventWindow
      when "internet-gateway"                                              then AEC::ResourceType::InternetGateway
      when "ipam"                                                          then AEC::ResourceType::Ipam
      when "ipam-pool"                                                     then AEC::ResourceType::IpamPool
      when "ipam-scope"                                                    then AEC::ResourceType::IpamScope
      when "ipv4pool-ec2"                                                  then AEC::ResourceType::Ipv4poolEc2
      when "ipv6pool-ec2"                                                  then AEC::ResourceType::Ipv6poolEc2
      when "key-pair"                                                      then AEC::ResourceType::KeyPair
      when "launch-template"                                               then AEC::ResourceType::LaunchTemplate
      when "local-gateway"                                                 then AEC::ResourceType::LocalGateway
      when "local-gateway-route-table"                                     then AEC::ResourceType::LocalGatewayRouteTable
      when "local-gateway-virtual-interface"                               then AEC::ResourceType::LocalGatewayVirtualInterface
      when "local-gateway-virtual-interface-group"                         then AEC::ResourceType::LocalGatewayVirtualInterfaceGroup
      when "local-gateway-route-table-vpc-association"                     then AEC::ResourceType::LocalGatewayRouteTableVpcAssociation
      when "local-gateway-route-table-virtual-interface-group-association" then AEC::ResourceType::LocalGatewayRouteTableVirtualInterfaceGroupAssociation
      when "natgateway"                                                    then AEC::ResourceType::Natgateway
      when "network-acl"                                                   then AEC::ResourceType::NetworkAcl
      when "network-interface"                                             then AEC::ResourceType::NetworkInterface
      when "network-insights-analysis"                                     then AEC::ResourceType::NetworkInsightsAnalysis
      when "network-insights-path"                                         then AEC::ResourceType::NetworkInsightsPath
      when "network-insights-access-scope"                                 then AEC::ResourceType::NetworkInsightsAccessScope
      when "network-insights-access-scope-analysis"                        then AEC::ResourceType::NetworkInsightsAccessScopeAnalysis
      when "outpost-lag"                                                   then AEC::ResourceType::OutpostLag
      when "placement-group"                                               then AEC::ResourceType::PlacementGroup
      when "prefix-list"                                                   then AEC::ResourceType::PrefixList
      when "replace-root-volume-task"                                      then AEC::ResourceType::ReplaceRootVolumeTask
      when "reserved-instances"                                            then AEC::ResourceType::ReservedInstances
      when "route-table"                                                   then AEC::ResourceType::RouteTable
      when "security-group"                                                then AEC::ResourceType::SecurityGroup
      when "security-group-rule"                                           then AEC::ResourceType::SecurityGroupRule
      when "service-link-virtual-interface"                                then AEC::ResourceType::ServiceLinkVirtualInterface
      when "snapshot"                                                      then AEC::ResourceType::Snapshot
      when "spot-fleet-request"                                            then AEC::ResourceType::SpotFleetRequest
      when "spot-instances-request"                                        then AEC::ResourceType::SpotInstancesRequest
      when "subnet"                                                        then AEC::ResourceType::Subnet
      when "subnet-cidr-reservation"                                       then AEC::ResourceType::SubnetCidrReservation
      when "traffic-mirror-filter"                                         then AEC::ResourceType::TrafficMirrorFilter
      when "traffic-mirror-session"                                        then AEC::ResourceType::TrafficMirrorSession
      when "traffic-mirror-target"                                         then AEC::ResourceType::TrafficMirrorTarget
      when "transit-gateway"                                               then AEC::ResourceType::TransitGateway
      when "transit-gateway-attachment"                                    then AEC::ResourceType::TransitGatewayAttachment
      when "transit-gateway-connect-peer"                                  then AEC::ResourceType::TransitGatewayConnectPeer
      when "transit-gateway-multicast-domain"                              then AEC::ResourceType::TransitGatewayMulticastDomain
      when "transit-gateway-policy-table"                                  then AEC::ResourceType::TransitGatewayPolicyTable
      when "transit-gateway-metering-policy"                               then AEC::ResourceType::TransitGatewayMeteringPolicy
      when "transit-gateway-route-table"                                   then AEC::ResourceType::TransitGatewayRouteTable
      when "transit-gateway-route-table-announcement"                      then AEC::ResourceType::TransitGatewayRouteTableAnnouncement
      when "volume"                                                        then AEC::ResourceType::Volume
      when "vpc"                                                           then AEC::ResourceType::Vpc
      when "vpc-endpoint"                                                  then AEC::ResourceType::VpcEndpoint
      when "vpc-endpoint-connection"                                       then AEC::ResourceType::VpcEndpointConnection
      when "vpc-endpoint-service"                                          then AEC::ResourceType::VpcEndpointService
      when "vpc-endpoint-service-permission"                               then AEC::ResourceType::VpcEndpointServicePermission
      when "vpc-peering-connection"                                        then AEC::ResourceType::VpcPeeringConnection
      when "vpn-connection"                                                then AEC::ResourceType::VpnConnection
      when "vpn-gateway"                                                   then AEC::ResourceType::VpnGateway
      when "vpc-flow-log"                                                  then AEC::ResourceType::VpcFlowLog
      when "capacity-reservation-fleet"                                    then AEC::ResourceType::CapacityReservationFleet
      when "traffic-mirror-filter-rule"                                    then AEC::ResourceType::TrafficMirrorFilterRule
      when "vpc-endpoint-connection-device-type"                           then AEC::ResourceType::VpcEndpointConnectionDeviceType
      when "verified-access-instance"                                      then AEC::ResourceType::VerifiedAccessInstance
      when "verified-access-group"                                         then AEC::ResourceType::VerifiedAccessGroup
      when "verified-access-endpoint"                                      then AEC::ResourceType::VerifiedAccessEndpoint
      when "verified-access-policy"                                        then AEC::ResourceType::VerifiedAccessPolicy
      when "verified-access-trust-provider"                                then AEC::ResourceType::VerifiedAccessTrustProvider
      when "vpn-connection-device-type"                                    then AEC::ResourceType::VpnConnectionDeviceType
      when "vpc-block-public-access-exclusion"                             then AEC::ResourceType::VpcBlockPublicAccessExclusion
      when "vpc-encryption-control"                                        then AEC::ResourceType::VpcEncryptionControl
      when "route-server"                                                  then AEC::ResourceType::RouteServer
      when "route-server-endpoint"                                         then AEC::ResourceType::RouteServerEndpoint
      when "route-server-peer"                                             then AEC::ResourceType::RouteServerPeer
      when "ipam-resource-discovery"                                       then AEC::ResourceType::IpamResourceDiscovery
      when "ipam-resource-discovery-association"                           then AEC::ResourceType::IpamResourceDiscoveryAssociation
      when "instance-connect-endpoint"                                     then AEC::ResourceType::InstanceConnectEndpoint
      when "verified-access-endpoint-target"                               then AEC::ResourceType::VerifiedAccessEndpointTarget
      when "ipam-external-resource-verification-token"                     then AEC::ResourceType::IpamExternalResourceVerificationToken
      when "capacity-block"                                                then AEC::ResourceType::CapacityBlock
      when "mac-modification-task"                                         then AEC::ResourceType::MacModificationTask
      when "ipam-prefix-list-resolver"                                     then AEC::ResourceType::IpamPrefixListResolver
      when "ipam-policy"                                                   then AEC::ResourceType::IpamPolicy
      when "ipam-prefix-list-resolver-target"                              then AEC::ResourceType::IpamPrefixListResolverTarget
      when "ipam-internet-registry-association"                            then AEC::ResourceType::IpamInternetRegistryAssociation
      when "secondary-interface"                                           then AEC::ResourceType::SecondaryInterface
      when "secondary-network"                                             then AEC::ResourceType::SecondaryNetwork
      when "secondary-subnet"                                              then AEC::ResourceType::SecondarySubnet
      when "capacity-manager-data-export"                                  then AEC::ResourceType::CapacityManagerDataExport
      when "vpn-concentrator"                                              then AEC::ResourceType::VpnConcentrator
      when "ipam-pool-allocation"                                          then AEC::ResourceType::IpamPoolAllocation
      when "capacity-reservation-cancellation-quote"                       then AEC::ResourceType::CapacityReservationCancellationQuote
      when "application-status-check"                                      then AEC::ResourceType::ApplicationStatusCheck
      else
        nil
      end
    end
  end
end
