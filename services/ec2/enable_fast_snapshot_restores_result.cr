private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableFastSnapshotRestoresResult
    # Information about the snapshots for which fast snapshot restores were successfully enabled.
    property successful : Array(EnableFastSnapshotRestoreSuccessItem) | Nil

    # Information about the snapshots for which fast snapshot restores could not be enabled.
    property unsuccessful : Array(EnableFastSnapshotRestoreErrorItem) | Nil

    def initialize(
      @successful : Array(EnableFastSnapshotRestoreSuccessItem) | Nil = nil,
      @unsuccessful : Array(EnableFastSnapshotRestoreErrorItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful || [] of EnableFastSnapshotRestoreSuccessItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Successful.#{i}."))
      end

      (@unsuccessful || [] of EnableFastSnapshotRestoreErrorItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Unsuccessful.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful: node.xpath_nodes("*[local-name()='successful']/*[local-name()='item']").map { |n| EnableFastSnapshotRestoreSuccessItem.from_xml(n) },
        unsuccessful: node.xpath_nodes("*[local-name()='unsuccessful']/*[local-name()='item']").map { |n| EnableFastSnapshotRestoreErrorItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @successful
        value.each(&.validate!)
      end

      if value = @unsuccessful
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successful, @unsuccessful)
  end
end
