private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an Active Directory.
  class DirectoryServiceAuthentication
    # The ID of the Active Directory used for authentication.
    property directory_id : String | Nil

    def initialize(
      @directory_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @directory_id
        params << {"#{prefix}DirectoryId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        directory_id: Core::XMLValue.string(node.xpath_node("*[local-name()='directoryId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@directory_id)
  end
end
