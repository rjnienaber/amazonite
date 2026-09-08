private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVerifiedAccessInstanceLoggingConfigurationRequest
    # The ID of the Verified Access instance.
    property verified_access_instance_id : String

    # The configuration options for Verified Access instances.
    property access_logs : VerifiedAccessLogOptions

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A unique, case-sensitive token that you provide to ensure idempotency of your modification
    # request. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    def initialize(
      @verified_access_instance_id : String,
      @access_logs : VerifiedAccessLogOptions,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VerifiedAccessInstanceId", @verified_access_instance_id}

      params.concat(@access_logs.to_query_params("#{prefix}AccessLogs."))

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
        verified_access_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VerifiedAccessInstanceId']")).not_nil!,
        access_logs: node.xpath_node("*[local-name()='AccessLogs']").try { |n| VerifiedAccessLogOptions.from_xml(n) }.not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
      if value = @access_logs
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_instance_id, @access_logs, @dry_run, @client_token)
  end
end
