private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # The status of a managed Contributor Insights rule.
  class ManagedRuleState
    include JSON::Serializable

    # The name of the Contributor Insights rule that contains data for the specified Amazon Web
    # Services resource.
    @[JSON::Field(key: "RuleName")]
    property rule_name : String

    # Indicates whether the rule is enabled or disabled.
    @[JSON::Field(key: "State")]
    property state : String

    def initialize(
      @rule_name : String,
      @state : String,
    )
    end

    def validate! : Nil
      if value = @rule_name
        raise Core::ValidationError.new("RuleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RuleName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("RuleName does not match the required pattern") unless value.matches?(Regex.new("^[\\x20-\\x7E]+$"))
      end

      if value = @state
        raise Core::ValidationError.new("State length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("State length must be <= 32") if value.size > 32
        raise Core::ValidationError.new("State does not match the required pattern") unless value.matches?(Regex.new("^[\\x20-\\x7E]+$"))
      end
    end

    def_equals_and_hash(@rule_name, @state)
  end
end
