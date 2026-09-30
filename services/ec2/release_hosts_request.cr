module Amazonite::EC2
  class ReleaseHostsRequest
    # The IDs of the Dedicated Hosts to release.
    property host_ids : Array(String) = [] of String

    def initialize(
      @host_ids : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @host_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}HostId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        host_ids: node.xpath_nodes("*[local-name()='hostId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@host_ids)
  end
end
