private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableEbsEncryptionByDefaultResult
    # The updated status of encryption by default.
    property ebs_encryption_by_default : Bool | Nil

    def initialize(
      @ebs_encryption_by_default : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ebs_encryption_by_default
        params << {"#{prefix}EbsEncryptionByDefault", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ebs_encryption_by_default: Core::XMLValue.bool(node.xpath_node("*[local-name()='ebsEncryptionByDefault']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ebs_encryption_by_default)
  end
end
