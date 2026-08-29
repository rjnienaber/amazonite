private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for `ListPlatformApplications` action.
  class ListPlatformApplicationsInput
    # `NextToken` string is used when calling `ListPlatformApplications` action to retrieve additional
    # records that are available after the first page results.
    property next_token : String | Nil

    def initialize(
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
