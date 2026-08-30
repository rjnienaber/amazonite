private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetInstanceProfileRequest
    # The name of the instance profile to get information about.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property instance_profile_name : String

    def initialize(
      @instance_profile_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceProfileName", @instance_profile_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_profile_name: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceProfileName']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @instance_profile_name
        raise Core::ValidationError.new("InstanceProfileName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("InstanceProfileName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("InstanceProfileName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end
    end

    def_equals_and_hash(@instance_profile_name)
  end
end
