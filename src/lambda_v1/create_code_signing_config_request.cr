private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class CreateCodeSigningConfigRequest
    include JSON::Serializable

    # Descriptive name for this code signing configuration.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # Signing profiles for this code signing configuration.
    @[JSON::Field(key: "AllowedPublishers")]
    property allowed_publishers : AllowedPublishers

    # The code signing policies define the actions to take if the validation checks fail.
    @[JSON::Field(key: "CodeSigningPolicies")]
    property code_signing_policies : CodeSigningPolicies | Nil

    # A list of tags to add to the code signing configuration.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @allowed_publishers : AllowedPublishers,
      @description : String | Nil = nil,
      @code_signing_policies : CodeSigningPolicies | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 256") if value.size > 256
      end

      if value = @allowed_publishers
        value.validate!
      end

      if value = @code_signing_policies
        value.validate!
      end
    end

    def_equals_and_hash(@description, @allowed_publishers, @code_signing_policies, @tags)
  end
end
