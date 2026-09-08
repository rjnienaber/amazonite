private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies a cross-origin access rule for an Amazon S3 bucket.
  class CORSRule
    # Unique identifier for the rule. The value cannot be longer than 255 characters.
    property id : String | Nil

    # Headers that are specified in the `Access-Control-Request-Headers` header. These headers are
    # allowed in a preflight OPTIONS request. In response to any preflight OPTIONS request, Amazon S3
    # returns any requested headers that are allowed.
    property allowed_headers : Array(String) | Nil

    # An HTTP method that you allow the origin to execute. Valid values are `GET`, `PUT`, `HEAD`,
    # `POST`, and `DELETE`.
    property allowed_methods : Array(String) = [] of String

    # One or more origins you want customers to be able to access the bucket from.
    property allowed_origins : Array(String) = [] of String

    # One or more headers in the response that you want customers to be able to access from their
    # applications (for example, from a JavaScript `XMLHttpRequest` object).
    property expose_headers : Array(String) | Nil

    # The time in seconds that your browser is to cache the preflight response for the specified
    # resource.
    property max_age_seconds : Int32 | Nil

    def initialize(
      @allowed_methods : Array(String),
      @allowed_origins : Array(String),
      @id : String | Nil = nil,
      @allowed_headers : Array(String) | Nil = nil,
      @expose_headers : Array(String) | Nil = nil,
      @max_age_seconds : Int32 | Nil = nil,
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
      if value = @id
        xml.element("ID") { xml.text value }
      end

      (@allowed_headers || [] of String).each do |item|
        xml.element("AllowedHeader") { xml.text item }
      end

      @allowed_methods.each do |item|
        xml.element("AllowedMethod") { xml.text item }
      end

      @allowed_origins.each do |item|
        xml.element("AllowedOrigin") { xml.text item }
      end

      (@expose_headers || [] of String).each do |item|
        xml.element("ExposeHeader") { xml.text item }
      end

      if value = @max_age_seconds
        xml.element("MaxAgeSeconds") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='ID']")),
        allowed_headers: node.xpath_nodes("*[local-name()='AllowedHeader']").map { |n| n.content },
        allowed_methods: node.xpath_nodes("*[local-name()='AllowedMethod']").map { |n| n.content },
        allowed_origins: node.xpath_nodes("*[local-name()='AllowedOrigin']").map { |n| n.content },
        expose_headers: node.xpath_nodes("*[local-name()='ExposeHeader']").map { |n| n.content },
        max_age_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxAgeSeconds']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @allowed_headers, @allowed_methods, @allowed_origins, @expose_headers, @max_age_seconds)
  end
end
