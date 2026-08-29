private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # The function's [Lambda SnapStart](https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html)
  # setting. Set `ApplyOn` to `PublishedVersions` to create a snapshot of the initialized execution
  # environment when you publish a function version.
  class SnapStart
    include JSON::Serializable

    # Set to `PublishedVersions` to create a snapshot of the initialized execution environment when
    # you publish a function version.
    @[JSON::Field(key: "ApplyOn", converter: AL::SnapStartApplyOn)]
    property apply_on : SnapStartApplyOn | Nil

    def initialize(
      @apply_on : SnapStartApplyOn | Nil = nil,
    )
    end
  end
end
