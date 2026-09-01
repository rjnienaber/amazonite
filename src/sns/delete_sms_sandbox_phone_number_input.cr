private alias Core = Amazonite::Core

module Amazonite::Sns
  class DeleteSMSSandboxPhoneNumberInput
    # The destination phone number to delete.
    property phone_number : String

    def initialize(
      @phone_number : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PhoneNumber", @phone_number}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        phone_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PhoneNumber']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @phone_number
        raise Core::ValidationError.new("PhoneNumber length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("PhoneNumber length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("PhoneNumber does not match the required pattern") unless value.matches?(Regex.new("^(\\+[0-9]{8,}|[0-9]{0,9})$"))
      end
    end

    def_equals_and_hash(@phone_number)
  end
end
