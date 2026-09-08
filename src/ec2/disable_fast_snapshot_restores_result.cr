private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableFastSnapshotRestoresResult
    # Information about the snapshots for which fast snapshot restores were successfully disabled.
    property successful : Array(DisableFastSnapshotRestoreSuccessItem) | Nil

    # Information about the snapshots for which fast snapshot restores could not be disabled.
    property unsuccessful : Array(DisableFastSnapshotRestoreErrorItem) | Nil

    def initialize(
      @successful : Array(DisableFastSnapshotRestoreSuccessItem) | Nil = nil,
      @unsuccessful : Array(DisableFastSnapshotRestoreErrorItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful || [] of DisableFastSnapshotRestoreSuccessItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Successful.#{i}."))
      end

      (@unsuccessful || [] of DisableFastSnapshotRestoreErrorItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Unsuccessful.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful: node.xpath_nodes("*[local-name()='successful']/*[local-name()='item']").map { |n| DisableFastSnapshotRestoreSuccessItem.from_xml(n) },
        unsuccessful: node.xpath_nodes("*[local-name()='unsuccessful']/*[local-name()='item']").map { |n| DisableFastSnapshotRestoreErrorItem.from_xml(n) },
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
