private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a storage location in Amazon S3.
  class StorageLocation
    # The name of the S3 bucket.
    property bucket : String | Nil

    # The key.
    property key : String | Nil

    def initialize(
      @bucket : String | Nil = nil,
      @key : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @bucket
        params << {"#{prefix}Bucket", value}
      end

      if value = @key
        params << {"#{prefix}Key", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='Bucket']")),
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@bucket, @key)
  end
end
