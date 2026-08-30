module Amazonite::LambdaV1
  # The [ provisioned
  # mode](https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventsourcemapping.html#invocation-eventsourcemapping-provisioned-mode)
  # configuration for the event source. Use Provisioned Mode to customize the minimum and maximum
  # number of event pollers for your event source.
  class ProvisionedPollerConfig
    include JSON::Serializable

    # The minimum number of event pollers this event source can scale down to. For Amazon SQS events
    # source mappings, default is 2, and minimum 2 required. For Amazon MSK and self-managed Apache
    # Kafka event source mappings, default is 1.
    @[JSON::Field(key: "MinimumPollers")]
    property minimum_pollers : Int32 | Nil

    # The maximum number of event pollers this event source can scale up to. For Amazon SQS event
    # source mappings, the accepted range is between 2 and 10,000, with a default of 200. For Amazon
    # MSK and self-managed Apache Kafka event source mappings, the accepted range is between 1 and
    # 2,000, with a default of 200.
    @[JSON::Field(key: "MaximumPollers")]
    property maximum_pollers : Int32 | Nil

    # (Amazon MSK and self-managed Apache Kafka) The name of the provisioned poller group. Use this
    # option to group multiple ESMs within the event source's VPC to share Event Poller Unit (EPU)
    # capacity. You can use this option to optimize Provisioned mode costs for your ESMs. You can
    # group up to 100 ESMs per poller group and aggregate maximum pollers across all ESMs in a group
    # cannot exceed 2000.
    @[JSON::Field(key: "PollerGroupName")]
    property poller_group_name : String | Nil

    def initialize(
      @minimum_pollers : Int32 | Nil = nil,
      @maximum_pollers : Int32 | Nil = nil,
      @poller_group_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@minimum_pollers, @maximum_pollers, @poller_group_name)
  end
end
