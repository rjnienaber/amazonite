private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for BundleInstance.
  class BundleInstanceRequest
    # The ID of the instance to bundle.
    #
    # Default: None
    property instance_id : String

    # The bucket in which to store the AMI. You can specify a bucket that you already own or a new
    # bucket that Amazon EC2 creates on your behalf. If you specify a bucket that belongs to someone
    # else, Amazon EC2 returns an error.
    property storage : Storage

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_id : String,
      @storage : Storage,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceId", @instance_id}

      params.concat(@storage.to_query_params("#{prefix}Storage."))

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        storage: node.xpath_node("*[local-name()='Storage']").try { |n| Storage.from_xml(n) }.not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @storage
        value.validate!
      end
    end

    def_equals_and_hash(@instance_id, @storage, @dry_run)
  end
end
