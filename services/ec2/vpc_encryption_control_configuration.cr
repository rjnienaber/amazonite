private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the configuration settings for VPC Encryption Control.
  #
  # For more information, see [Enforce VPC encryption in
  # transit](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-encryption-controls.html) in the
  # *Amazon VPC User Guide*.
  class VpcEncryptionControlConfiguration
    # The encryption mode for the VPC Encryption Control configuration.
    property mode : VpcEncryptionControlMode

    # Specifies whether to exclude internet gateway traffic from encryption enforcement.
    property internet_gateway_exclusion : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude egress-only internet gateway traffic from encryption enforcement.
    property egress_only_internet_gateway_exclusion : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude NAT gateway traffic from encryption enforcement.
    property nat_gateway_exclusion : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude virtual private gateway traffic from encryption enforcement.
    property virtual_private_gateway_exclusion : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude VPC peering connection traffic from encryption enforcement.
    property vpc_peering_exclusion : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude Lambda function traffic from encryption enforcement.
    property lambda_exclusion : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude VPC Lattice traffic from encryption enforcement.
    property vpc_lattice_exclusion : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude Elastic File System traffic from encryption enforcement.
    property elastic_file_system_exclusion : VpcEncryptionControlExclusionStateInput | Nil

    def initialize(
      @mode : VpcEncryptionControlMode,
      @internet_gateway_exclusion : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @egress_only_internet_gateway_exclusion : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @nat_gateway_exclusion : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @virtual_private_gateway_exclusion : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @vpc_peering_exclusion : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @lambda_exclusion : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @vpc_lattice_exclusion : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @elastic_file_system_exclusion : VpcEncryptionControlExclusionStateInput | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Mode", @mode.to_json_object_key}

      if value = @internet_gateway_exclusion
        params << {"#{prefix}InternetGatewayExclusion", value.to_json_object_key}
      end

      if value = @egress_only_internet_gateway_exclusion
        params << {"#{prefix}EgressOnlyInternetGatewayExclusion", value.to_json_object_key}
      end

      if value = @nat_gateway_exclusion
        params << {"#{prefix}NatGatewayExclusion", value.to_json_object_key}
      end

      if value = @virtual_private_gateway_exclusion
        params << {"#{prefix}VirtualPrivateGatewayExclusion", value.to_json_object_key}
      end

      if value = @vpc_peering_exclusion
        params << {"#{prefix}VpcPeeringExclusion", value.to_json_object_key}
      end

      if value = @lambda_exclusion
        params << {"#{prefix}LambdaExclusion", value.to_json_object_key}
      end

      if value = @vpc_lattice_exclusion
        params << {"#{prefix}VpcLatticeExclusion", value.to_json_object_key}
      end

      if value = @elastic_file_system_exclusion
        params << {"#{prefix}ElasticFileSystemExclusion", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        mode: ((n = node.xpath_node("*[local-name()='Mode']")) ? AEC::VpcEncryptionControlMode.from_json_object_key?(n.content) : nil).not_nil!,
        internet_gateway_exclusion: (n = node.xpath_node("*[local-name()='InternetGatewayExclusion']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        egress_only_internet_gateway_exclusion: (n = node.xpath_node("*[local-name()='EgressOnlyInternetGatewayExclusion']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        nat_gateway_exclusion: (n = node.xpath_node("*[local-name()='NatGatewayExclusion']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        virtual_private_gateway_exclusion: (n = node.xpath_node("*[local-name()='VirtualPrivateGatewayExclusion']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        vpc_peering_exclusion: (n = node.xpath_node("*[local-name()='VpcPeeringExclusion']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        lambda_exclusion: (n = node.xpath_node("*[local-name()='LambdaExclusion']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        vpc_lattice_exclusion: (n = node.xpath_node("*[local-name()='VpcLatticeExclusion']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        elastic_file_system_exclusion: (n = node.xpath_node("*[local-name()='ElasticFileSystemExclusion']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@mode, @internet_gateway_exclusion, @egress_only_internet_gateway_exclusion, @nat_gateway_exclusion, @virtual_private_gateway_exclusion, @vpc_peering_exclusion, @lambda_exclusion, @vpc_lattice_exclusion, @elastic_file_system_exclusion)
  end
end
