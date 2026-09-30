private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the EC2 Mac Dedicated Host.
  class MacHost
    # The EC2 Mac Dedicated Host ID.
    property host_id : String | Nil

    # The latest macOS versions that the EC2 Mac Dedicated Host can launch without being upgraded.
    property mac_os_latest_supported_versions : Array(String) | Nil

    def initialize(
      @host_id : String | Nil = nil,
      @mac_os_latest_supported_versions : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @host_id
        params << {"#{prefix}HostId", value}
      end

      (@mac_os_latest_supported_versions || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}MacOSLatestSupportedVersionSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        host_id: Core::XMLValue.string(node.xpath_node("*[local-name()='hostId']")),
        mac_os_latest_supported_versions: node.xpath_nodes("*[local-name()='macOSLatestSupportedVersionSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@host_id, @mac_os_latest_supported_versions)
  end
end
