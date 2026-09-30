private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateIpamInternetRegistryAssociationRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM to associate with the internet registry.
    property ipam_id : String

    # The Regional Internet Registry to associate with. Possible values:
    #
    # - `ripe` - RIPE NCC (Europe, the Middle East, and Central Asia).
    #
    # - `apnic` - APNIC (Asia Pacific).
    #
    # - `arin` - ARIN (North America).
    #
    # - `lacnic` - LACNIC (Latin America and the Caribbean).
    property rir : Rir

    # The organization handle at the internet registry (for example, a RIPE NCC organization ID or
    # ARIN Org ID).
    property organization_handle : String

    # A description for the internet registry association.
    property description : String | Nil

    # The tags to assign to the internet registry association.
    property tag_specifications : Array(TagSpecification) | Nil

    # A unique, case-sensitive identifier to ensure that the operation completes no more than one
    # time. If this token matches a previous request, the operation ignores the request, but does not
    # return an error.
    property client_token : String | Nil

    def initialize(
      @ipam_id : String,
      @rir : Rir,
      @organization_handle : String,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamId", @ipam_id}

      params << {"#{prefix}Rir", @rir.to_json_object_key}

      params << {"#{prefix}OrganizationHandle", @organization_handle}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamId']")).not_nil!,
        rir: ((n = node.xpath_node("*[local-name()='Rir']")) ? AEC::Rir.from_json_object_key?(n.content) : nil).not_nil!,
        organization_handle: Core::XMLValue.string(node.xpath_node("*[local-name()='OrganizationHandle']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @ipam_id, @rir, @organization_handle, @description, @tag_specifications, @client_token)
  end
end
