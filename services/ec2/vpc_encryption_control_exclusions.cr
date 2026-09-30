private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the exclusion configurations for various resource types in VPC Encryption Control.
  #
  # For more information, see [Enforce VPC encryption in
  # transit](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-encryption-controls.html) in the
  # *Amazon VPC User Guide*.
  class VpcEncryptionControlExclusions
    # The exclusion configuration for internet gateway traffic.
    property internet_gateway : VpcEncryptionControlExclusion | Nil

    # The exclusion configuration for egress-only internet gateway traffic.
    property egress_only_internet_gateway : VpcEncryptionControlExclusion | Nil

    # The exclusion configuration for NAT gateway traffic.
    property nat_gateway : VpcEncryptionControlExclusion | Nil

    # The exclusion configuration for virtual private gateway traffic.
    property virtual_private_gateway : VpcEncryptionControlExclusion | Nil

    # The exclusion configuration for VPC peering connection traffic.
    property vpc_peering : VpcEncryptionControlExclusion | Nil

    # The exclusion configuration for Lambda function traffic.
    property lambda : VpcEncryptionControlExclusion | Nil

    # The exclusion configuration for VPC Lattice traffic.
    property vpc_lattice : VpcEncryptionControlExclusion | Nil

    # The exclusion configuration for Elastic File System traffic.
    property elastic_file_system : VpcEncryptionControlExclusion | Nil

    def initialize(
      @internet_gateway : VpcEncryptionControlExclusion | Nil = nil,
      @egress_only_internet_gateway : VpcEncryptionControlExclusion | Nil = nil,
      @nat_gateway : VpcEncryptionControlExclusion | Nil = nil,
      @virtual_private_gateway : VpcEncryptionControlExclusion | Nil = nil,
      @vpc_peering : VpcEncryptionControlExclusion | Nil = nil,
      @lambda : VpcEncryptionControlExclusion | Nil = nil,
      @vpc_lattice : VpcEncryptionControlExclusion | Nil = nil,
      @elastic_file_system : VpcEncryptionControlExclusion | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @internet_gateway
        params.concat(value.to_query_params("#{prefix}InternetGateway."))
      end

      if value = @egress_only_internet_gateway
        params.concat(value.to_query_params("#{prefix}EgressOnlyInternetGateway."))
      end

      if value = @nat_gateway
        params.concat(value.to_query_params("#{prefix}NatGateway."))
      end

      if value = @virtual_private_gateway
        params.concat(value.to_query_params("#{prefix}VirtualPrivateGateway."))
      end

      if value = @vpc_peering
        params.concat(value.to_query_params("#{prefix}VpcPeering."))
      end

      if value = @lambda
        params.concat(value.to_query_params("#{prefix}Lambda."))
      end

      if value = @vpc_lattice
        params.concat(value.to_query_params("#{prefix}VpcLattice."))
      end

      if value = @elastic_file_system
        params.concat(value.to_query_params("#{prefix}ElasticFileSystem."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        internet_gateway: node.xpath_node("*[local-name()='internetGateway']").try { |n| VpcEncryptionControlExclusion.from_xml(n) },
        egress_only_internet_gateway: node.xpath_node("*[local-name()='egressOnlyInternetGateway']").try { |n| VpcEncryptionControlExclusion.from_xml(n) },
        nat_gateway: node.xpath_node("*[local-name()='natGateway']").try { |n| VpcEncryptionControlExclusion.from_xml(n) },
        virtual_private_gateway: node.xpath_node("*[local-name()='virtualPrivateGateway']").try { |n| VpcEncryptionControlExclusion.from_xml(n) },
        vpc_peering: node.xpath_node("*[local-name()='vpcPeering']").try { |n| VpcEncryptionControlExclusion.from_xml(n) },
        lambda: node.xpath_node("*[local-name()='lambda']").try { |n| VpcEncryptionControlExclusion.from_xml(n) },
        vpc_lattice: node.xpath_node("*[local-name()='vpcLattice']").try { |n| VpcEncryptionControlExclusion.from_xml(n) },
        elastic_file_system: node.xpath_node("*[local-name()='elasticFileSystem']").try { |n| VpcEncryptionControlExclusion.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @internet_gateway
        value.validate!
      end

      if value = @egress_only_internet_gateway
        value.validate!
      end

      if value = @nat_gateway
        value.validate!
      end

      if value = @virtual_private_gateway
        value.validate!
      end

      if value = @vpc_peering
        value.validate!
      end

      if value = @lambda
        value.validate!
      end

      if value = @vpc_lattice
        value.validate!
      end

      if value = @elastic_file_system
        value.validate!
      end
    end

    def_equals_and_hash(@internet_gateway, @egress_only_internet_gateway, @nat_gateway, @virtual_private_gateway, @vpc_peering, @lambda, @vpc_lattice, @elastic_file_system)
  end
end
