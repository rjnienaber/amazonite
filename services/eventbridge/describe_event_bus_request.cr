private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class DescribeEventBusRequest
    include JSON::Serializable

    # The name or ARN of the event bus to show details for. If you omit this, the default event bus is
    # displayed.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^(arn:aws[\\w-]*:events:[a-z]+-[a-z]+-[\\w-]+:[0-9]{12}:event-bus\\/)?[/\\.\\-_A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@name)
  end
end
