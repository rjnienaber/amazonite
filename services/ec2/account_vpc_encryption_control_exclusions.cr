private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the exclusion configurations for the various resource types in the account-level VPC
  # Encryption Control configuration.
  #
  # For more information, see [Enforce VPC encryption in
  # transit](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-encryption-controls.html) in the
  # *Amazon VPC User Guide*.
  class AccountVpcEncryptionControlExclusions
    # The exclusion configuration for internet gateway resource.
    property internet_gateway : VpcEncryptionControlExclusionState | Nil

    # The exclusion configuration for egress-only internet gateway resource.
    property egress_only_internet_gateway : VpcEncryptionControlExclusionState | Nil

    # The exclusion configuration for NAT gateway resource.
    property nat_gateway : VpcEncryptionControlExclusionState | Nil

    # The exclusion configuration for virtual private gateway resource.
    property virtual_private_gateway : VpcEncryptionControlExclusionState | Nil

    # The exclusion configuration for VPC peering connection resource.
    property vpc_peering : VpcEncryptionControlExclusionState | Nil

    # The exclusion configuration for Lambda service.
    property lambda : VpcEncryptionControlExclusionState | Nil

    # The exclusion configuration for VPC Lattice service.
    property vpc_lattice : VpcEncryptionControlExclusionState | Nil

    # The exclusion configuration for Elastic File System service.
    property elastic_file_system : VpcEncryptionControlExclusionState | Nil

    def initialize(
      @internet_gateway : VpcEncryptionControlExclusionState | Nil = nil,
      @egress_only_internet_gateway : VpcEncryptionControlExclusionState | Nil = nil,
      @nat_gateway : VpcEncryptionControlExclusionState | Nil = nil,
      @virtual_private_gateway : VpcEncryptionControlExclusionState | Nil = nil,
      @vpc_peering : VpcEncryptionControlExclusionState | Nil = nil,
      @lambda : VpcEncryptionControlExclusionState | Nil = nil,
      @vpc_lattice : VpcEncryptionControlExclusionState | Nil = nil,
      @elastic_file_system : VpcEncryptionControlExclusionState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @internet_gateway
        params << {"#{prefix}InternetGateway", value.to_json_object_key}
      end

      if value = @egress_only_internet_gateway
        params << {"#{prefix}EgressOnlyInternetGateway", value.to_json_object_key}
      end

      if value = @nat_gateway
        params << {"#{prefix}NatGateway", value.to_json_object_key}
      end

      if value = @virtual_private_gateway
        params << {"#{prefix}VirtualPrivateGateway", value.to_json_object_key}
      end

      if value = @vpc_peering
        params << {"#{prefix}VpcPeering", value.to_json_object_key}
      end

      if value = @lambda
        params << {"#{prefix}Lambda", value.to_json_object_key}
      end

      if value = @vpc_lattice
        params << {"#{prefix}VpcLattice", value.to_json_object_key}
      end

      if value = @elastic_file_system
        params << {"#{prefix}ElasticFileSystem", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        internet_gateway: (n = node.xpath_node("*[local-name()='internetGateway']")) ? AEC::VpcEncryptionControlExclusionState.from_json_object_key?(n.content) : nil,
        egress_only_internet_gateway: (n = node.xpath_node("*[local-name()='egressOnlyInternetGateway']")) ? AEC::VpcEncryptionControlExclusionState.from_json_object_key?(n.content) : nil,
        nat_gateway: (n = node.xpath_node("*[local-name()='natGateway']")) ? AEC::VpcEncryptionControlExclusionState.from_json_object_key?(n.content) : nil,
        virtual_private_gateway: (n = node.xpath_node("*[local-name()='virtualPrivateGateway']")) ? AEC::VpcEncryptionControlExclusionState.from_json_object_key?(n.content) : nil,
        vpc_peering: (n = node.xpath_node("*[local-name()='vpcPeering']")) ? AEC::VpcEncryptionControlExclusionState.from_json_object_key?(n.content) : nil,
        lambda: (n = node.xpath_node("*[local-name()='lambda']")) ? AEC::VpcEncryptionControlExclusionState.from_json_object_key?(n.content) : nil,
        vpc_lattice: (n = node.xpath_node("*[local-name()='vpcLattice']")) ? AEC::VpcEncryptionControlExclusionState.from_json_object_key?(n.content) : nil,
        elastic_file_system: (n = node.xpath_node("*[local-name()='elasticFileSystem']")) ? AEC::VpcEncryptionControlExclusionState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@internet_gateway, @egress_only_internet_gateway, @nat_gateway, @virtual_private_gateway, @vpc_peering, @lambda, @vpc_lattice, @elastic_file_system)
  end
end
