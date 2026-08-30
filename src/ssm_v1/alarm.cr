module Amazonite::SsmV1
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

    def_equals_and_hash(@name)
  end
end
