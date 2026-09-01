private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The input for the SignalResource action.
  class SignalResourceInput
    # The stack name or unique stack ID that includes the resource that you want to signal.
    property stack_name : String

    # The logical ID of the resource that you want to signal. The logical ID is the name of the
    # resource that given in the template.
    property logical_resource_id : String

    # A unique ID of the signal. When you signal Amazon EC2 instances or Auto Scaling groups, specify
    # the instance ID that you are signaling as the unique ID. If you send multiple signals to a
    # single resource (such as signaling a wait condition), each signal requires a different unique
    # ID.
    property unique_id : String

    # The status of the signal, which is either success or failure. A failure signal causes
    # CloudFormation to immediately fail the stack creation or update.
    property status : ResourceSignalStatus

    def initialize(
      @stack_name : String,
      @logical_resource_id : String,
      @unique_id : String,
      @status : ResourceSignalStatus,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      params << {"#{prefix}LogicalResourceId", @logical_resource_id}

      params << {"#{prefix}UniqueId", @unique_id}

      params << {"#{prefix}Status", @status.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")).not_nil!,
        unique_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UniqueId']")).not_nil!,
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? ACF::ResourceSignalStatus.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
      if value = @stack_name
        raise Core::ValidationError.new("StackName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackName does not match the required pattern") unless value.matches?(Regex.new("^([a-zA-Z][-a-zA-Z0-9]*)|(arn:\\b(aws|aws-us-gov|aws-cn)\\b:[-a-zA-Z0-9:/._+]*)$"))
      end

      if value = @unique_id
        raise Core::ValidationError.new("UniqueId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UniqueId length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@stack_name, @logical_resource_id, @unique_id, @status)
  end
end
