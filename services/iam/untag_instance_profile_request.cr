private alias Core = Amazonite::Core

module Amazonite::Iam
  class UntagInstanceProfileRequest
    # The name of the IAM instance profile from which you want to remove tags.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property instance_profile_name : String

    # A list of key names as a simple array of strings. The tags with matching keys are removed from
    # the specified instance profile.
    property tag_keys : Array(String) = [] of String

    def initialize(
      @instance_profile_name : String,
      @tag_keys : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceProfileName", @instance_profile_name}

      @tag_keys.each_with_index(1) do |item, i|
        params << {"#{prefix}TagKeys.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_profile_name: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceProfileName']")).not_nil!,
        tag_keys: node.xpath_nodes("*[local-name()='TagKeys']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @instance_profile_name
        raise Core::ValidationError.new("InstanceProfileName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("InstanceProfileName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("InstanceProfileName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @tag_keys
        raise Core::ValidationError.new("TagKeys must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("TagKeys must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@instance_profile_name, @tag_keys)
  end
end
