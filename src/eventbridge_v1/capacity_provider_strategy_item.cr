module Amazonite::EventBridgeV1
  # The details of a capacity provider strategy. To learn more, see
  # [CapacityProviderStrategyItem](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CapacityProviderStrategyItem.html)
  # in the Amazon ECS API Reference.
  class CapacityProviderStrategyItem
    include JSON::Serializable

    # The short name of the capacity provider.
    @[JSON::Field(key: "capacityProvider")]
    property capacity_provider : String

    # The weight value designates the relative percentage of the total number of tasks launched that
    # should use the specified capacity provider. The weight value is taken into consideration after
    # the base value, if defined, is satisfied.
    @[JSON::Field(key: "weight")]
    property weight : Int32 | Nil

    # The base value designates how many tasks, at a minimum, to run on the specified capacity
    # provider. Only one capacity provider in a capacity provider strategy can have a base defined. If
    # no value is specified, the default value of 0 is used.
    @[JSON::Field(key: "base")]
    property base : Int32 | Nil

    def initialize(
      @capacity_provider : String,
      @weight : Int32 | Nil = nil,
      @base : Int32 | Nil = nil,
    )
    end
  end
end
