private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableIpamInternetRegistryAssociationRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM internet registry association to enable.
    property ipam_internet_registry_association_id : String

    # The RPKI version to use from the Parent Response XML.
    property rpki_version : String

    # The RPKI service URI for the publication point from the Parent Response XML.
    property service_uri : String

    # The child handle for the BPKI certificate hierarchy from the Parent Response XML.
    property child_handle : String

    # The parent handle for the BPKI certificate hierarchy from the Parent Response XML.
    property parent_handle : String

    # The parent BPKI Trust Anchor certificate in PEM format from the Parent Response XML.
    property parent_bpki_ta : String

    # A unique, case-sensitive identifier to ensure that the operation completes no more than one
    # time. If this token matches a previous request, the operation ignores the request, but does not
    # return an error.
    property client_token : String | Nil

    def initialize(
      @ipam_internet_registry_association_id : String,
      @rpki_version : String,
      @service_uri : String,
      @child_handle : String,
      @parent_handle : String,
      @parent_bpki_ta : String,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamInternetRegistryAssociationId", @ipam_internet_registry_association_id}

      params << {"#{prefix}RpkiVersion", @rpki_version}

      params << {"#{prefix}ServiceUri", @service_uri}

      params << {"#{prefix}ChildHandle", @child_handle}

      params << {"#{prefix}ParentHandle", @parent_handle}

      params << {"#{prefix}ParentBpkiTa", @parent_bpki_ta}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_internet_registry_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamInternetRegistryAssociationId']")).not_nil!,
        rpki_version: Core::XMLValue.string(node.xpath_node("*[local-name()='RpkiVersion']")).not_nil!,
        service_uri: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceUri']")).not_nil!,
        child_handle: Core::XMLValue.string(node.xpath_node("*[local-name()='ChildHandle']")).not_nil!,
        parent_handle: Core::XMLValue.string(node.xpath_node("*[local-name()='ParentHandle']")).not_nil!,
        parent_bpki_ta: Core::XMLValue.string(node.xpath_node("*[local-name()='ParentBpkiTa']")).not_nil!,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_internet_registry_association_id, @rpki_version, @service_uri, @child_handle, @parent_handle, @parent_bpki_ta, @client_token)
  end
end
