module Amazonite
  module DynamoDB
    class AutoScalingSettingsDescription
      include JSON::Serializable

      @[JSON::Field(key: "MinimumUnits")]
      property minimum_units : Int64 | Nil

      @[JSON::Field(key: "MaximumUnits")]
      property maximum_units : Int64 | Nil

      @[JSON::Field(key: "AutoScalingDisabled")]
      property auto_scaling_disabled : Bool | Nil

      @[JSON::Field(key: "AutoScalingRoleArn")]
      property auto_scaling_role_arn : String | Nil

      @[JSON::Field(key: "ScalingPolicies")]
      property scaling_policies : Array(AutoScalingPolicyDescription) | Nil

      def initialize(
        @minimum_units : Int64 | Nil = nil,
        @maximum_units : Int64 | Nil = nil,
        @auto_scaling_disabled : Bool | Nil = nil,
        @auto_scaling_role_arn : String | Nil = nil,
        @scaling_policies : Array(AutoScalingPolicyDescription) | Nil = nil
      )
      end
    end
  end
end
