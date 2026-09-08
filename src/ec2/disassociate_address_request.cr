private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateAddressRequest
    # The association ID. This parameter is required.
    property association_id : String | Nil

    # Deprecated.
    property public_ip : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @public_ip : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association_id
        params << {"#{prefix}AssociationId", value}
      end

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AssociationId']")),
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicIp']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@association_id, @public_ip, @dry_run)
  end
end
