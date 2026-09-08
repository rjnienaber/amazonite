private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the user data for an instance.
  class UserData
    # The user data. If you are using an Amazon Web Services SDK or command line tool, Base64-encoding
    # is performed for you, and you can load the text from a file. Otherwise, you must provide
    # Base64-encoded text.
    property data : String | Nil

    def initialize(
      @data : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @data
        params << {"#{prefix}Data", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        data: Core::XMLValue.string(node.xpath_node("*[local-name()='data']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@data)
  end
end
