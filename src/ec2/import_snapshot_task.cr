private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an import snapshot task.
  class ImportSnapshotTask
    # A description of the import snapshot task.
    property description : String | Nil

    # The ID of the import snapshot task.
    property import_task_id : String | Nil

    # Describes an import snapshot task.
    property snapshot_task_detail : SnapshotTaskDetail | Nil

    # The tags for the import snapshot task.
    property tags : Array(Tag) | Nil

    def initialize(
      @description : String | Nil = nil,
      @import_task_id : String | Nil = nil,
      @snapshot_task_detail : SnapshotTaskDetail | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @import_task_id
        params << {"#{prefix}ImportTaskId", value}
      end

      if value = @snapshot_task_detail
        params.concat(value.to_query_params("#{prefix}SnapshotTaskDetail."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        import_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='importTaskId']")),
        snapshot_task_detail: node.xpath_node("*[local-name()='snapshotTaskDetail']").try { |n| SnapshotTaskDetail.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @snapshot_task_detail
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @import_task_id, @snapshot_task_detail, @tags)
  end
end
