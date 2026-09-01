private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    def validate! : Nil
      if value = @capacity_provider
        raise Core::ValidationError.new("capacityProvider length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("capacityProvider length must be <= 255") if value.size > 255
      end

      if value = @weight
        raise Core::ValidationError.new("weight value must be >= 0") if value < 0
        raise Core::ValidationError.new("weight value must be <= 1000") if value > 1000
      end

      if value = @base
        raise Core::ValidationError.new("base value must be >= 0") if value < 0
        raise Core::ValidationError.new("base value must be <= 100000") if value > 100000
      end
    end

    def_equals_and_hash(@capacity_provider, @weight, @base)
  end
end
