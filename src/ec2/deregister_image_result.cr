private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeregisterImageResult
    # Returns `true` if the request succeeds; otherwise, it returns an error.
    property return : Bool | Nil

    # The deletion result for each snapshot associated with the AMI, including the snapshot ID and its
    # success or error code.
    property delete_snapshot_results : Array(DeleteSnapshotReturnCode) | Nil

    def initialize(
      @return : Bool | Nil = nil,
      @delete_snapshot_results : Array(DeleteSnapshotReturnCode) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @return
        params << {"#{prefix}Return", Core::QueryValue.bool(value)}
      end

      (@delete_snapshot_results || [] of DeleteSnapshotReturnCode).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DeleteSnapshotResultSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        return: Core::XMLValue.bool(node.xpath_node("*[local-name()='return']")),
        delete_snapshot_results: node.xpath_nodes("*[local-name()='deleteSnapshotResultSet']/*[local-name()='item']").map { |n| DeleteSnapshotReturnCode.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @delete_snapshot_results
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@return, @delete_snapshot_results)
  end
end
