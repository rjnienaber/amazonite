private alias Core = Amazonite::Core

module Amazonite::EC2
  class StopInstancesRequest
    # The IDs of the instances.
    property instance_ids : Array(String) = [] of String

    # Hibernates the instance if the instance was enabled for hibernation at launch. If the instance
    # cannot hibernate successfully, a normal shutdown occurs. For more information, see [Hibernate
    # your Amazon EC2 instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html) in
    # the *Amazon EC2 User Guide*.
    #
    # Default: `false`
    property hibernate : Bool | Nil

    # Specifies whether to bypass the graceful OS shutdown process when the instance is stopped.
    #
    # Bypassing the graceful OS shutdown might result in data loss or corruption (for example, memory
    # contents not flushed to disk or loss of in-flight IOs) or skipped shutdown scripts.
    #
    # Default: `false`
    property skip_os_shutdown : Bool | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Forces the instance to stop. The instance will first attempt a graceful shutdown, which includes
    # flushing file system caches and metadata. If the graceful shutdown fails to complete within the
    # timeout period, the instance shuts down forcibly without flushing the file system caches and
    # metadata.
    #
    # After using this option, you must perform file system check and repair procedures. This option
    # is not recommended for Windows instances. For more information, see [Troubleshoot Amazon EC2
    # instance stop
    # issues](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesStopping.html)
    # in the *Amazon EC2 User Guide*.
    #
    # Default: `false`
    property force : Bool | Nil

    def initialize(
      @instance_ids : Array(String),
      @hibernate : Bool | Nil = nil,
      @skip_os_shutdown : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @force : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @instance_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
      end

      if value = @hibernate
        params << {"#{prefix}Hibernate", Core::QueryValue.bool(value)}
      end

      if value = @skip_os_shutdown
        params << {"#{prefix}SkipOsShutdown", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @force
        params << {"#{prefix}Force", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_ids: node.xpath_nodes("*[local-name()='InstanceId']/*[local-name()='InstanceId']").map { |n| n.content },
        hibernate: Core::XMLValue.bool(node.xpath_node("*[local-name()='Hibernate']")),
        skip_os_shutdown: Core::XMLValue.bool(node.xpath_node("*[local-name()='SkipOsShutdown']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        force: Core::XMLValue.bool(node.xpath_node("*[local-name()='force']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_ids, @hibernate, @skip_os_shutdown, @dry_run, @force)
  end
end
