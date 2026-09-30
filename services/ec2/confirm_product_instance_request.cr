private alias Core = Amazonite::Core

module Amazonite::EC2
  class ConfirmProductInstanceRequest
    # The ID of the instance.
    property instance_id : String

    # The product code. This must be a product code that you own.
    property product_code : String

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_id : String,
      @product_code : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceId", @instance_id}

      params << {"#{prefix}ProductCode", @product_code}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        product_code: Core::XMLValue.string(node.xpath_node("*[local-name()='ProductCode']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @product_code, @dry_run)
  end
end
