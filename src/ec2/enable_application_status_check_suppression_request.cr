private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableApplicationStatusCheckSuppressionRequest
    # The IDs of the instances for which to suppress application status checks.
    property instance_ids : Array(String) | Nil

    # The duration, in seconds, for which to suppress application status checks. If omitted, the
    # application status check is suppressed indefinitely until you call
    # `DisableApplicationStatusCheckSuppression`.
    property duration_seconds : Int32 | Nil

    # A unique, case-sensitive identifier that you provide to ensure that the operation completes no
    # more than one time. If you retry a request with the same token, the service ignores the request
    # but does not return an error. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_ids : Array(String) | Nil = nil,
      @duration_seconds : Int32 | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_ids: node.xpath_nodes("*[local-name()='InstanceId']/*[local-name()='item']").map { |n| n.content },
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_ids, @duration_seconds, @client_token, @dry_run)
  end
end
