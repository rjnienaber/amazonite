module Amazonite::Lambda
  # The
  # [traffic-shifting](https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html)
  # configuration of a Lambda function alias.
  class AliasRoutingConfiguration
    include JSON::Serializable

    # The second version, and the percentage of traffic that's routed to it.
    @[JSON::Field(key: "AdditionalVersionWeights")]
    property additional_version_weights : Hash(String, Float64) | Nil

    def initialize(
      @additional_version_weights : Hash(String, Float64) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@additional_version_weights)
  end
end
