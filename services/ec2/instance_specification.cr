private alias Core = Amazonite::Core

module Amazonite::EC2
  # The instance details to specify which volumes should be snapshotted.
  class InstanceSpecification
    # The instance to specify which volumes should be snapshotted.
    property instance_id : String

    # Excludes the root volume from being snapshotted.
    property exclude_boot_volume : Bool | Nil

    # The IDs of the data (non-root) volumes to exclude from the multi-volume snapshot set. If you
    # specify the ID of the root volume, the request fails. To exclude the root volume, use
    # **ExcludeBootVolume**.
    #
    # You can specify up to 40 volume IDs per request.
    property exclude_data_volume_ids : Array(String) | Nil

    def initialize(
      @instance_id : String,
      @exclude_boot_volume : Bool | Nil = nil,
      @exclude_data_volume_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceId", @instance_id}

      if value = @exclude_boot_volume
        params << {"#{prefix}ExcludeBootVolume", Core::QueryValue.bool(value)}
      end

      (@exclude_data_volume_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ExcludeDataVolumeId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        exclude_boot_volume: Core::XMLValue.bool(node.xpath_node("*[local-name()='ExcludeBootVolume']")),
        exclude_data_volume_ids: node.xpath_nodes("*[local-name()='ExcludeDataVolumeId']/*[local-name()='VolumeId']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @exclude_boot_volume, @exclude_data_volume_ids)
  end
end
