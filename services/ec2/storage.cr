private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the storage location for an instance store-backed AMI.
  class Storage
    # An Amazon S3 storage location.
    property s3 : S3Storage | Nil

    def initialize(
      @s3 : S3Storage | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @s3
        params.concat(value.to_query_params("#{prefix}S3."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        s3: node.xpath_node("*[local-name()='S3']").try { |n| S3Storage.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @s3
        value.validate!
      end
    end

    def_equals_and_hash(@s3)
  end
end
