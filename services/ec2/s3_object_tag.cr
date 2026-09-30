private alias Core = Amazonite::Core

module Amazonite::EC2
  # The tags to apply to the AMI object that will be stored in the Amazon S3 bucket. For more
  # information, see [Categorizing your storage using
  # tags](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-tagging.html) in the *Amazon
  # Simple Storage Service User Guide*.
  class S3ObjectTag
    # The key of the tag.
    #
    # Constraints: Tag keys are case-sensitive and can be up to 128 Unicode characters in length. May
    # not begin with `aws`:.
    property key : String | Nil

    # The value of the tag.
    #
    # Constraints: Tag values are case-sensitive and can be up to 256 Unicode characters in length.
    property value : String | Nil

    def initialize(
      @key : String | Nil = nil,
      @value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @key
        params << {"#{prefix}Key", value}
      end

      if value = @value
        params << {"#{prefix}Value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")),
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='Value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@key, @value)
  end
end
