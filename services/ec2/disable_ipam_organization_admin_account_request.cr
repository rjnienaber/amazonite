private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableIpamOrganizationAdminAccountRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The Organizations member account ID that you want to disable as IPAM account.
    property delegated_admin_account_id : String

    def initialize(
      @delegated_admin_account_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}DelegatedAdminAccountId", @delegated_admin_account_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        delegated_admin_account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DelegatedAdminAccountId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @delegated_admin_account_id)
  end
end
