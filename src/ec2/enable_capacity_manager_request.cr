private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableCapacityManagerRequest
    # Specifies whether to enable cross-account access for Amazon Web Services Organizations. When
    # enabled, Capacity Manager can aggregate data from all accounts in your organization. Default is
    # false.
    property organizations_access : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    property client_token : String | Nil

    def initialize(
      @organizations_access : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @organizations_access
        params << {"#{prefix}OrganizationsAccess", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        organizations_access: Core::XMLValue.bool(node.xpath_node("*[local-name()='OrganizationsAccess']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@organizations_access, @dry_run, @client_token)
  end
end
