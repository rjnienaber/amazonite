private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the redirect behavior of all requests to a website endpoint of an Amazon S3 bucket.
  class RedirectAllRequestsTo
    # Name of the host where requests are redirected.
    property host_name : String

    # Protocol to use when redirecting requests. The default is the protocol that is used in the
    # original request.
    property protocol : Protocol | Nil

    def initialize(
      @host_name : String,
      @protocol : Protocol | Nil = nil,
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
      xml.element("HostName") { xml.text @host_name }

      if value = @protocol
        xml.element("Protocol") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        host_name: Core::XMLValue.string(node.xpath_node("*[local-name()='HostName']")).not_nil!,
        protocol: (n = node.xpath_node("*[local-name()='Protocol']")) ? AS::Protocol.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@host_name, @protocol)
  end
end
