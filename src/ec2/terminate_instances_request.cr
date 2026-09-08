private alias Core = Amazonite::Core

module Amazonite::EC2
  class TerminateInstancesRequest
    # The IDs of the instances.
    #
    # Constraints: Up to 1000 instance IDs. We recommend breaking up this request into smaller
    # batches.
    property instance_ids : Array(String) = [] of String

    # Forces the instances to terminate. The instance will first attempt a graceful shutdown, which
    # includes flushing file system caches and metadata. If the graceful shutdown fails to complete
    # within the timeout period, the instance shuts down forcibly without flushing the file system
    # caches and metadata.
    property force : Bool | Nil

    # Specifies whether to bypass the graceful OS shutdown process when the instance is terminated.
    #
    # Default: `false`
    property skip_os_shutdown : Bool | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_ids : Array(String),
      @force : Bool | Nil = nil,
      @skip_os_shutdown : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @instance_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
      end

      if value = @force
        params << {"#{prefix}Force", Core::QueryValue.bool(value)}
      end

      if value = @skip_os_shutdown
        params << {"#{prefix}SkipOsShutdown", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_ids: node.xpath_nodes("*[local-name()='InstanceId']/*[local-name()='InstanceId']").map { |n| n.content },
        force: Core::XMLValue.bool(node.xpath_node("*[local-name()='Force']")),
        skip_os_shutdown: Core::XMLValue.bool(node.xpath_node("*[local-name()='SkipOsShutdown']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_ids, @force, @skip_os_shutdown, @dry_run)
  end
end
