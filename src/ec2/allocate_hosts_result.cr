module Amazonite::EC2
  # Contains the output of AllocateHosts.
  class AllocateHostsResult
    # The ID of the allocated Dedicated Host. This is used to launch an instance onto a specific host.
    property host_ids : Array(String) | Nil

    def initialize(
      @host_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@host_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}HostIdSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        host_ids: node.xpath_nodes("*[local-name()='hostIdSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@host_ids)
  end
end
