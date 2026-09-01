private alias Core = Amazonite::Core

module Amazonite::Ssm
  # A default version of a document.
  class DocumentDefaultVersionDescription
    include JSON::Serializable

    # The name of the document.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The default version of the document.
    @[JSON::Field(key: "DefaultVersion")]
    property default_version : String | Nil

    # The default version of the artifact associated with the document.
    @[JSON::Field(key: "DefaultVersionName")]
    property default_version_name : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @default_version : String | Nil = nil,
      @default_version_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @default_version
        raise Core::ValidationError.new("DefaultVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @default_version_name
        raise Core::ValidationError.new("DefaultVersionName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{1,128}$"))
      end
    end

    def_equals_and_hash(@name, @default_version, @default_version_name)
  end
end
