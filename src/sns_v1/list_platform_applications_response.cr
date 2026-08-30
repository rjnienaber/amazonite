private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Response for `ListPlatformApplications` action.
  class ListPlatformApplicationsResponse
    # Platform applications returned when calling `ListPlatformApplications` action.
    property platform_applications : Array(PlatformApplication) | Nil

    # `NextToken` string is returned when calling `ListPlatformApplications` action if additional
    # records are available after the first page results.
    property next_token : String | Nil

    def initialize(
      @platform_applications : Array(PlatformApplication) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@platform_applications || [] of PlatformApplication).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PlatformApplications.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        platform_applications: node.xpath_nodes("*[local-name()='PlatformApplications']/*[local-name()='member']").map { |n| PlatformApplication.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @platform_applications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@platform_applications, @next_token)
  end
end
