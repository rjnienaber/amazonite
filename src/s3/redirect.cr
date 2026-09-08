private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies how requests are redirected. In the event of an error, you can specify a different
  # error code to return.
  class Redirect
    # The host name to use in the redirect request.
    property host_name : String | Nil

    # The HTTP redirect code to use on the response. Not required if one of the siblings is present.
    property http_redirect_code : String | Nil

    # Protocol to use when redirecting requests. The default is the protocol that is used in the
    # original request.
    property protocol : Protocol | Nil

    # The object key prefix to use in the redirect request. For example, to redirect requests for all
    # pages with prefix `docs/` (objects in the `docs/` folder) to `documents/`, you can set a
    # condition block with `KeyPrefixEquals` set to `docs/` and in the Redirect set
    # `ReplaceKeyPrefixWith` to `/documents`. Not required if one of the siblings is present. Can be
    # present only if `ReplaceKeyWith` is not provided.
    #
    # Replacement must be made for object keys containing special characters (such as carriage
    # returns) when using XML requests. For more information, see [ XML related object key
    # constraints](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints).
    property replace_key_prefix_with : String | Nil

    # The specific object key to use in the redirect request. For example, redirect request to
    # `error.html`. Not required if one of the siblings is present. Can be present only if
    # `ReplaceKeyPrefixWith` is not provided.
    #
    # Replacement must be made for object keys containing special characters (such as carriage
    # returns) when using XML requests. For more information, see [ XML related object key
    # constraints](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints).
    property replace_key_with : String | Nil

    def initialize(
      @host_name : String | Nil = nil,
      @http_redirect_code : String | Nil = nil,
      @protocol : Protocol | Nil = nil,
      @replace_key_prefix_with : String | Nil = nil,
      @replace_key_with : String | Nil = nil,
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
      if value = @host_name
        xml.element("HostName") { xml.text value }
      end

      if value = @http_redirect_code
        xml.element("HttpRedirectCode") { xml.text value }
      end

      if value = @protocol
        xml.element("Protocol") { xml.text value.to_json_object_key }
      end

      if value = @replace_key_prefix_with
        xml.element("ReplaceKeyPrefixWith") { xml.text value }
      end

      if value = @replace_key_with
        xml.element("ReplaceKeyWith") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        host_name: Core::XMLValue.string(node.xpath_node("*[local-name()='HostName']")),
        http_redirect_code: Core::XMLValue.string(node.xpath_node("*[local-name()='HttpRedirectCode']")),
        protocol: (n = node.xpath_node("*[local-name()='Protocol']")) ? AS::Protocol.from_json_object_key?(n.content) : nil,
        replace_key_prefix_with: Core::XMLValue.string(node.xpath_node("*[local-name()='ReplaceKeyPrefixWith']")),
        replace_key_with: Core::XMLValue.string(node.xpath_node("*[local-name()='ReplaceKeyWith']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@host_name, @http_redirect_code, @protocol, @replace_key_prefix_with, @replace_key_with)
  end
end
