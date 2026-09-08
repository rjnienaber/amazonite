module Amazonite::EC2
  # Describes the supported NitroTPM versions for the instance type.
  class NitroTpmInfo
    # Indicates the supported NitroTPM versions.
    property supported_versions : Array(String) | Nil

    def initialize(
      @supported_versions : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@supported_versions || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedVersions.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        supported_versions: node.xpath_nodes("*[local-name()='supportedVersions']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@supported_versions)
  end
end
