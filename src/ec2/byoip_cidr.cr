private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about an address range that is provisioned for use with your Amazon Web Services
  # resources through bring your own IP addresses (BYOIP).
  class ByoipCidr
    # The address range, in CIDR notation.
    property cidr : String | Nil

    # The description of the address range.
    property description : String | Nil

    # The BYOIP CIDR associations with ASNs.
    property asn_associations : Array(AsnAssociation) | Nil

    # Upon success, contains the ID of the address pool. Otherwise, contains an error message.
    property status_message : String | Nil

    # The state of the address range.
    #
    # - `advertised`: The address range is being advertised to the internet by Amazon Web Services.
    #
    # - `deprovisioned`: The address range is deprovisioned.
    #
    # - `failed-deprovision`: The request to deprovision the address range was unsuccessful. Ensure
    # that all EIPs from the range have been deallocated and try again.
    #
    # - `failed-provision`: The request to provision the address range was unsuccessful.
    #
    # - `pending-deprovision`: You’ve submitted a request to deprovision an address range and it's
    # pending.
    #
    # - `pending-provision`: You’ve submitted a request to provision an address range and it's
    # pending.
    #
    # - `provisioned`: The address range is provisioned and can be advertised. The range is not
    # currently advertised.
    #
    # - `provisioned-not-publicly-advertisable`: The address range is provisioned and cannot be
    # advertised.
    property state : ByoipCidrState | Nil

    # If you have [Local
    # Zones](https://docs.aws.amazon.com/local-zones/latest/ug/how-local-zones-work.html) enabled, you
    # can choose a network border group for Local Zones when you provision and advertise a BYOIPv4
    # CIDR. Choose the network border group carefully as the EIP and the Amazon Web Services resource
    # it is associated with must reside in the same network border group.
    #
    # You can provision BYOIP address ranges to and advertise them in the following Local Zone network
    # border groups:
    #
    # - us-east-1-dfw-2
    #
    # - us-west-2-lax-1
    #
    # - us-west-2-phx-2
    #
    # You cannot provision or advertise BYOIPv6 address ranges in Local Zones at this time.
    property network_border_group : String | Nil

    # Specifies the advertisement method for the BYOIP CIDR. Valid values are:
    #
    # - `unicast`: IP is advertised from a single location (regional services like EC2)
    #
    # - `anycast`: IP is advertised from multiple global locations simultaneously (global services
    # like CloudFront)
    #
    # For more information, see [Bring your own IP to CloudFront using
    # IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/tutorials-byoip-cloudfront.html) in the
    # *Amazon VPC IPAM User Guide*.
    property advertisement_type : String | Nil

    # The ID of the address pool associated with the CIDR.
    property pool_id : String | Nil

    # The ID of the IPAM pool associated with the CIDR.
    property ipam_pool_id : String | Nil

    def initialize(
      @cidr : String | Nil = nil,
      @description : String | Nil = nil,
      @asn_associations : Array(AsnAssociation) | Nil = nil,
      @status_message : String | Nil = nil,
      @state : ByoipCidrState | Nil = nil,
      @network_border_group : String | Nil = nil,
      @advertisement_type : String | Nil = nil,
      @pool_id : String | Nil = nil,
      @ipam_pool_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@asn_associations || [] of AsnAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AsnAssociationSet.#{i}."))
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end

      if value = @advertisement_type
        params << {"#{prefix}AdvertisementType", value}
      end

      if value = @pool_id
        params << {"#{prefix}PoolId", value}
      end

      if value = @ipam_pool_id
        params << {"#{prefix}IpamPoolId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        asn_associations: node.xpath_nodes("*[local-name()='asnAssociationSet']/*[local-name()='item']").map { |n| AsnAssociation.from_xml(n) },
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::ByoipCidrState.from_json_object_key?(n.content) : nil,
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='networkBorderGroup']")),
        advertisement_type: Core::XMLValue.string(node.xpath_node("*[local-name()='advertisementType']")),
        pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='poolId']")),
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPoolId']")),
      )
    end

    def validate! : Nil
      if value = @asn_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@cidr, @description, @asn_associations, @status_message, @state, @network_border_group, @advertisement_type, @pool_id, @ipam_pool_id)
  end
end
