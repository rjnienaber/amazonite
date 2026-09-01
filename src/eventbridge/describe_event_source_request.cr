private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class DescribeEventSourceRequest
    include JSON::Serializable

    # The name of the partner event source to display the details of.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^aws\\.partner(/[\\.\\-_A-Za-z0-9]+){2,}$"))
      end
    end

    def_equals_and_hash(@name)
  end
end
