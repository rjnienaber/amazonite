private alias Core = Amazonite::Core

module Amazonite::Ssm
  # An array of search criteria that targets managed nodes using a key-value pair that you specify.
  #
  # One or more targets must be specified for maintenance window Run Command-type tasks. Depending
  # on the task, targets are optional for other maintenance window task types (Automation, Lambda,
  # and Step Functions). For more information about running tasks that don't specify targets, see
  # [Registering maintenance window tasks without
  # targets](https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html)
  # in the *Amazon Web Services Systems Manager User Guide*.
  #
  # Supported formats include the following.
  #
  # **For all Systems Manager tools:**
  #
  # - `Key=tag-key,Values=tag-value-1,tag-value-2`
  #
  # **For Automation and Change Manager:**
  #
  # - `Key=tag:tag-key,Values=tag-value`
  #
  # - `Key=ResourceGroup,Values=resource-group-name`
  #
  # - `Key=ParameterValues,Values=value-1,value-2,value-3`
  #
  # - To target all instances in the Amazon Web Services Region:
  #
  # - `Key=AWS::EC2::Instance,Values=*`
  #
  # - `Key=InstanceIds,Values=*`
  #
  # **For Run Command and Maintenance Windows:**
  #
  # - `Key=InstanceIds,Values=instance-id-1,instance-id-2,instance-id-3`
  #
  # - `Key=tag:tag-key,Values=tag-value-1,tag-value-2`
  #
  # - `Key=resource-groups:Name,Values=resource-group-name`
  #
  # - Additionally, Maintenance Windows support targeting resource types:
  #
  # - `Key=resource-groups:ResourceTypeFilters,Values=resource-type-1,resource-type-2`
  #
  # **For State Manager:**
  #
  # - `Key=InstanceIds,Values=instance-id-1,instance-id-2,instance-id-3`
  #
  # - `Key=tag:tag-key,Values=tag-value-1,tag-value-2`
  #
  # - To target all instances in the Amazon Web Services Region:
  #
  # - `Key=InstanceIds,Values=*`
  #
  # For more information about how to send commands that target managed nodes using `Key,Value`
  # parameters, see [Targeting multiple managed
  # nodes](https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-targeting)
  # in the *Amazon Web Services Systems Manager User Guide*.
  class Target
    include JSON::Serializable

    # User-defined criteria for sending commands that target managed nodes that meet the criteria.
    @[JSON::Field(key: "Key")]
    property key : String | Nil

    # User-defined criteria that maps to `Key`. For example, if you specified `tag:ServerRole`, you
    # could specify `value:WebServer` to run a command on instances that include EC2 tags of
    # `ServerRole,WebServer`.
    #
    # Depending on the type of target, the maximum number of values for a key might be lower than the
    # global maximum of 50.
    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    def initialize(
      @key : String | Nil = nil,
      @values : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 163") if value.size > 163
        raise Core::ValidationError.new("Key does not match the required pattern") unless value.matches?(Regex.new("^[\\p{L}\\p{Z}\\p{N}_.:/=\\-@]*$|resource-groups:ResourceTypeFilters|resource-groups:Name$"))
      end

      if value = @values
        raise Core::ValidationError.new("Values must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Values must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
