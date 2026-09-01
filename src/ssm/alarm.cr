private alias Core = Amazonite::Core

module Amazonite::Ssm
  # A CloudWatch alarm you apply to an automation or command.
  class Alarm
    include JSON::Serializable

    # The name of your CloudWatch alarm.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end
    end

    def_equals_and_hash(@name)
  end
end
