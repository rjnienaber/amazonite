module Amazonite::LambdaV1
  class ProvisionedPollerConfig
    include JSON::Serializable

    @[JSON::Field(key: "MinimumPollers")]
    property minimum_pollers : Int32 | Nil

    @[JSON::Field(key: "MaximumPollers")]
    property maximum_pollers : Int32 | Nil

    @[JSON::Field(key: "PollerGroupName")]
    property poller_group_name : String | Nil

    def initialize(
      @minimum_pollers : Int32 | Nil = nil,
      @maximum_pollers : Int32 | Nil = nil,
      @poller_group_name : String | Nil = nil,
    )
    end
  end
end
