private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class SnapStart
    include JSON::Serializable

    @[JSON::Field(key: "ApplyOn", converter: AL::SnapStartApplyOn)]
    property apply_on : SnapStartApplyOn | Nil

    def initialize(
      @apply_on : SnapStartApplyOn | Nil = nil,
    )
    end
  end
end
