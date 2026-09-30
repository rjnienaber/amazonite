private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateEnclaveCertificateIamRoleRequest
    # The ARN of the ACM certificate with which to associate the IAM role.
    property certificate_arn : String

    # The ARN of the IAM role to associate with the ACM certificate. You can associate up to 16 IAM
    # roles with an ACM certificate.
    property role_arn : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @certificate_arn : String,
      @role_arn : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}CertificateArn", @certificate_arn}

      params << {"#{prefix}RoleArn", @role_arn}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        certificate_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateArn']")).not_nil!,
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleArn']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@certificate_arn, @role_arn, @dry_run)
  end
end
