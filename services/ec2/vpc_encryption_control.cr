private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the configuration and state of VPC encryption controls.
  #
  # For more information, see [Enforce VPC encryption in
  # transit](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-encryption-controls.html) in the
  # *Amazon VPC User Guide*.
  class VpcEncryptionControl
    # The ID of the VPC associated with the encryption control configuration.
    property vpc_id : String | Nil

    # The ID of the VPC Encryption Control configuration.
    property vpc_encryption_control_id : String | Nil

    # The encryption mode for the VPC Encryption Control configuration.
    property mode : VpcEncryptionControlMode | Nil

    # The current state of the VPC Encryption Control configuration.
    property state : VpcEncryptionControlState | Nil

    # A message providing additional information about the encryption control state.
    property state_message : String | Nil

    # Information about resource exclusions for the VPC Encryption Control configuration.
    property resource_exclusions : VpcEncryptionControlExclusions | Nil

    # The tags assigned to the VPC Encryption Control configuration.
    property tags : Array(Tag) | Nil

    def initialize(
      @vpc_id : String | Nil = nil,
      @vpc_encryption_control_id : String | Nil = nil,
      @mode : VpcEncryptionControlMode | Nil = nil,
      @state : VpcEncryptionControlState | Nil = nil,
      @state_message : String | Nil = nil,
      @resource_exclusions : VpcEncryptionControlExclusions | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @vpc_encryption_control_id
        params << {"#{prefix}VpcEncryptionControlId", value}
      end

      if value = @mode
        params << {"#{prefix}Mode", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_message
        params << {"#{prefix}StateMessage", value}
      end

      if value = @resource_exclusions
        params.concat(value.to_query_params("#{prefix}ResourceExclusions."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        vpc_encryption_control_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcEncryptionControlId']")),
        mode: (n = node.xpath_node("*[local-name()='mode']")) ? AEC::VpcEncryptionControlMode.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::VpcEncryptionControlState.from_json_object_key?(n.content) : nil,
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='stateMessage']")),
        resource_exclusions: node.xpath_node("*[local-name()='resourceExclusions']").try { |n| VpcEncryptionControlExclusions.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @resource_exclusions
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpc_id, @vpc_encryption_control_id, @mode, @state, @state_message, @resource_exclusions, @tags)
  end
end
