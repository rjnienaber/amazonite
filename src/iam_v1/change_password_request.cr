private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ChangePasswordRequest
    property old_password : String

    property new_password : String

    def initialize(
      @old_password : String,
      @new_password : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}OldPassword", @old_password}

      params << {"#{prefix}NewPassword", @new_password}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        old_password: Core::XMLValue.string(node.xpath_node("*[local-name()='OldPassword']")).not_nil!,
        new_password: Core::XMLValue.string(node.xpath_node("*[local-name()='NewPassword']")).not_nil!,
      )
    end
  end
end
