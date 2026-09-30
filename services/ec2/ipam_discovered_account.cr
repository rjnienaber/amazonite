private alias Core = Amazonite::Core

module Amazonite::EC2
  # An IPAM discovered account. A discovered account is an Amazon Web Services account that is
  # monitored under a resource discovery. If you have integrated IPAM with Amazon Web Services
  # Organizations, all accounts in the organization are discovered accounts.
  class IpamDiscoveredAccount
    # The account ID.
    property account_id : String | Nil

    # The Amazon Web Services Region that the account information is returned from. An account can be
    # discovered in multiple regions and will have a separate discovered account for each Region.
    property discovery_region : String | Nil

    # The resource discovery failure reason.
    property failure_reason : IpamDiscoveryFailureReason | Nil

    # The last attempted resource discovery time.
    property last_attempted_discovery_time : Time | Nil

    # The last successful resource discovery time.
    property last_successful_discovery_time : Time | Nil

    # The ID of an Organizational Unit in Amazon Web Services Organizations.
    property organizational_unit_id : String | Nil

    def initialize(
      @account_id : String | Nil = nil,
      @discovery_region : String | Nil = nil,
      @failure_reason : IpamDiscoveryFailureReason | Nil = nil,
      @last_attempted_discovery_time : Time | Nil = nil,
      @last_successful_discovery_time : Time | Nil = nil,
      @organizational_unit_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @account_id
        params << {"#{prefix}AccountId", value}
      end

      if value = @discovery_region
        params << {"#{prefix}DiscoveryRegion", value}
      end

      if value = @failure_reason
        params.concat(value.to_query_params("#{prefix}FailureReason."))
      end

      if value = @last_attempted_discovery_time
        params << {"#{prefix}LastAttemptedDiscoveryTime", Core::QueryValue.time(value)}
      end

      if value = @last_successful_discovery_time
        params << {"#{prefix}LastSuccessfulDiscoveryTime", Core::QueryValue.time(value)}
      end

      if value = @organizational_unit_id
        params << {"#{prefix}OrganizationalUnitId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='accountId']")),
        discovery_region: Core::XMLValue.string(node.xpath_node("*[local-name()='discoveryRegion']")),
        failure_reason: node.xpath_node("*[local-name()='failureReason']").try { |n| IpamDiscoveryFailureReason.from_xml(n) },
        last_attempted_discovery_time: Core::XMLValue.time(node.xpath_node("*[local-name()='lastAttemptedDiscoveryTime']")),
        last_successful_discovery_time: Core::XMLValue.time(node.xpath_node("*[local-name()='lastSuccessfulDiscoveryTime']")),
        organizational_unit_id: Core::XMLValue.string(node.xpath_node("*[local-name()='organizationalUnitId']")),
      )
    end

    def validate! : Nil
      if value = @failure_reason
        value.validate!
      end
    end

    def_equals_and_hash(@account_id, @discovery_region, @failure_reason, @last_attempted_discovery_time, @last_successful_discovery_time, @organizational_unit_id)
  end
end
