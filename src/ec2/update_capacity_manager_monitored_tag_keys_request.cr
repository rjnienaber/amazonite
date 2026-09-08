private alias Core = Amazonite::Core

module Amazonite::EC2
  class UpdateCapacityManagerMonitoredTagKeysRequest
    # The tag keys to activate for monitoring. Once activated, these tag keys will be included as
    # dimensions in capacity metric data.
    property activate_tag_keys : Array(String) | Nil

    # The tag keys to deactivate. Deactivated tag keys will no longer be included as dimensions in
    # capacity metric data.
    property deactivate_tag_keys : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    property client_token : String | Nil

    def initialize(
      @activate_tag_keys : Array(String) | Nil = nil,
      @deactivate_tag_keys : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@activate_tag_keys || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ActivateTagKey.#{i}", item}
      end

      (@deactivate_tag_keys || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DeactivateTagKey.#{i}", item}
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
        activate_tag_keys: node.xpath_nodes("*[local-name()='ActivateTagKey']/*[local-name()='item']").map { |n| n.content },
        deactivate_tag_keys: node.xpath_nodes("*[local-name()='DeactivateTagKey']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@activate_tag_keys, @deactivate_tag_keys, @dry_run, @client_token)
  end
end
