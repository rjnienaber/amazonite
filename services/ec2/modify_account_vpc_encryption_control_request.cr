private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyAccountVpcEncryptionControlRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The encryption mode for the account encryption control configuration.
    property mode : AccountVpcEncryptionControlMode | Nil

    # Specifies whether to exclude internet gateway resource from account-level encryption
    # enforcement.
    property internet_gateway : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude egress-only internet gateway resource from account-level encryption
    # enforcement.
    property egress_only_internet_gateway : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude NAT gateway resource from account-level encryption enforcement.
    property nat_gateway : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude virtual private gateway resource from account-level encryption
    # enforcement.
    property virtual_private_gateway : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude VPC peering connection resource from account-level encryption
    # enforcement.
    property vpc_peering : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude Lambda service from account-level encryption enforcement.
    property lambda : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude VPC Lattice service from account-level encryption enforcement.
    property vpc_lattice : VpcEncryptionControlExclusionStateInput | Nil

    # Specifies whether to exclude Elastic File System service from account-level encryption
    # enforcement.
    property elastic_file_system : VpcEncryptionControlExclusionStateInput | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @mode : AccountVpcEncryptionControlMode | Nil = nil,
      @internet_gateway : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @egress_only_internet_gateway : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @nat_gateway : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @virtual_private_gateway : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @vpc_peering : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @lambda : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @vpc_lattice : VpcEncryptionControlExclusionStateInput | Nil = nil,
      @elastic_file_system : VpcEncryptionControlExclusionStateInput | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @mode
        params << {"#{prefix}Mode", value.to_json_object_key}
      end

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
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        mode: (n = node.xpath_node("*[local-name()='Mode']")) ? AEC::AccountVpcEncryptionControlMode.from_json_object_key?(n.content) : nil,
        internet_gateway: (n = node.xpath_node("*[local-name()='InternetGateway']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        egress_only_internet_gateway: (n = node.xpath_node("*[local-name()='EgressOnlyInternetGateway']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        nat_gateway: (n = node.xpath_node("*[local-name()='NatGateway']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        virtual_private_gateway: (n = node.xpath_node("*[local-name()='VirtualPrivateGateway']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        vpc_peering: (n = node.xpath_node("*[local-name()='VpcPeering']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        lambda: (n = node.xpath_node("*[local-name()='Lambda']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        vpc_lattice: (n = node.xpath_node("*[local-name()='VpcLattice']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
        elastic_file_system: (n = node.xpath_node("*[local-name()='ElasticFileSystem']")) ? AEC::VpcEncryptionControlExclusionStateInput.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @mode, @internet_gateway, @egress_only_internet_gateway, @nat_gateway, @virtual_private_gateway, @vpc_peering, @lambda, @vpc_lattice, @elastic_file_system)
  end
end
