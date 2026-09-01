private alias Core = Amazonite::Core

module Amazonite::Sns
  # The response from the `CheckIfPhoneNumberIsOptedOut` action.
  class CheckIfPhoneNumberIsOptedOutResponse
    # Indicates whether the phone number is opted out:
    #
    # - `true` – The phone number is opted out, meaning you cannot publish SMS messages to it.
    #
    # - `false` – The phone number is opted in, meaning you can publish SMS messages to it.
    property is_opted_out : Bool | Nil

    def initialize(
      @is_opted_out : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @is_opted_out
        params << {"#{prefix}isOptedOut", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        is_opted_out: Core::XMLValue.bool(node.xpath_node("*[local-name()='isOptedOut']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@is_opted_out)
  end
end
