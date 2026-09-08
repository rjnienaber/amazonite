private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSnapshotAttributeResult
    # The product codes.
    property product_codes : Array(ProductCode) | Nil

    # The ID of the EBS snapshot.
    property snapshot_id : String | Nil

    # The users and groups that have the permissions for creating volumes from the snapshot.
    property create_volume_permissions : Array(CreateVolumePermission) | Nil

    def initialize(
      @product_codes : Array(ProductCode) | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @create_volume_permissions : Array(CreateVolumePermission) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@product_codes || [] of ProductCode).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ProductCodes.#{i}."))
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      (@create_volume_permissions || [] of CreateVolumePermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CreateVolumePermission.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        product_codes: node.xpath_nodes("*[local-name()='productCodes']/*[local-name()='item']").map { |n| ProductCode.from_xml(n) },
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        create_volume_permissions: node.xpath_nodes("*[local-name()='createVolumePermission']/*[local-name()='item']").map { |n| CreateVolumePermission.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @product_codes
        value.each(&.validate!)
      end

      if value = @create_volume_permissions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@product_codes, @snapshot_id, @create_volume_permissions)
  end
end
