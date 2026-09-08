private alias AS = Amazonite::S3

module Amazonite::S3
  class GetBucketVersioningOutput
    # The versioning state of the bucket.
    property status : BucketVersioningStatus | Nil

    # Specifies whether MFA delete is enabled in the bucket versioning configuration. This element is
    # only returned if the bucket has been configured with MFA delete. If the bucket has never been so
    # configured, this element is not returned.
    property mfa_delete : MFADeleteStatus | Nil

    def initialize(
      @status : BucketVersioningStatus | Nil = nil,
      @mfa_delete : MFADeleteStatus | Nil = nil,
    )
    end

    # `root` is the element this shape is serialized under, which restXml
    # takes from the member binding it as the request payload rather than
    # from the shape's own name - they differ often enough (S3 sends a
    # CompletedMultipartUpload as <CompleteMultipartUpload>) that the caller
    # has to supply it.
    def to_xml(root : String) : String
      XML.build(indent: nil) do |xml|
        xml.element(root) { build_xml(xml) }
      end
    end

    def build_xml(xml : XML::Builder) : Nil
      if value = @status
        xml.element("Status") { xml.text value.to_json_object_key }
      end

      if value = @mfa_delete
        xml.element("MfaDelete") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='Status']")) ? AS::BucketVersioningStatus.from_json_object_key?(n.content) : nil,
        mfa_delete: (n = node.xpath_node("*[local-name()='MfaDelete']")) ? AS::MFADeleteStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status, @mfa_delete)
  end
end
